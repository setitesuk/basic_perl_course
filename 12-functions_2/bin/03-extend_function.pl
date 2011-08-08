#!/software/perl -w

use Modern::Perl;

sub find_amino_acid_by_codon {
  my @params = @_;
  my $sequence = $params[0];
  my $codon = $params[1];

  my $return;

  if ( $sequence =~ m/$codon/ixms ) {
    $return = 1;
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

foreach my $sequence ( @seqs ) {
  if ( find_amino_acid_by_codon( $sequence, 'AAA' ) ) {
    say "$sequence contains Lysine";
  } else {
    say "$sequence does not contain Lysine"
  }
}
