package Data::Money::Currency::Converter::Repository;
use Moose;

require UNIVERSAL::require;

has config => (is => 'ro', isa => 'Data::Money::Config', required => 1);

BEGIN {
	our $VERSION = '0.1.0';
}

sub repo {
	my ($self, $name) = @_;
	my $fullClassName = join('::', ref($self), $name);

	$fullClassName->require or die $@;

	return $fullClassName->new(config => $self->config);
}

1;
