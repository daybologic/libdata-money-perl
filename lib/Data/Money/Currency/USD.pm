package Data::Money::Currency::USD;
use Moose;

=head1 NAME

Data::Money::Currency::USD

=head1 DESCRIPTION

USD is a specific currency of the type L<Data::Money::Currency>.

=head1 ATTRIBUTES

None

=head1 METHODS

=over

=item C<toString()>

Returns the human-readble, long-name for the currency.

=cut

sub toString {
	return 'United States Dollar';
}

=back

=cut

1;
