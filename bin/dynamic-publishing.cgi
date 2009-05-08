#!/usr/bin/perl -w
# ITEMAN Dynamic Publishing - A Perl based dynamic publishing extension for Moveble Type
# Copyright (c) 2009 ITEMAN, Inc. All rights reserved.
#
# This file is part of ITEMAN Dynamic Publishing.
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

use strict;
use warnings;

use lib "$ENV{MT_HOME}/extlib";
use lib "$ENV{MT_HOME}/lib";
use lib "$ENV{MT_HOME}/plugins/ITEMANDynamicPublishing/lib";
use ITEMAN::DynamicPublishing;

local $SIG{__DIE__} = sub {
    return if $^S;
    die 'IDP: ' . $_[0];
};

ITEMAN::DynamicPublishing->new->publish();

# Local Variables:
# mode: perl
# coding: iso-8859-1
# tab-width: 4
# c-basic-offset: 4
# c-hanging-comment-ender-p: nil
# indent-tabs-mode: nil
# End:
