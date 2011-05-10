package Sequence;

use Modern::Perl;
use Moose;

has 'sequence' => (
  isa => 'Str',
  is  => 'ro',
);

# sequence attribute. I have made this read only, as I want don't want it to be able to be modified once created

sub contains { # contains is to be a boolean test method

  my ( $self, $seq ) = @_; # we need to capture the object, and then the parameter, which should be the sequence we want to find. I haven't called it codon, as the object method just knows it is testing a sequence, it doesn't know what is special, and therefore, we could get it to look for GATTACA

  if ( $self->sequence() =~ m/$seq/ixms ) {
    return 1;
  }
  # if we match, the return a true value
  return 0;
  # if we are here, then we didn't match, and so therefore retrn a false value
}

1;