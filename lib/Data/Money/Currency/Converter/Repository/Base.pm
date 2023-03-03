package Data::Money::Currency::Converter::Repository::Base;
use Moose;

has _config => (isa => 'Data::Money::Config', is => 'ro', required => 1, init_arg => 'config');

sub convert {
	...
}

1;
