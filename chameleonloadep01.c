/*********************  P r o g r a m  -  M o d u l e ***********************/
/*!
 *        \file  chameleonloadep01.c
 *
 *      \author  klaus.popp@men.de/rene.lange@men.de
 *        $Date: 2010/04/22 11:03:04 $
 *    $Revision: 2.3 $
 *
 *	   \project  EP01
 *  	 \brief  load routine for FPGA on EP01
 *
 *    \switches   _LITTLE_ENDIAN_ / _BIG_ENDIAN_, MENMON
 */
/*-------------------------------[ History ]---------------------------------
 *
 * $Log: chameleonloadep01.c,v $
 * Revision 2.3  2010/04/22 11:03:04  rlange
 * R: Sometimes Fallback is loaded
 * M: Tune timing to get closer on specification timing
 *
 * Revision 2.2  2006/07/12 12:21:27  rla
 * Removed Debugs
 *
 * Revision 2.1  2006/07/11 16:11:37  rla
 * Initial Revision
 *
 *
 *---------------------------------------------------------------------------
 * (c) Copyright 2006 by MEN Mikro Elektronik GmbH, Nuremberg, Germany
 ****************************************************************************/
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
#include <MEN/ep01_cfg.h>
#include <MEN/chameleon.h>


/*-----------------------------------------+
|  DEFINES                                 |
+------------------------------------------*/

#define MCRWR( _ma, _val ) \
 do { MWRITE_D8(_ma, EP01_CPLD_MCR,_val); } while(0);

#define MCRRD( _ma ) \
 MREAD_D8(_ma, EP01_CPLD_MCR)

/*-----------------------------------------+
|  GLOBALS                                 |
+------------------------------------------*/



/**********************************************************************/
/** routine to load the FPGA code into the EP01's chameleon FPGA
 *
 *  This routine (re)loads the FPGA on EP01 with the code specified
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
int32 ChameleonLoadEp01(
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
	latchcfg = EP01_CPLD_MCR_FPGA_CONFIG |
		( MCRRD( maFpga ) & (EP01_CPLD_MCR_WD_TIME_MASK|EP01_CPLD_MCR_WD_DIS));

	/* set config to HIGH */
	MCRWR(maFpga, latchcfg);
	OSS_MikroDelay( osh, 50 );

	/* pulse CONFIG low */
	MCRWR( maFpga, (latchcfg & ~EP01_CPLD_MCR_FPGA_CONFIG));
	OSS_MikroDelay( osh, 50 );

	/* check if status is LOW */
	if ( MCRRD( maFpga ) & EP01_CPLD_MCR_FPGA_CONF_STATUS )
	{
		error = CHAMELEON_CONF_STAT_ERR;
		goto ERREXIT;
	}
	/* pulse CONFIG High */
	MCRWR( maFpga, latchcfg);

	/* check if status is HIGH (max. 40 µs) */
	OSS_MikroDelay( osh, 50 );

	if ( !(MCRRD( maFpga ) & EP01_CPLD_MCR_FPGA_CONF_STATUS) )
	{
		error = CHAMELEON_CONF_STAT_ERR;
		goto ERREXIT;
	}

	/* If Status PIN high state is verified, it takes another 40 µs until
	   data transmission can start */
	OSS_MikroDelay( osh, 50 );

	/* transfer code */
	while (size--)
	{
		ch = MREAD_D8(maData, cnt++);
		n = 8;

		while(n--) 							/* for all bits (0..7) */
		{
			/* build package CONFIG = HIGH, CLOCK = LOW, DATA = 0|1 */
			MCRWR( maFpga, (latchcfg |
							((ch&0x01) * EP01_CPLD_MCR_FPGA_DATA)));

			/* build package CONFIG = HIGH, CLOCK = HIGH, DATA = 0|1 */
			MCRWR( maFpga, (latchcfg | EP01_CPLD_MCR_FPGA_CLK |
							((ch&0x01) * EP01_CPLD_MCR_FPGA_DATA)));

			ch >>= 1;						/* next bit */

		}/* end while */

		/* check CONF_STATUS every 256 bytes */
		if (! (size & 0xff))
		{
			if ( !( MCRRD( maFpga ) & EP01_CPLD_MCR_FPGA_CONF_STATUS) )
			{
				error = CHAMELEON_LOAD_ERR;
				goto ERREXIT;
			}
		}
	}/* end while */

	/* check CONF_STATUS at the end */
	if ( !( MCRRD( maFpga ) & EP01_CPLD_MCR_FPGA_CONF_STATUS) )
	{
		error = CHAMELEON_LOAD_ERR;
		goto ERREXIT;
	}/* end if */

	/* wait for init done */
	OSS_MikroDelay( osh, 50 );	/* delay a bit. This makes the timing */

	/* check if init done */
	if ( !( MCRRD( maFpga ) & EP01_CPLD_MCR_FPGA_INIT_DONE) )
	{
		error = CHAMELEON_INIT_DONE_ERR;
		goto ERREXIT;
	}

ERREXIT:
	return error;
}
