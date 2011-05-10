package DnaHelpers;

use Modern::Perl;

use base 'Exporter';
our @EXPORT = qw{find_amino_acid};

sub find_amino_acid {
  my ( $sequence, $amino_acid_data ) = @_;

  my $return;

  foreach my $codon ( @{ $amino_acid_data->{codons} } ) {

    if ( $sequence =~ m/$codon/ixms ) {
      $return = $amino_acid_data->{'3_letter_code'};
      last;
    }

  }

  return $return;
}


1;
