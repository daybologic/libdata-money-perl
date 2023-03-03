package Data::Money::Currency::Converter::Repository::APILayer;
use Moose;

extends 'Data::Money::Currency::Converter::Repository::Base';

use Data::Money::Currency;

has __apiKey => (isa => 'Str', is => 'ro', init_arg => undef, lazy => 1, required => 1, default => \&__makeApiKey);

sub convert {
	my ($self, $sourceAmount, $targetCurrency) = @_;
	$targetCurrency = Data::Money::Currency->fromStandard($targetCurrency);
	die $self->__apiKey;
	...
}

sub __makeApiKey {
	my ($self) = @_;
	return $self->_config->get($self, 'api_key');
}

1;
