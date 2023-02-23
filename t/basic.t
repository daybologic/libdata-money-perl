#!/usr/bin/perl
package basicTests;
use strict;
use warnings;
use Moose;
extends 'Test::Module::Runnable';

#use Cache::MemoryCache;
use Data::Money::Amount;
use English qw(-no_match_vars);
#use XXXXXXXX::Config::Mock;
#use XXXXXXXX::DB::Mock;
#use XXXXXXXX::DIC;
#use XXXXXXXX::Log::Mock 1.4.0;
use POSIX qw(EXIT_SUCCESS);
use Test::Deep qw(cmp_deeply all isa methods bool re);
use Test::Exception;
use Test::More;

sub setUp {
	my ($self) = @_;

#	$self->dic(XXXXXXXX::DIC->new(
#		logger => XXXXXXXX::Log::Mock->new,
#		cache => Cache::MemoryCache->new,
#		config => XXXXXXXX::Config::Mock->new({
			#VOIPDB => XXXXXXXX::DB::Mock->makeConfig(), # Enable this if you will call an init() to set up DBs
#		}),
		#voipdb => XXXXXXXX::DB::Mock->new, # Enable this if you want to pass a DB directly
#	));

	$self->sut(Data::Money::Amount->new(
		#dic => $self->dic,
		#dicRequire => 1, # Enable this for new libraries which should only use the DIC
	));

#	$self->forcePlan();
#	$self->dic->logger->warnFatal(1); # disable in specific tests if needed

	return EXIT_SUCCESS;
}

sub testSomething {
	plan tests => 1;
	fail("You were supposed to remove this (facepalm)");
}

package main;
use strict;
exit(basicTests->new->run);
