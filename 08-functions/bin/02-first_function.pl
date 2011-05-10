#!/software/perl -w

use Modern::Perl;

sub find_methionine {
  my @params = @_;
  my $sequence = $params[0];

  my $return;

  if ( $sequence =~ m/ATG/ixms ) {
    $return = 1;
  }

  return $return;
}

my $sequence = 'ACTGATCGATAGCTAGCTAGCTAGGCT';

if ( find_methionine( $sequence ) ) {
  say "$sequence contains Methionine";
} else {
  say "$sequence does not contain Methionine"
}

$sequence .= 'ATG';

if ( find_methionine( $sequence ) ) {
  say "$sequence contains Methionine";
} else {
  say "$sequence does not contain Methionine"
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
  if ( find_methionine( $sequence ) ) {
    say "$sequence contains Methionine";
  } else {
    say "$sequence does not contain Methionine"
  }
}
