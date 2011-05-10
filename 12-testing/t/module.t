# $Id$
use Test::More tests => 3;

use_ok ( 'DnaHelpers' );

my $sequence = 'ACATCAGATCGTAGCTGCTCGCTGCGATATGC';
my %amino_acids = (
  Methionine => {
    '3_letter_code' => 'Met',
    codons => [ qw{ATG} ]
  },
);

is( find_amino_acid( $sequence, $amino_acids{Methionine} ), 'Met',  'Methionine found' );

$sequence = 'ACATCAGATCGTAGCTGCTCGCTGCGATACGC';
is( find_amino_acid( $sequence, $amino_acids{Methionine} ), undef,  'Methionine not found' );
