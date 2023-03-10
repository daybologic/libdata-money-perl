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
use Readonly;
use Test::Deep qw(cmp_deeply all isa methods bool re);
use Test::Exception;
use Test::Module::Runnable;
use Test::More;

Readonly my $VERSION => '0.1.0';

sub setUp {
	my ($self) = @_;

	return EXIT_SUCCESS;
}

sub testAPILayer_VERSION {
	my ($self) = @_;
	#plan tests => 10;
	plan tests => 1;

	is($Data::Money::Amount::VERSION, $VERSION, '$Data::Money::Amount::VERSION');
#$Data::Money::Config;
#$Data::Money::Currency;
#$Data::Money::Currency::GBP;
#$Data::Money::Currency::USD;
#$Data::Money::Currency::Converter;
#$Data::Money::Currency::Converter::Repository;
#$Data::Money::Currency::Converter::Repository::Dummy;
#$Data::Money::Currency::Converter::Repository::Base;
#$Data::Money::Currency::Converter::Repository::APILayer;

	return EXIT_SUCCESS;
}

package main;
use strict;
use warnings;

exit(versionTests->new->run);
