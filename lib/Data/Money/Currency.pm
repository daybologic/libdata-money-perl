package Data::Money::Currency;
use Moose;

=head1 NAME

Data::Money::Currency - Represents the currency

=head1 DESCRIPTION

Generic object representing the currency of a given L<Data::Money::Amount>.

=head1 ATTRIBUTES

None

=head1 METHODS

=over

=item C<toString()>

Returns the human-readble, long-name for the currency.
Should be overriden by subclasses, or we return 'Unknown currency'.

=cut

sub toString {
	return 'Unknown currency';
}

=item C<iso()>

Return the ISO 4217:2015 code of the class, eg. 'GBP'.
If unspecified, we return C<undef>.

=cut

sub iso {
	my ($self) = @_;
	my $code = (split(m/::/, ref($self)))[-1];
	return $code if (length($code) == 3);
	return undef;
}

=back

=cut

1;
