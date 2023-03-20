package Data::Money::Currency::Converter::Repository;
use Moose;

require UNIVERSAL::require;

use Data::Money::Config;

has config => (is => 'ro', isa => 'Data::Money::Config', lazy => 1, default => \&__makeConfig);

BEGIN {
	our $VERSION = '0.1.0';
}

sub repo {
	my ($self, $name) = @_;
	my $fullClassName = join('::', ref($self), $name);

	$fullClassName->require or die $@;

	return $fullClassName->new(config => $self->config);
}

sub __makeConfig {
	my ($self) = @_;
	return Data::Money::Config->new();
}

1;
