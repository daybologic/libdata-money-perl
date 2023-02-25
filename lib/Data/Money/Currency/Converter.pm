package Data::Money::Currency::Converter;
use Moose;

=head1 NAME

Data::Money::Currency::Converter

=head1 DESCRIPTION

The converter is an interface to a third party currency conversion service.

=head1 ATTRIBUTES

None

=head1 METHODS

=over

=item C<convert($amount, $currency)>

Returns the human-readble, long-name for the currency.

Converts the amount - C<$amount> which is a L<Data::Money::Amount> into
another C<$currency> which may be a string representing a standard ISO 4217:2015 code for example 'GBP',
or a L<Data::Money::Currency> object, and returns a new L<Data::Money::Amount> object in return.

=cut

sub convert {
	my ($self, $amount, $currency) = @_;
	return Data::Money::Amount->fromPence(0, $currency); # FIXME
}

=back

=cut

1;
