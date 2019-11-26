/***********************  I n c l u d e  -  F i l e  ***********************/
/**
 *         \file chameleon_int.h
 *
 *       \author dieter.pfeuffer@men.de
 *
 *        \brief Internal header file for chameleon library
 *
 *     Switches: _LITTLE_ENDIAN_ / _BIG_ENDIAN_
 *               _DOXYGEN_ - to build proper doxygen documentation
 */
/*
 *---------------------------------------------------------------------------
 * Copyright 2019, MEN Mikro Elektronik GmbH
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

#ifndef _CHAMELEON_INT_H
#define _CHAMELEON_INT_H

#ifdef __cplusplus
	extern "C" {
#endif


/*--------------------------------------*/
/*    INCLUDES                          */
/*--------------------------------------*/
#include <MEN/men_typs.h>
#include <MEN/chameleon.h>


#if defined(VXWORKS) && defined(MAC_IO_MAPPED) && CPU_FAMILY==PPC
# undef MAC_IO_MAPPED
# ifndef MAC_MEM_MAPPED
# define MAC_MEM_MAPPED
# endif
# include <MEN/maccess.h>
# undef MAC_MEM_MAPPED
# define MAC_IO_MAPPED
#else
#include <MEN/maccess.h>
#endif

#include <MEN/dbg.h>

/*--------------------------------------*/
/*	DEFINES			            		*/
/*--------------------------------------*/
/* Layout of the shared RAM (offsets) */
#if ((defined (_LITTLE_ENDIAN_) && !(defined (MAC_BYTESWAP))) || \
    (defined (_BIG_ENDIAN_) && defined (MAC_BYTESWAP)))

# define SWAPWORD(w) (w)
# define SWAPLONG(l) (l)

#elif ((defined (_BIG_ENDIAN_) && !(defined (MAC_BYTESWAP))) || \
      (defined (_LITTLE_ENDIAN_) && defined (MAC_BYTESWAP)) )

# define SWAPWORD(w) ((((w)&0xff)<<8) + (((w)&0xff00)>>8))
# define SWAPLONG(l) ((((l)&0xff)<<24) + (((l)&0xff00)<<8) + \
					 (((l)&0xff0000)>>8) + (((l)&0xff000000)>>24))

#else
#error "Invalid combination of _LITTLE_ENDIAN_, _BIG_ENDIAN_ and MAC_BYTESWAP !"
#endif

#define CFGTABLE_SIZE 0x80
#define CFGTABLE_MA(h) 			  ((MACCESS)(U_INT32_OR_64)(h)->bar[0])

#define CFGTABLE_READWORD(ma,idx) SWAPWORD(MREAD_D16(ma,(idx)*4))
#define CFGTABLE_READLONG(ma,idx) SWAPLONG(MREAD_D32(ma,(idx)*4))

#if defined(LINUX) || defined(__QNXNTO__) || defined(WINNT)
#  define MAP_REQUIRED
#endif

#define NBR_OF_BARS 6
#define BIT4BAR(bar) (0x1 << (bar))


/*
 * Chameleon-V2 Table Map
 */		

/* header */
#define CHAV2_HEADER_LSIZE	5	/* nbr of longs */

/* unit/bridge/cpu (0x00) */
#define CHAV2_DTYPE_MASK	0xf0000000
#define CHAV2_DTYPE_SHIFT	28

#define CHAV2_DTYPE_UNIT	0x0
#define CHAV2_DTYPE_BRG		0x1
#define CHAV2_DTYPE_CPU		0x2
#define CHAV2_DTYPE_BAR		0x3
#define CHAV2_DTYPE_END		0xf
		
/* unit */
#define CHAV2_UNIT_LSIZE		4	/* nbr of longs */

/* bridge */
#define CHAV2_BRG_LSIZE			5	/* nbr of longs */

/* cpu */
#define CHAV2_CPU_LSIZE			3	/* nbr of longs */

/* cpu */
#define CHAV2_BA_LSIZE(count)	(1 + ((count)*2))	/* nbr of longs */


#ifdef __cplusplus
	}
#endif

#endif	/* _CHAMELEON_INT_H */




