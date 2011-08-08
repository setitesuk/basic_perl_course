#!/software/perl -w

use Modern::Perl;

sub find_amino_acid {
  my @params = @_;
  my $sequence = $params[0];
  my $amino_acid = $params[1];

  say "I am going to see if I can find $amino_acid in $sequence:";

  my %genetic_code_data = (
    'Alanine' => [ 'GCA', 'GCC', 'GCG', 'GCT' ],
    'Lysine' => [ 'AAA', 'AAG' ],
    'Methionine' => [ 'ATG' ],
    'Stop' => [ 'TAA', 'TAG', 'TGA' ],
  );

  my $return;

  foreach my $codon ( @{ $genetic_code_data{ $amino_acid } } ) {

    if ( $sequence =~ m/$codon/ixms ) {
      $return = 1;
    }

  }

  return $return;
}

my @seqs = qw{
  ACTGATCGATAGCTAGCTAGCTAGGCT
  ACGTAGCTGACAGCTGACGGCTAAAAG
  GCTGATCGATGCTAGGCTTTAGGGGAA
  AGCTGATAGTATTAAAAAATATATAAA
  AAGCTTGCATGCCCGGGATCGGTCGCT
  CCCGTTCGTCGCTGCTCGTCGTCGTCG
};

foreach my $amino_acid ( qw{Alanine Lysine Methionine Stop} ) {
  foreach my $sequence ( @seqs ) {
    if ( find_amino_acid( $sequence, $amino_acid ) ) {
      say "\tFound";
    } else {
      say "\tNot Found";
    }
  }
}
