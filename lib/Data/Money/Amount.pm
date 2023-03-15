package Data::Money::Amount;
use Moose;

=head1 NAME

Data::Money::Amount - Represents an amount of money

=head1 DESCRIPTION

This object represents an amount of money to 0.1p precision.
The amount is always read-only and any modification may be performed
via methods calls, which will return a new object where relevant.

=cut

use Data::Money::Currency;
use Data::Money::Currency::Converter::Repository;
use POSIX qw(ceil floor);

BEGIN {
	our $VERSION = '0.1.0';
}

=head1 ATTRIBUTES

=over

=item C<value>

The internal value for the object, note that this is expressed in one tenth of
one cents, or 0.1p values.  So $10.05 will be expressed as C<10050>.

The value cannot be changed after the object is created.

The default value is zero -- no value.

=cut

has value => (is => 'ro', isa => 'Int', default => 0);

=item C<currency>

The currency of this amount; by default, this is unknown.

=cut

has currency => (is => 'ro', isa => 'Data::Money::Currency', default => sub {
	return Data::Money::Currency->new();
});

=back

=head1 METHODS

=over

=item C<pounds()>

Returns the value of this object in pounds or dollars, or whatever the integral unit
of the currency is.  Irrespective of what it is (this method does not do conversion).

=cut

sub pounds {
	my ($self) = @_;
	return sprintf('%0.2f', int($self->pence + 0.50001) / 100);
}

=item C<pence()>

Returns the value of this object in pence or cents, or whatever the fractional unit
of the currency is.  Irrespective of what it is (this method does not do conversion).

=cut

sub pence {
	my ($self) = @_;
	return floor($self->value / 10);
}

sub add {
	my ($self, $other) = @_;

	if (!blessed($other)) {
		my @params = ($other);
		push(@params, $self->currency) if ($self->currency->standard);
		$other = $self->fromPence(@params);
	}

	my @params = ($self->pence + $other->pence);
	push(@params, $other->currency) if ($other->currency->standard);
	return $self->fromPence(@params);
}

sub convert {
	my ($self, $currency) = @_;

	my $converter = Data::Money::Currency::Converter::Repository->new();
	my $apiLayer = $converter->repo('APILayer');

	return $apiLayer->convert($self, $currency);
}

=item C<fromPounds($num, [$currency])>

Convert the decimal number C<$num> into a new object of this type.

=cut

sub fromPounds {
	my ($class, $num, $currency) = @_;
	my %args  = (value => int($num * 1000));
	$args{currency} = Data::Money::Currency->fromStandard($currency) if ($currency);
	return $class->new(\%args);
}

=item C<fromPence($pence, [$currency])>

Convert the integer number C<$pence> into a new object of this type.
You cannot represent h'pennies nor Farthings this way.  You would need
to use L</value>.

=cut

sub fromPence {
	my ($class, $pence, $currency) = @_;
	#$pence = $pence->pence if (blessed($pence));
	my %args = (value => int($pence) * 10);
	$args{currency} = Data::Money::Currency->fromStandard($currency) if ($currency);
	return $class->new(\%args);
}

=item C<toString()>

TODO

=cut

sub toString {
	my ($self) = @_;

	my $str = $self->pounds();
	if (my $currencyStandard = $self->currency->standard) { # is undef if unspecified
		$str = sprintf('%s %s (%s)', $str, $currencyStandard, $self->currency->toString());
	}

	return $str;
}

=back

=cut

1;
