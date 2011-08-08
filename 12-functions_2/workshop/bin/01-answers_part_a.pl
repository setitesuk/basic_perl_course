#!/software/perl -w

use Modern::Perl;

# create a script (using functions) to create a file which, given a file of sequences and a file of amino acids,
# lists the amino acids next to the sequence

# i.e. ACGTAGCT.. Ala Stp..

# source files:

# data/amino_acid_codes.txt
# data/sequences.txt

# output file:

# output/sequences_with_codons_present.txt

# write functions which

# construct the amino acid data into a data structure that can be looped over (you will want a multi-dimensional structure)
# anything else you feel would be suitable to go in a function

use File::Slurp; # The files are small, so we'll take advantage of that for now

# first we need a function which will generate the amino acid data structure. I think that, for me, the most logical
# is to return a hash with amino acid names as keys

# looking at the file, each row contains

# name 3_letter_code codon1 [codon2...]
# Alanine Ala GCA GCC GCG GCT
# so, I'll look at a structure like

# %amino_acid_codes = (
#  'Alanine' => {
#    '3_letter_code' => 'Ala',
#    'codons' => [ 'GCA', 'GCC', 'GCG', 'GCT' ],
#  ...
# );

# this enables me to loop over using the names as keys
# find the codons, and loop over them easily
# enables me to fine the code to write next to the sequence

sub amino_acid_codes {
  my ( $source_file ) = @_;

  my @rows = read_file( $source_file ); # lets read the file in here

  my %amino_acid_codes; # we are going to return a hash

  foreach my $row ( @rows ) { # loop over all the rows
    chomp $row; # we'll ensure that there is no trailing newline

    my @items = split /\s+/xms, $row; # split by whitespace to get the items in the row

    my $amino_acid = shift @items; # the first item is the amino acid name, so shift that off and capture
    my $three_letter_code = shift @items; # the second item is the three letter code for the amino acid, so shift that off and capture


    $amino_acid_codes{$amino_acid} = {
      '3_letter_code' => $three_letter_code,
      'codons' => [ @items ], # all remaining items are codon sequences, so we'll put those directly into the data structure as an arrayref
    };
  }

  return %amino_acid_codes;
}

my %amino_acid_codes = amino_acid_codes( 'data/amino_acid_codes.txt' ); 

# lets quickly see what I get

use Test::More; diag explain \%amino_acid_codes;
