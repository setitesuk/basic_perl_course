#!/Users/ajb/dev/bin/perl -w

use Modern::Perl;

my $sequence_1 = 'GATCGGAAGAGCGGTTCAGCAGGCATGCCGAGACCGA';
my $sequence_2 = 'TATAGTTAACAATAATATATAGTCTCAACTAGATACG';
my $sequence_3 = 'CAGGCATGCCGAGACCGATATAGTTAACAATAATATA';

# 1) Create an arrayref containing all three sequences

my $seq_array_ref = [ $sequence_1, $sequence_2, $sequence_3 ];
say $seq_array_ref;
say join "\n", @{ $seq_array_ref };

# 2) create an arrayref which contains all the sequences which contain the
# codon ATG 

my $seqs_with_atg = []; # set up the array ref

foreach my $seq ( $sequence_1, $sequence_2, $sequence_3 ) {
  if ( $seq =~ m/atg/im ) {
    push @{ $seqs_with_atg }, $seq;
  }
}

say join "\n", @{ $seqs_with_atg };

# 3) create a hashref of the sequences keyed by their name

my $seqs_hashref = {
  sequence_1 => $sequence_1,
  sequence_2 => $sequence_2,
  sequence_3 => $sequence_3,
};

foreach my $key ( sort keys %{ $seqs_hashref } ) {
  say $key . ':' . $seqs_hashref->{$key};
}

# 4) create a hash data structure with codons as the keys, and the sequences
# underneath them if they contain that. Bonus points if you can
# refer to the sequence by name, rather than the base string, and you can
# generate in the smallest amount of code possible

# e.g. %codon_in_sequences = (
#    atg => <data structure containing the sequence atg is present in>,
#    taa => <data structure containing the sequence taa is present in>,
#    ...
#  );

my %codon_in_sequences;

my $count = 1;
foreach my $seq ( $sequence_1, $sequence_2, $sequence_3 ) {
  my $seq_name = 'sequence_' . $count;

  foreach my $codon ( qw{atg taa tag tga} ) { # you could have an array of all the codons here
    my ($match) = $seq =~ m/($codon)/im;
    $match and $codon_in_sequences{$match}->{$seq_name} = $seq; # the use of 'and' means that we only create the key value pair if we matched
#    if ( $seq =~ m/$codon/im ) {
#      $codon_in_sequences{$codon}->{$seq_name} = $seq;
#    }
  }

  $count++;
}

foreach my $key ( sort keys %codon_in_sequences ) {
  say $key;
  foreach my $sequence ( @{ $codon_in_sequences{$key} } ) {
    say "\t$sequence";
  }
}

