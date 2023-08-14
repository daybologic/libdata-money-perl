package Data::Money::Currency::GBP;
use Moose;

extends 'Data::Money::Currency';

=head1 NAME

Data::Money::Currency::GBP

=head1 DESCRIPTION

GBP is a specific currency of the type L<Data::Money::Currency>.

=cut

BEGIN {
	our $VERSION = '0.2.0';
}

=head1 ATTRIBUTES

None

=head1 METHODS

=over

=item C<toString()>

Returns the human-readble, long-name for the currency.

=cut

sub toString {
	return 'Pounds Sterling';
}

=back

=cut

1;
