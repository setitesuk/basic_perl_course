package SequenceCreator;

use Modern::Perl;

use base 'Exporter';
our @EXPORT = qw{
  sequencing_machine
  gc_count
  ta_count

  sequence_length
  gc_percentage
  ta_percentage

  reverse_strand
};

# i've written a method to generate 10 50bp sequences, as though it were a sequencing machine
# you could have written something which read from a file, database, or even just returned some
# ficed sequences
sub sequencing_machine {

  my @sequences;
  my @bases = qw{A C G T};
  
  foreach (1..10) {
    my $sequence = q{};
    foreach (1..50) {
      $sequence .= ( @bases[ (rand 4) ] );
    }
    push @sequences, $sequence;
  }

  return @sequences;
}

# counting methods using transliterate ( see 05-reular_expressions )
sub gc_count {
  my ( $sequence ) = @_;

  my $gc_count = $sequence =~ tr/GCgc/GCgc/;

  return $gc_count;
}

sub ta_count {
  my ( $sequence ) = @_;

  my $ta_count = $sequence =~ tr/ATat/ATat/;

  return $ta_count;
}










# a length method
sub sequence_length {
  my ( $sequence ) = @_;

  return length $sequence;
}

# percentage methods, which take advantage of the methods we already wrote
sub gc_percentage {
  my ( $sequence ) = @_;

  return gc_count( $sequence ) * 100 / sequence_length( $sequence ); 
}

sub ta_percentage {
  my ( $sequence ) = @_;

  return ta_count( $sequence ) * 100 / sequence_length( $sequence ); 
}


# a reverse_strand method - use transliterate to complement the base, and then
# reverse the sequence so we still read from the 5' end

sub reverse_strand {
  my ( $sequence ) = @_;

  $sequence =~ tr/ACGTacgt/TGCAtgca/;

  my $rev_seq =  reverse $sequence;

  return $rev_seq;

}

1;