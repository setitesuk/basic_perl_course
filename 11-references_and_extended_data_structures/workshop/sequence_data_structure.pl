#!/Users/ajb/dev/bin/perl -w

use Modern::Perl;

my $sequence_1 = 'GATCGGAAGAGCGGTTCAGCAGGCATGCCGAGACCGA';
my $sequence_2 = 'TATAGTTAACAATAATATATAGTCTCAACTAGATACG';
my $sequence_3 = 'CAGGCATGCCGAGACCGATATAGTTAACAATAATATA';

# 1) Create an arrayref containing all three sequences



# 2) create an arrayref which contains all the sequences which contain the
# codon ATG 



# 3) create a hashref of the sequences keyed by their name



# 4) create a hash data structure with codons as the keys, and the sequences
# underneath them if they contain that. Bonus points if you can
# refer to the sequence by name, rather than the base string, and you can
# generate in the smallest amount of code possible

# e.g. %codon_in_sequences = (
#    atg => <data structure containing the sequence atg is present in>,
#    taa => <data structure containing the sequence taa is present in>,
#    ...
#  );

