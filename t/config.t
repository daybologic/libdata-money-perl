#!/usr/bin/perl
package configTests;
use strict;
use warnings;
use Moose;
extends 'Test::Module::Runnable';

use Data::Money::Config;
use English qw(-no_match_vars);
use POSIX qw(EXIT_SUCCESS);
use Test::Deep qw(cmp_deeply all isa methods bool re);
use Test::Exception;
use Test::Module::Runnable;
use Test::More;

sub setUp {
	my ($self) = @_;

	$self->sut(Data::Money::Config->new());

	return EXIT_SUCCESS;
}

sub testReadAPIKey {
	my ($self) = @_;
	plan tests => 1;

	my $value = $self->sut->get($self, 'api_key');

	is($value, 'U87gtxAhk9TwTayZvLFwj2rgzkdOw6hV', 'value');

	return;
}

package main;
use strict;
use warnings;
exit(configTests->new->run);
