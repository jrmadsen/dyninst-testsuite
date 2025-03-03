 !
 ! See the dyninst/COPYRIGHT file for copyright information.
 ! 
 ! We provide the Paradyn Tools (below described as "Paradyn")
 ! on an AS IS basis, and do not warrant its validity or performance.
 ! We reserve the right to update, modify, or discontinue this
 ! software at any time.  We shall have no obligation to supply such
 ! updates or modifications or any other form of support to you.
 ! 
 ! By your use of Paradyn, you understand and agree that we (or any
 ! other person or entity with proprietary rights in Paradyn) are
 ! under no obligation to provide either maintenance services,
 ! update services, notices of latent defects, or correction of
 ! defects for Paradyn.
 ! 
 ! This library is free software; you can redistribute it and/or
 ! modify it under the terms of the GNU Lesser General Public
 ! License as published by the Free Software Foundation; either
 ! version 2.1 of the License, or (at your option) any later version.
 ! 
 ! This library is distributed in the hope that it will be useful,
 ! but WITHOUT ANY WARRANTY; without even the implied warranty of
 ! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 ! Lesser General Public License for more details.
 ! 
 ! You should have received a copy of the GNU Lesser General Public
 ! License along with this library; if not, write to the Free Software
 ! Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 !

! libdyninst validation suite test #1
! author: Jon Beyer (6/1/01)
!	derived from a previous test by Jeff Hollingsworth

!------------------------------------------------------------------------------
#define stop_process_ stop_process

#ifdef __GNUC__
#define AND iand
#define OR ior
#else
#define AND and
#define OR or
#endif

!------------------------------------------------------------------------------

	SUBROUTINE test1_2f_init_globals
#include "test1_2F_common.h"

	END

!------------------------------------------------------------------------------

	SUBROUTINE test1_2_func2_1
	INTEGER foo = 0
	END

!------------------------------------------------------------------------------

	SUBROUTINE test1_2_call2_1 (arg1, arg2, arg3)
#include "test1_2F_common.h"
	INTEGER arg1
	INTEGER arg2
	CHARACTER arg3 *(*)

	if (arg1 .eq. 1 .and. arg2 .eq. 2 .and. arg3 .eq.
     & "testString2_1") then
		passedTest = 1
	else
		print *, '**Failed** test #2 (four parameter function)'
		if (arg1 .ne. 1) then
			print *, '	arg1 = ', arg1, ', should be 1'
		endif
		if (arg2 .ne. 2) then
			print *, '	arg2 = ', arg2, ', should be 2'
		endif
		if (arg3 .ne. 'testString2_1') then
			print *, '	arg3 = ', arg3, ', should be "testString2_1"'
		endif
	endif
	END

!------------------------------------------------------------------------------
