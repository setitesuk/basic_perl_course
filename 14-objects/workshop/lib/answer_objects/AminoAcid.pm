package AminoAcid;

use Modern::Perl;
use Moose;
use File::Slurp; # we know we will want to obtain the amino acid data from a file, so we need to use this to read it

has 'name' => (
  isa => 'Str',
  is  => 'ro',
);

has 'three_letter_code' => (
  isa => 'Str',
  is  => 'ro',
);

has 'codons' => (
  isa => 'ArrayRef',
  is  => 'ro',
);

# set up amino acid attributes. make them all ro as these are fixed data that will never change

sub amino_acids { # method to return all amino acids, as objects
  my ( $self ) = @_; # we need to capture the object

  my @rows = read_file( 'data/amino_acid_codes.txt' ); # read in the amino acid data

  my %amino_acid_codes;

  foreach my $row ( @rows ) {
    chomp $row;
    my @items = split /\s+/xms, $row;
    my $name = shift @items;
    my $three_letter_code = shift @items;

    $amino_acid_codes{$name} = AminoAcid->new( {
      name => $name,
      three_letter_code => $three_letter_code,
      codons => [ @items ],
    } );
    # instead of the data structure we did before, we'll create another AminoAcid object foreach, just keeping the original hash with the name as a key
  }

  return %amino_acid_codes;

}

1;