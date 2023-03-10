#!/usr/bin/perl
package versionTests;
use strict;
use warnings;
use Moose;

extends 'Test::Module::Runnable';

use Data::Money::Amount;
use Data::Money::Config;
use Data::Money::Currency;
use Data::Money::Currency::GBP;
use Data::Money::Currency::USD;
use Data::Money::Currency::Converter;
use Data::Money::Currency::Converter::Repository;
use Data::Money::Currency::Converter::Repository::Dummy;
use Data::Money::Currency::Converter::Repository::Base;
use Data::Money::Currency::Converter::Repository::APILayer;
use English qw(-no_match_vars);
use POSIX qw(EXIT_SUCCESS);
use Test::Deep qw(cmp_deeply all isa methods bool re);
use Test::Exception;
use Test::Module::Runnable;
use Test::More;

sub setUp {
	my ($self) = @_;

	return EXIT_SUCCESS;
}

sub testAPILayer_VERSION {
	my ($self) = @_;
	plan tests => 1;

	ok('FIXME');
	return EXIT_SUCCESS;
}

package main;
use strict;
use warnings;

exit(versionTests->new->run);
