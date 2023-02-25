#!/usr/bin/perl
package basicTests;
use strict;
use warnings;
use Moose;
extends 'Test::Module::Runnable';

use Data::Money::Amount;
use English qw(-no_match_vars);
use POSIX qw(EXIT_SUCCESS);
use Test::Deep qw(cmp_deeply all isa methods bool re);
use Test::Exception;
use Test::Module::Runnable;
use Test::More;

sub setUp {
	my ($self) = @_;

	$self->sut(Data::Money::Amount->new(
		#dic => $self->dic,
		#dicRequire => 1, # Enable this for new libraries which should only use the DIC
	));

	return EXIT_SUCCESS;
}

sub testDefaults {
	my ($self) = @_;
	plan tests => 4;

	is($self->sut->value,  0, 'zero value');
	is($self->sut->pounds, 0, 'zero pounds');
	is($self->sut->pence,  0, 'zero pence');

	cmp_deeply($self->sut->currency, all(
		isa('Data::Money::Currency'),
		methods(
			iso      => undef,
			toString => 'Unknown currency',
		),
	), 'currency');

	return EXIT_SUCCESS;
}

sub testTypical {
	my ($self) = @_;
	plan tests => 4;

	$self->sut(Data::Money::Amount->new(value => 12345));
	is($self->sut->value,  12345, 'value');
	is($self->sut->pounds, 12.34, 'pounds');
	is($self->sut->pence,  1234, 'pence');

	cmp_deeply($self->sut->currency, all(
		isa('Data::Money::Currency'),
		methods(
			iso      => undef,
			toString => 'Unknown currency',
		),
	), 'currency');

	return EXIT_SUCCESS;
}

sub testConstruct {
	my ($self) = @_;
	plan tests => 2;

	is($self->sut(Data::Money::Amount->fromPounds(12.34))->value, 12340, 'fromPounds: value');
	is($self->sut(Data::Money::Amount->fromPence(1234))->value, 12340, 'fromPence: value');

	return EXIT_SUCCESS;
}

package main;
use strict;
use warnings;
exit(basicTests->new->run);
