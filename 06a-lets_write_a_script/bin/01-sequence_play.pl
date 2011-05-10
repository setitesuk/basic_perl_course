#!/software/perl -w

use Modern::Perl;

my $sequence_1 = 'GATCGGAAGAGCGGTTCAGCAGGCATGCCGAGACCGA';
my $sequence_2 = 'TATAGTTAACAATAATATATAGTCTCAACTAGATACG';
my $sequence_3 = 'CAGGCATGCCGAGACCGATATAGTTAACAATAATATA';

# 1) lower case each string

# 2) do any of the sequences contain methionine (atg)?

# 3) do any of the sequences contain a stop codon (taa,tag,tga)?

# 4) what is the %age GC content of each string?

# 5) create a hash data structure with codons as the keys, and the sequences
# underneath them if they contain that. Bonus points if you can
# refer to the sequence by name, rather than the base string, and you can
# generate in the smallest amount of code possible

# e.g. %codon_in_sequences = (
#    atg => <data structure containing the sequence atg is present in>,
#    taa => <data structure containing the sequence taa is present in>,
#    ...
#  );

# 6) Let the user enter a codon to exchange methionine for in sequence_1, and switch it
# Bonus points for challenging a non-dna base letter

# 7) BONUS: assuming sequence is always read 5' to 3', can you print out the reverse complement
# in the order it is read of each sequence (hint, there is a reverse function, and
# you will need an extra assignment step, or the word scalar in front of it)

