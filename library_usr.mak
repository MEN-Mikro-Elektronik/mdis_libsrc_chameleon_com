#***************************  M a k e f i l e  *******************************
#
#         Author: cs
#          $Date: 2007/07/11 09:34:09 $
#      $Revision: 2.2 $
#
#    Description: Makefile descriptor file for CHAMELEON lib
#
#---------------------------------[ History ]---------------------------------
#
#   $Log: library_usr.mak,v $
#   Revision 2.2  2007/07/11 09:34:09  CKauntz
#   only Chameleon V2 API exported
#   added CHAMV2_VARIANT
#
#   Revision 2.1  2005/07/08 17:58:07  cs
#   Initial Revision
#
#
#-----------------------------------------------------------------------------
#   (c) Copyright 2002 by MEN mikro elektronik GmbH, Nuernberg, Germany
#*****************************************************************************
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


MAK_NAME=chameleon_usr

MAK_INCL=$(MEN_MOD_DIR)/chameleon_int.h \
		 $(MEN_MOD_DIR)/chameleon.c     \
		 $(MEN_INC_DIR)/men_typs.h    	\
		 $(MEN_INC_DIR)/chameleon.h		\
		 $(MEN_INC_DIR)/maccess.h		\
		 $(MEN_INC_DIR)/oss.h

MAK_SWITCH=$(SW_PREFIX)MAC_MEM_MAPPED \
           $(SW_PREFIX)CHAMV2_VARIANT=Mem \
           $(SW_PREFIX)MAC_USERSPACE

MAK_INP1 = chameleonv2$(INP_SUFFIX)
MAK_INP2 = chameleon_strings$(INP_SUFFIX)

MAK_INP  = $(MAK_INP1) \
		   $(MAK_INP2)

