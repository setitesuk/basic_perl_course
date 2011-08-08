package PerlSequencer;

use Modern::Perl;
use Moose;

sub produce_reads { # a sequencing machine produces reads, so that is a good name for the method

  my ( $self, $sequence_length ) = @_; # we capture the object, and the sequence_length requested

  my @sequences; # create an array to return

  my @bases = qw{A C G T}; # set up an array of DNA sequence letters.

  my $count = 0;
  while ( $count < 200 ) { # we want 200 reads, so lets loop 200 times
    $count++; # easily forgotten, increment our counter

    my $sequence = q{}; # A sequence string to capture letters onto

    my $letter_count = 0; # by starting counters at 0, we don't need to increment any user defined values to get the right number
    while ( $letter_count < $sequence_length ) { # we want a sequence of user defined length, so loop to this
      $letter_count++;

      $sequence .= ( @bases[ (rand 4) ] ); # Choose a randon dna base from our array of DNA letters, and join it to the sequence string

    }

    push @sequences, $sequence; # push the sequence string onto the array to return

  }

  return @sequences; # return the sequences produced

}

1;