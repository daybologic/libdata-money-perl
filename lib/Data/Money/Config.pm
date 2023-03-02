package Data::Money::Config;
use Moose;

use Config::INI::Reader;

has __config => (is => 'ro', isa => 'HashRef', lazy => 1, default => \&__makeConfig);

sub __makeConfig {
	my ($self) = @_;

	# TODO: Allow user to set config file path and name
	return Config::INI::Reader->read_file('money.ini');
}

# TODO: Need to be able to access this from all API backends and have them automagically access the right
# section with a simple get('api_key') call

1;
