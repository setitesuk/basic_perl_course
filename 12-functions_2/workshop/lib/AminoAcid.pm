package AminoAcid;

use Modern::Perl;
use File::Slurp;

use base 'Exporter';
our @EXPORT = qw{split_data codon_finder three_letter_codes};

sub codon_finder {

}

sub three_letter_codes {

}

sub split_data {
  my @params = @_;

  my $amino_acid_file = $params[0];

  my @amino_acid_data = read_file( $amino_acid_file );

  my @split_amino_acid_data;

  foreach my $aa_row ( @amino_acid_data ) {
    my @data = split m/\s+/im, $aa_row;
    my $data_array_ref = \@data;
    push @split_amino_acid_data, $data_array_ref;
  }

  return @split_amino_acid_data;
}

1;
