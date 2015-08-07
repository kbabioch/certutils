#! /bin/bash

# otca
#
# Copyright (c) 2015 Karol Babioch <karol@babioch.de>
#
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

# Include file common to all test files
. common.sh

# Tests exit code when no arguments are provided
testExitCodeWithNoArguments()
{

    $OTCA > /dev/null
    assertEquals 1 $?

}

# Tests exit code when too many arguments are provided
testExitCodeWithTooManyArguments()
{

    $OTCA 1 2 > /dev/null
    assertEquals 1 $?

}

# Tests exit code when empty servername is set
testExitCodeWithEmptyServername()
{

    $OTCA -s "" client > /dev/null
    assertEquals 1 $?

    $OTCA --servername="" client > /dev/null
    assertEquals 1 $?

    $OTCA --servername= client > /dev/null
    assertEquals 1 $?

}

# Tests exit code when empty bits are set
testExitCodeWithEmptyBits()
{

    $OTCA -b "" > /dev/null
    assertEquals 1 $?

    $OTCA --bits="" > /dev/null
    assertEquals 1 $?

    $OTCA --bits= > /dev/null
    assertEquals 1 $?

}

# Tests exit code when empty clientname is set
testExitCodeWithEmptyClientname()
{

    $OTCA "" > /dev/null
    assertEquals 1 $?

}

# Source (and thereby invoke) shunit2
. shunit2
