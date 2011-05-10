#!/software/perl -w

use Modern::Perl;
use File::Slurp;

use lib 'lib';
use AminoAcidObject;

my $amino_acid_object = AminoAcidObject->new();

$amino_acid_oject->amino_acid_filename('data/amino_acid_codes.txt'); 

say $amino_acid_object;
my @aa = $amino_acid_object->split_data();

use Test::More; diag explain \@aa;

