package Data::Money::Config;
use Moose;

use Config::INI::Reader;
use Readonly;

BEGIN {
	our $VERSION = '0.2.0';
}

Readonly my $FILENAME => 'money.ini';

has filePath => (is => 'ro', isa => 'Str', lazy => 1, default => \&__findFilePath);
has __config => (is => 'ro', isa => 'HashRef', lazy => 1, default => \&__makeConfig);

sub get {
	my ($self, $module, $keyName) = @_;
	my $sectionName = ref($module);
	my $value = $self->__config->{$sectionName}->{$keyName};
	return $self->__stripQuotes($value);
}

sub __stripQuotes {
	my ($self, $value) = @_;

	if ($value) {
		$value =~ s/^'//;
		$value =~ s/'$//;
	}

	return $value;
}

sub __makeConfig {
	my ($self) = @_;

	# TODO: Allow user to set config file path and name
	return Config::INI::Reader->read_file($self->filePath);
}

sub __findFilePath {
	my ($self) = @_;

	return $FILENAME;
}

1;
