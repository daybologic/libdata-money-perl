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

	$self->sut(Data::Money::Config->new(filePath => 'test-suite.ini'));

	return EXIT_SUCCESS;
}

sub testReadAPIKey {
	my ($self) = @_;
	plan tests => 2;

	my $value = $self->sut->get($self, 'quoted');
	is($value, 'U87gtxAhk9TwTayZvLFwj2rgzkdOw6hV', 'quoted');

	$value = $self->sut->get($self, 'unquoted');
	is($value, 'GNn9ztM8Pr33f7lVdsXjXaZ69gk5Y7A0', 'unquoted');

	return EXIT_SUCCESS;
}

package main;
use strict;
use warnings;
exit(configTests->new->run);
