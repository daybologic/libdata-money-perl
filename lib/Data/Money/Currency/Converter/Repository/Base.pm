package Data::Money::Currency::Converter::Repository::Base;
use Moose;

BEGIN {
	our $VERSION = '0.1.0';
}

has _config => (isa => 'Data::Money::Config', is => 'ro', required => 1, init_arg => 'config');

sub convert {
	...
}

1;
