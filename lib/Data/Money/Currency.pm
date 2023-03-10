package Data::Money::Currency;
use Moose;

=head1 NAME

Data::Money::Currency - Represents the currency

=head1 DESCRIPTION

Generic object representing the currency of a given L<Data::Money::Amount>.

=cut

use Scalar::Util qw(blessed);
require UNIVERSAL::require;

BEGIN {
	our $VERSION = '0.1.0';
}

=head1 ATTRIBUTES

None

=head1 METHODS

=over

=item C<fromStandard($standard)>

Given the standard - C<$standard> which is an ISO 4217:2015 code for example 'GBP',
we construct and return a class subclass of ourselves, which is dedicated for that
currency.  This call is indepotent.

=cut

sub fromStandard {
	my ($class, $standard) = @_;
	return $standard if blessed($standard);
	my $fullClassName = join('::', $class, $standard);
	$fullClassName->require or die $@;

	return $fullClassName->new();
}

=item C<standard()>

Return the ISO 4217:2015 code of the class, eg. 'GBP'.
If unspecified, we return C<undef>.

=cut

sub standard {
	my ($self) = @_;
	my $code = (split(m/::/, ref($self)))[-1];
	return $code if (length($code) == 3);
	return undef;
}

=item C<toString()>

Returns the human-readble, long-name for the currency.
Should be overriden by subclasses, or we return 'Unknown currency'.

=cut

sub toString {
	return 'Unknown currency';
}

=back

=cut

1;
