#!/usr/bin/perl
# ITEMAN Dynamic Publishing - A Perl-based dynamic publishing system for Moveble Type
# Copyright (c) 2009 ITEMAN, Inc. All rights reserved.
#
# This file is part of ITEMAN Dynamic Publishing.
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";
use ITEMAN::DynamicPublishing::Config;
use File::Spec;
use File::Basename;
use Cwd;

use Test::More tests => 4;

{
    my $config = ITEMAN::DynamicPublishing::Config->new;

    is(
        Cwd::abs_path($config->error_page_404),
        Cwd::abs_path(File::Spec->catfile(dirname(__FILE__), '..', 'tmpl', '404.tmpl'))
        );
}

{
    my $config = ITEMAN::DynamicPublishing::Config->new;
    {
      eval {
          $config->non_existing_feature;
      };
      if ($@) {
          pass;
          last ;
      }

      fail;
    }
}

{
    my $config = ITEMAN::DynamicPublishing::Config->new;
    $config->error_page_404('/foo.html');

    is($config->error_page_404, '/foo.html');
    is(
        Cwd::abs_path(ITEMAN::DynamicPublishing::Config->default('error_page_404')),
        Cwd::abs_path(File::Spec->catfile(dirname(__FILE__), '..', 'tmpl', '404.tmpl'))
        );
}

# Local Variables:
# mode: perl
# coding: iso-8859-1
# tab-width: 4
# c-basic-offset: 4
# c-hanging-comment-ender-p: nil
# indent-tabs-mode: nil
# End:
