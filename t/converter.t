#!/usr/bin/perl
package converterTests;
use strict;
use warnings;
use Moose;
extends 'Test::Module::Runnable';

use Data::Money::Amount;
use Data::Money::Config;
use Data::Money::Currency::Converter::Repository;
use English qw(-no_match_vars);
use POSIX qw(EXIT_SUCCESS);
use Test::Deep qw(cmp_deeply all isa methods bool re);
use Test::Exception;
use Test::Module::Runnable;
use Test::More;

sub setUp {
	my ($self) = @_;

	$self->sut(Data::Money::Currency::Converter::Repository->new(
		config => Data::Money::Config->new(),
	));

	return EXIT_SUCCESS;
}

sub testAPILayer_ReadAPIKey {
	my ($self) = @_;
	plan tests => 2;

	my $amountInput = Data::Money::Amount->fromPence(100, 'GBP');
	my $amountOutput = $self->sut($self->sut->repo('APILayer'))->convert($amountInput, 'USD');

	return EXIT_SUCCESS;
}

package main;
use strict;
use warnings;
exit(converterTests->new->run);
