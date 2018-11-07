/*********************  P r o g r a m  -  M o d u l e ***********************/
/*!
 *        \file  chameleonloadem03.c
 *
 *      \author  klaus.popp@men.de/rene.lange@men.de
 *        $Date: 2008/08/27 10:34:38 $
 *    $Revision: 2.2 $
 *
 *	   \project  EM03
 *  	 \brief  load routine for FPGA on EM03
 *
 *    \switches   _LITTLE_ENDIAN_ / _BIG_ENDIAN_, MENMON
 */
/*
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
#include <MEN/chameleon.h>


/*-----------------------------------------+
|  DEFINES                                 |
+------------------------------------------*/
#define EM03LOAD_LATCH_FPGA_CONF_STATUS	0x02 /* r */
#define EM03LOAD_LATCH_FPGA_INIT_DONE	0x01 /* r */

#define EM03LOAD_LATCH_FPGA_CONFIG		0x4 /* w */
#define EM03LOAD_LATCH_FPGA_CLK			0x2 /* w */
#define EM03LOAD_LATCH_FPGA_DATA		0x1 /* w */


#define LATCHWR( _ma, _off, _val ) \
 do { MWRITE_D32(_ma,_off,_val); /*MREAD_D32(_ma,_off);*/ } while(0);

/*-----------------------------------------+
|  GLOBALS                                 |
+------------------------------------------*/



/**********************************************************************/
/** routine to load the FPGA code into the EM03's chameleon FPGA
 *
 *  This routine (re)loads the FPGA on EM03 with the code specified
 *  with \a fpgaCode.
 *
 *  The FPGA header magic and the FPGA code's XOR checksum is checked
 *
 *  This routine can be called without calling ChameleonInit() before
 *  loading.
 *
 *  Since this routine accesses the RCS2 latch, the calling routine must
 *  allow (setup MMU or BATs) access to the latch.
 *
 *  OSS_MikroDelayInit() must have been called before.
 *
 *  \param osh			OSS handle
 *  \param fpgaCode		FPGA header followed by code (generated with
 *						fpga_addheader)
 *  \param pldRegBase	register base of PLD (CS2)
 *
 *  \return 0=ok, or error number CHAMELEON_xxx
 */
int32 ChameleonLoadEm03(
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
	latchcfg = EM03LOAD_LATCH_FPGA_CONFIG;

	/* set config to HIGH */
	LATCHWR(maFpga, 0, latchcfg);
	OSS_MikroDelay( osh, 50 );

	/* pulse CONFIG low */
	LATCHWR( maFpga, 0, (latchcfg & ~EM03LOAD_LATCH_FPGA_CONFIG));
	OSS_MikroDelay( osh, 50 );

	/* check if status is LOW */
	OSS_MikroDelay( osh, 10 );

	if ( (MREAD_D32( maFpga, 0) & EM03LOAD_LATCH_FPGA_CONF_STATUS) )
	{
		error = CHAMELEON_CONF_STAT_ERR;
		goto ERREXIT;
	}
	LATCHWR( maFpga, 0, latchcfg);

	/* check if status is HIGH */
	OSS_MikroDelay( osh, 30 );

	if ( !(MREAD_D32( maFpga,0 ) & EM03LOAD_LATCH_FPGA_CONF_STATUS) )
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
			LATCHWR( maFpga, 0,(latchcfg |
								  ((ch&0x01) * EM03LOAD_LATCH_FPGA_DATA)));

			/* build package CONFIG = HIGH, CLOCK = HIGH, DATA = 0|1 */
			LATCHWR( maFpga, 0, (latchcfg | EM03LOAD_LATCH_FPGA_CLK |
								   ((ch&0x01) * EM03LOAD_LATCH_FPGA_DATA)));

			ch >>= 1;						/* next bit */

		}/* end while */

		/* check CONF_STATUS every 256 bytes */
		if (! (size & 0xff))
		{
			if ( !( MREAD_D32(maFpga, 0) & EM03LOAD_LATCH_FPGA_CONF_STATUS) )
			{
				error = CHAMELEON_LOAD_ERR;
				goto ERREXIT;
			}
		}
	}/* end while */

	/* check CONF_STATUS at the end */
	if ( !( MREAD_D32( maFpga, 0) & EM03LOAD_LATCH_FPGA_CONF_STATUS) )
	{
		error = CHAMELEON_LOAD_ERR;
		goto ERREXIT;
	}/* end if */

	/* wait for init done */
	OSS_MikroDelay( osh, 40 );	/* delay a bit. This makes the timing */

	/* check if init done */
	if ( !( MREAD_D32( maFpga, 0) & EM03LOAD_LATCH_FPGA_INIT_DONE) )
	{
		error = CHAMELEON_INIT_DONE_ERR;
		goto ERREXIT;
	}

ERREXIT:
	return error;
}

