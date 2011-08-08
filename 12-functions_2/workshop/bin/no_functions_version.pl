#!/software/perl -w

use Modern::Perl;

# create a script (using functions) to create a file which, given a file of sequences and a file of amino acids,
# lists the amino acids next to the sequence

# i.e. ACGTAGCT.. Ala Stp..

# source files:

# data/amino_acid_codes.txt
# data/sequences.txt

use File::Slurp;

my @amino_acid_data = read_file( 'data/amino_acid_codes.txt' );
my @sequences = read_file( 'data/sequences.txt' );

my @output_array;

my @split_amino_acid_data;

foreach my $aa_row ( @amino_acid_data ) {
  my @data = split m/\s+/im, $aa_row;
  my $data_array_ref = \@data;
  push @split_amino_acid_data, $data_array_ref;
}

foreach my $seq ( @sequences ) {

  chomp $seq;

  foreach my $aa_data ( @split_amino_acid_data ) {
    my @data = @{ $aa_data };
    my $amino_acid_name = shift @data;
    my $three_letter_code = shift @data;
    foreach my $codon ( @data ) {
      if ( $seq =~ m/$codon/im ) {
        $seq = $seq . ' ' . $three_letter_code;
        last;
      }
    }
  }

  $seq = $seq . "\n";

  push @output_array, $seq;
}


# output file:

# output/sequences_with_codons_present.txt


write_file( 'output/sequences_with_codons_present.txt', @output_array );

# write functions which



# construct the amino acid data into a data structure that can be looped over (you will want a multi-dimensional structure)
# anything else you feel would be suitable to go in a function

# Note, you can utilise anything we have previously written, but see if you can extend further

# Bonus points if you can make >60% of the code into functions
