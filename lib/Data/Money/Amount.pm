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
	return Data::Money::Currency->new()
});

=back

=head1 METHODS

None

=cut

1;
