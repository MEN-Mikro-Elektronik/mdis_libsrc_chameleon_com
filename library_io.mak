#***************************  M a k e f i l e  *******************************
#  
#         Author: dieter.pfeuffer@men.de
#                      
#    Description: Makefile descriptor file for CHAMELEON lib (io access)
#                      
#-----------------------------------------------------------------------------
#   Copyright (c) 2019, MEN Mikro Elektronik GmbH
#*****************************************************************************
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


MAK_NAME=chameleon_io
# the next line is updated during the MDIS installation
STAMPED_REVISION="mdis_libsrc_chameleon_com_03_02-7-g8c0e50d-dirty_2019-05-28"

DEF_REVISION=MAK_REVISION=$(STAMPED_REVISION)

MAK_INCL=$(MEN_MOD_DIR)/chameleon_int.h \
		 $(MEN_MOD_DIR)/chameleon.c     \
		 $(MEN_INC_DIR)/men_typs.h    	\
		 $(MEN_INC_DIR)/chameleon.h		\
		 $(MEN_INC_DIR)/maccess.h		\
		 $(MEN_INC_DIR)/oss.h

MAK_SWITCH=$(SW_PREFIX)MAC_IO_MAPPED      \
		$(SW_PREFIX)$(DEF_REVISION) \
           $(SW_PREFIX)CHAM_VARIANT=IO    \
           $(SW_PREFIX)CHAMV2_VARIANT=Io  \
		   $(SW_PREFIX)VX_SYS_IO_FUNCT_ACCESS

MAK_INP1 = chameleonv2$(INP_SUFFIX)
MAK_INP2 = chameleon_strings$(INP_SUFFIX)

MAK_INP  = $(MAK_INP1) \
		   $(MAK_INP2)
