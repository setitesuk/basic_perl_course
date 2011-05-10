#!/software/perl -w

use Modern::Perl;

my $sequence = 'AGGTCCAGTATGCAAGCAGACAAATGCTACACGTGAGATTGCTAGACCGCGGCGGGCTTCTATGCTGGTTTTTTTAGGTGCCACCTGCGGGCTTGCGCCTAAGATGAGCCATGGACTGGTCTCCCTGCGCGTGTTACTACACTCGAGTCCGCCGCTACGCGCGAAACTCAAGGGACGCCGAGAGCGAACGTGATGAGAGACCATTTAGCACATGTGCGTGCGGCCAGCAGAGTGGGGCAAATTAAGACAGGAATAGTCACGTATCGTAAGTAAGGTTGCGGTAGCCACTAGGCTGTGCTACGTATAGTGGCACCTTATGCGCGTCTGCACGCCACGTATAATTATCCACATTGGGTATCTATCTCTGTCGGTCAGGCGCTTTGGGACCATATCCTTTGGCCGTATTTATTTCGGTCCACTATAGACGCCTGCCGGTCCGAACCGAGTAAATCCATAGTTGCGCCCTTCCCGAGATTTACCGAACCGTTAGGTGGAACCGAGGGAGGTGTTCCCGACATAGTGGCTCGGACTGCAGAACCTCTATGCAATTGCTCACCGCCATAGGAGATCTCGGGCTCGGCGGGTTAAATTATCGTTTGTAGAGAGGCATTACCTTAGTTTTCTCTACGTGCTGCCGGCTAGCAATCAAG';

# add methods to the module to return the length, and the gc and ta percentages of given sequences

# in this script, use the sequence given in $sequence to tell the length, ta count, gc count, ta percentage, gc percentage

# check that 01-write_module.pl still works, even though there are more functions in the module.

use lib 'lib';
use SequenceCreator;

say 'Sequence length: ' . sequence_length( $sequence );
say 'TA count: ' . ta_count ( $sequence );
say 'TA percentage: ' . ta_percentage ( $sequence );
say 'GC count: ' . gc_count ( $sequence );
say 'GC percentage: ' . gc_percentage ( $sequence );

# Bonus points - add a function which gives the reverse strand

say reverse_strand( $sequence );