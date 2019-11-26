/*********************  P r o g r a m  -  M o d u l e ***********************/
/*!
 *        \file  chameleon_strings.c
 *
 *      \author  kp
 *
 *        \brief  String routines for chameleon library
 *
 *     Switches: -
 */
 /*
 *---------------------------------------------------------------------------
 * Copyright 2003-2019, MEN Mikro Elektronik GmbH
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

#ifdef CHAM_UNITTEST
	#include "../UNITTEST/COM/cha_ut.h"
#endif

#define _CHAMELEON_STRINGS_C
/*--------------------------------------*/
/*    INCLUDES                          */
/*--------------------------------------*/
#include <MEN/men_typs.h>
#include <MEN/chameleon.h>

/**
 * \defgroup _CHAM_CODE_FUNC Chameleon Code Functions
 *  @{
 */

/**********************************************************************/
/** convert module-code to unit name
 *
 *	\param modCode		Chameleon-V0 module-code
 *
 *  \return const string with module name or "?" if unknown
 */
const char *ChameleonModName( u_int16 modCode )
{
	int i;

	for( i=0; G_ChamTbl[i].name; i++ ){
		if( G_ChamTbl[i].modCode == modCode )
			return G_ChamTbl[i].name;
	}
	return "?";
}

/**********************************************************************/
/** convert device-Id to unit name
 *
 *  \param devId		Chameleon-V2 device-Id
 *
 *  \return const string with module name or "?" if unknown
 */
const char *CHAM_DevIdToName( u_int16 devId )
{
	int i;

	for( i=0; G_ChamTbl[i].name; i++ ){
		if( G_ChamTbl[i].devId == devId )
			return G_ChamTbl[i].name;
	}
	return "?";
}

/**********************************************************************/
/** convert module-code to device-Id
 *
 *	\param modCode	Chameleon-V0 module-code
 *
 *  \return			Chameleon-V2 device-Id or 0xffff if no match
 */
u_int16 CHAM_ModCodeToDevId( u_int16 modCode )
{
	int i;

	for( i=0; G_ChamTbl[i].name; i++ ){
		if( G_ChamTbl[i].modCode == modCode )
			return G_ChamTbl[i].devId;
	}
	return 0xffff;	/* unknown */
}

/**********************************************************************/
/** convert device-Id to module-code
 *
 *	\param devId	Chameleon-V2 device-Id
 *
 *  \return			Chameleon-V0 module-code or 0xffff if no match
 */
u_int16 CHAM_DevIdToModCode( u_int16 devId )
{
	int i;

	for( i=0; G_ChamTbl[i].name; i++ ){
		if( G_ChamTbl[i].devId == devId )
			return G_ChamTbl[i].modCode;
	}
	return 0xffff;	/* unknown */
}

/*! @} */


