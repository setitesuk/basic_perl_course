#!/software/perl -w

use Modern::Perl;

# create a script (using functions) to create a file which, given a file of sequences and a file of amino acids,
# lists the amino acids next to the sequence

# i.e. ACGTAGCT.. Ala Stp..

# data/amino_acid_codes.txt
# data/sequences.txt

# write functions which

# construct the amino acid data into a data structure that can be looped over (you will want a multi-dimensional structure)
# anything else you feel would be suitable to go in a function

use File::Slurp;

sub amino_acid_codes {
  my ( $source_file ) = @_;

  my @rows = read_file( $source_file );

  my %amino_acid_codes;

  foreach my $row ( @rows ) {
    chomp $row;
    my @items = split /\s+/xms, $row;
    my $amino_acid = shift @items;
    my $three_letter_code = shift @items;
    $amino_acid_codes{$amino_acid} = {
      '3_letter_code' => $three_letter_code,
      'codons' => [ @items ],
    };
  }

  return %amino_acid_codes;
}

my %amino_acid_codes = amino_acid_codes( 'data/amino_acid_codes.txt' );

# second, we'll look at reading in the sequences

my @sequences = read_file( 'data/sequences.txt' );

# no need to put that into a new function. (and we won't check it, we know that this will work from
# previous work)

# third, we need to compare and store into a new file, the sequences, with the amino acids found.
# for this we will need to loop over the sequences, loop over the amino acid codes, and store in
# another data structure. Because we know how we want the data, lets do an array, which we'll print
# out to the file with write_file.

my @results; # set up our results array

# we are going to do a nested loop. To decide which is most appropriate to do, lets look at two things

# 1 - which group to loop over contains the most items
#       put the largest loop to be done the least number of times if appropriate

# 2 - what data gets mixed with which
#       if you are adding data from one to another, which takes the least operations to add to

say 'the number of sequences is: ' . scalar @sequences;
say 'the number of amino_acids is: ' . scalar keys %amino_acid_codes;

# So it makes sense to only loop over sequences once for time issues

# we also want to add amino acid codes to the sequence, so it makes it easier to process those within
# rather than the other way around, where we might need to do a second process to the data

foreach my $sequence ( @sequences ) {
  chomp $sequence; # we don't want any newlines
  my @seen_amino_acid_codes; # set up a capture array to record if we see the codons, this is reset for each sequence

  foreach my $amino_acid ( sort keys %amino_acid_codes ) { # loop through the amino acid names
    foreach my $codon ( @{ $amino_acid_codes{$amino_acid}->{codons} } ) { # loop over the codons
      if ( $sequence =~ m/$codon/ixms ) { # check to see if we find the codon
        push @seen_amino_acid_codes, $amino_acid_codes{$amino_acid}->{'3_letter_code'}; # if seen, push the amino acid code onto our capture array
        last; # we only want to know if it is seen once, so get out of the loop before checking for any other codons for this amino acid
      }
    }
  }

  push @results, ( join "\t", $sequence, @seen_amino_acid_codes ) . "\n"; # join the sequence, the amino acid codes and together, add a new line and push onto the results capture array

}

write_file( 'output/sequences_with_codons_present.txt', @results ); # write our capture array to the file

