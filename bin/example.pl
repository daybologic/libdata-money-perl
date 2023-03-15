#!/usr/bin/env perl

package YourPackage;
use Moose;
use POSIX qw(EXIT_SUCCESS);
use Data::Money::Amount;

has pension => (is => 'rw', isa => 'Data::Money::Amount', default => \&__makePension);

sub run {
	my ($self) = @_;

	$self->printNetWorth();
	$self->earnMoney();
	$self->printNetWorth();

	return EXIT_SUCCESS;
}

sub printNetWorth {
	my ($self) = @_;
	printf("Your net worth is %s\n", $self->pension->toString());
	return;
}

sub earnMoney {
	my ($self) = @_;

	$self->pension($self->pension->add(50));
	$self->pension($self->pension->add(2));

	return;
}

sub __makePension {
	my ($self) = @_;
	return Data::Money::Amount->fromPence(0);
}

package main;
use strict;
use warnings;

sub main {
	return YourPackage->new->run();
}

exit(main()) unless (caller());
