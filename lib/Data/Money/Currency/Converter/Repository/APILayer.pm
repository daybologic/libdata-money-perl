package Data::Money::Currency::Converter::Repository::APILayer;
use Moose;

extends 'Data::Money::Currency::Converter::Repository::Base';

use Data::Money::Amount;
use Data::Money::Currency;
use JSON;
use LWP::UserAgent;
use URI;

has __apiKey => (isa => 'Str', is => 'ro', init_arg => undef, lazy => 1, required => 1, default => \&__makeApiKey);

has __ua => (isa => 'LWP::UserAgent', is => 'ro', init_arg => undef, lazy => 1, required => 1, default => \&__makeUA);

has __decoder => (isa => 'JSON', is => 'ro', init_arg => undef, lazy => 1, required => 1, default => \&__makeDecoder);

sub convert {
	my ($self, $sourceAmount, $targetCurrency) = @_;
	$targetCurrency = Data::Money::Currency->fromStandard($targetCurrency);

	my $response = $self->__ua->get($self->__makeURI($sourceAmount));
	if (!$response->is_success) {
		return;
	}

	my $result = $self->__decoder->decode($response->decoded_content);
	if (!$result->{success}) {
		return;
	}

	warn $result->{result}; # TODO
	my $amount = Data::Money::Amount->fromPounds(
		$result->{result},
		$result->{query}->{to},
	);
	warn $amount->pounds;
	return $amount;
}

sub __makeURI {
	my ($self, $sourceAmount) = @_;

	my $uri = URI->new();

	$uri->scheme('https');
	$uri->host('api.apilayer.com');
	$uri->path('currency_data/convert');
	$uri->query(sprintf('from=GBP&to=USD&amount=%s', $sourceAmount->pounds));

	return $uri->as_string();
}

sub __makeApiKey {
	my ($self) = @_;
	return $self->_config->get($self, 'api_key');
}

sub __makeUA {
	my ($self) = @_;

	my $ua = LWP::UserAgent->new();

	$ua->agent(join('/', 'Data::Money', '0.1.0'));
	$ua->default_header(apikey => $self->__apiKey);
	$ua->timeout(120);

	return $ua;
}

sub __makeDecoder {
	return JSON->new();
}

1;
