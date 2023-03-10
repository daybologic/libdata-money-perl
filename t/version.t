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
use Data::Money::Currency::Converter::Repository::APILayer;
use Data::Money::Currency::Converter::Repository::Base;
use Data::Money::Currency::Converter::Repository::Dummy;
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
	plan tests => 10;

	is($Data::Money::Amount::VERSION, $VERSION, '$Data::Money::Amount::VERSION');
	is($Data::Money::Config::VERSION, $VERSION, '$Data::Money::Config::VERSION');
	is($Data::Money::Currency::VERSION, $VERSION, '$Data::Money::Currency::VERSION');
	is($Data::Money::Currency::GBP::VERSION, $VERSION, '$Data::Money::Currency::GBP::VERSION');
	is($Data::Money::Currency::USD::VERSION, $VERSION, '$Data::Money::Currency::USD::VERSION');
	is($Data::Money::Currency::Converter::VERSION, $VERSION, '$Data::Money::Currency::Converter::VERSION');
	is($Data::Money::Currency::Converter::Repository::VERSION, $VERSION, '$Data::Money::Currency::Converter::Repository::VERSION');
	is($Data::Money::Currency::Converter::Repository::APILayer::VERSION, $VERSION, '$Data::Money::Currency::Converter::Repository::APILayer::VERSION');
	is($Data::Money::Currency::Converter::Repository::Base::VERSION, $VERSION, '$Data::Money::Currency::Converter::Repository::Base::VERSION');
	is($Data::Money::Currency::Converter::Repository::Dummy::VERSION, $VERSION, '$Data::Money::Currency::Converter::Repository::Dummy::VERSION');

	return EXIT_SUCCESS;
}

package main;
use strict;
use warnings;

exit(versionTests->new->run);
