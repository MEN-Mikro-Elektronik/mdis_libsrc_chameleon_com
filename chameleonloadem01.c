/*********************  P r o g r a m  -  M o d u l e ***********************/
/*!
 *        \file  chameleonloadem01.c
 *
 *      \author  klaus.popp@men.de/rene.lange@men.de
 *        $Date: 2008/08/27 10:33:19 $
 *    $Revision: 2.3 $
 *
 *	   \project  EM01
 *  	 \brief  load routine for FPGA on EM01
 *
 *    \switches   _LITTLE_ENDIAN_ / _BIG_ENDIAN_, MENMON
 */
/*-------------------------------[ History ]---------------------------------
 *
 * $Log: chameleonloadem01.c,v $
 * Revision 2.3  2008/08/27 10:33:19  cs
 * R: fpga loading failed once use of INIT_DONE enabled in FPGA (ERR 0xB4)
 *     - CYCLONE II needs max. 40us from CONFIG_DONE to INIT_DONE (tCD2UM)
 * M: extended wait time before checking INIT_DONE from 20 to 40us
 *
 * Revision 2.2  2005/06/24 08:19:40  kp
 * Copyright line changed (sbo)
 *
 * Revision 2.1  2005/03/16 16:51:06  kp
 * Initial Revision
 *
 *---------------------------------------------------------------------------
 * (c) Copyright 2004 by MEN Mikro Elektronik GmbH, Nuremberg, Germany
 ******************************************************************************/
/*
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
/*-----------------------------------------+
|  INCLUDES                                |
+------------------------------------------*/
#ifdef MENMON
# include <mmglob.h>			/* for strncmp */
#else
# include <string.h>
#endif

#include <MEN/men_typs.h>
#include <MEN/oss.h>
#include <MEN/dbg.h>
#include <MEN/maccess.h>
#include <MEN/fpga_header.h>
#include <MEN/em01_cfg.h>
#include <MEN/chameleon.h>


/*-----------------------------------------+
|  DEFINES                                 |
+------------------------------------------*/

#define MCRWR( _ma, _val ) \
 do { MWRITE_D8(_ma, EM01_CPLD_MCR,_val); } while(0);

#define MCRRD( _ma ) \
 MREAD_D8(_ma, EM01_CPLD_MCR)

/*-----------------------------------------+
|  GLOBALS                                 |
+------------------------------------------*/



/**********************************************************************/
/** routine to load the FPGA code into the EM01's chameleon FPGA
 *
 *  This routine (re)loads the FPGA on EM01 with the code specified
 *  with \a fpgaCode.
 *
 *  The FPGA header magic and the FPGA code's XOR checksum is checked
 *
 *  This routine can be called without calling ChameleonInit() before
 *  loading.
 *
 *  Since this routine accesses the CPLD, the calling routine must
 *  allow (setup MMU or BATs) access to the CPLD (CS1).
 *
 *  OSS_MikroDelayInit() must have been called before.
 *
 *  \param osh			OSS handle
 *  \param fpgaCode		FPGA header followed by code (generated with
 *						fpga_addheader)
 *  \param pldRegBase	register base of PLD (CS1)
 *
 *  \return 0=ok, or error number CHAMELEON_xxx
 */
int32 ChameleonLoadEm01(
	OSS_HANDLE *osh,
	const FPGA_HEADER *fpgaCode,
	void *pldRegBase )
{
	register u_int8 ch, latchcfg;
	register u_int32 n;
	u_int32 size,cnt=0;
	MACCESS maFpga = (MACCESS)pldRegBase;
	MACCESS maData;
	int32 error=0;
	FPGA_HEADER_INFO info;

	/* check if header valid */
	if( (error = ChameleonFpgaHeaderIdent( fpgaCode, 0x100000, &info )) != 0 )
		return error;

	/* check code XOR */
	if( (error = ChameleonFpgaDataCheckXor( &info ) ) != 0 )
		return error;

	/* get size and start of netto data */
	size = info.size;
	maData = (MACCESS)info.data;

	/*--------------------------------+
	| Load FPGA code                  |
	+---------------------------------*/
	latchcfg = EM01_CPLD_MCR_FPGA_CONFIG |
		( MCRRD( maFpga ) & (EM01_CPLD_MCR_WD_TIME_MASK|EM01_CPLD_MCR_WD_DIS));

	/* set config to HIGH */
	MCRWR(maFpga, latchcfg);
	OSS_MikroDelay( osh, 50 );

	/* pulse CONFIG low */
	MCRWR( maFpga, (latchcfg & ~EM01_CPLD_MCR_FPGA_CONFIG));
	OSS_MikroDelay( osh, 50 );

	/* check if status is LOW */
	OSS_MikroDelay( osh, 10 );

	if ( MCRRD( maFpga ) & EM01_CPLD_MCR_FPGA_CONF_STATUS )
	{
		error = CHAMELEON_CONF_STAT_ERR;
		goto ERREXIT;
	}
	MCRWR( maFpga, latchcfg);

	/* check if status is HIGH */
	OSS_MikroDelay( osh, 30 );

	if ( !(MCRRD( maFpga ) & EM01_CPLD_MCR_FPGA_CONF_STATUS) )
	{
		error = CHAMELEON_CONF_STAT_ERR;
		goto ERREXIT;
	}


	/* transfer code */
	while (size--)
	{
		ch = MREAD_D8(maData, cnt++);
		n = 8;

		while(n--) 							/* for all bits (0..7) */
		{
			/* build package CONFIG = HIGH, CLOCK = LOW, DATA = 0|1 */
			MCRWR( maFpga, (latchcfg |
							((ch&0x01) * EM01_CPLD_MCR_FPGA_DATA)));

			/* build package CONFIG = HIGH, CLOCK = HIGH, DATA = 0|1 */
			MCRWR( maFpga, (latchcfg | EM01_CPLD_MCR_FPGA_CLK |
							((ch&0x01) * EM01_CPLD_MCR_FPGA_DATA)));

			ch >>= 1;						/* next bit */

		}/* end while */

		/* check CONF_STATUS every 256 bytes */
		if (! (size & 0xff))
		{
			if ( !( MCRRD( maFpga ) & EM01_CPLD_MCR_FPGA_CONF_STATUS) )
			{
				error = CHAMELEON_LOAD_ERR;
				goto ERREXIT;
			}
		}
	}/* end while */

	/* check CONF_STATUS at the end */
	if ( !( MCRRD( maFpga ) & EM01_CPLD_MCR_FPGA_CONF_STATUS) )
	{
		error = CHAMELEON_LOAD_ERR;
		goto ERREXIT;
	}/* end if */

	/* wait for init done */
	OSS_MikroDelay( osh, 40 );	/* delay a bit. This makes the timing */

	/* check if init done */
	if ( !( MCRRD( maFpga ) & EM01_CPLD_MCR_FPGA_INIT_DONE) )
	{
		error = CHAMELEON_INIT_DONE_ERR;
		goto ERREXIT;
	}

ERREXIT:
	return error;
}

