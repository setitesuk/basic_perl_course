#!/software/perl -w

use Modern::Perl;

# transliterate is an odd one, but can be very useful, especially when combined with it's return value,
# and the reverse function (which we will look at later)

my $sequence = 'CCGGATCACTATGACCTGCTTTCGCACCTGCTCGCGCCGTCACGCTCGCAGTC';

# how would you quickly get the base which pairs with the one above it?

my $reverse_strand = $sequence;

$reverse_strand =~ tr/ACGT/TGCA/;

say $sequence;
say $reverse_strand;

# we have an in-place substitution of A's for T's, C's for G's, G's for C's and T's for A's

__END__

# again the return value is the number of transliterations made, except that you get 0 (still false) if none are made

$reverse_strand = $sequence;

say $reverse_strand =~ tr/ACGT/TGCA/;
my $bees = 'BBBBBBBBBBBBB';
say $bees =~ tr/ACGT/TGCA/;

__END__

# deciphering the simplest coded message

my $original_message = 'The quick brown fox jumped over the lazy dog.';
say $original_message;
my $coded_message = $original_message;
$coded_message =~ tr/a-zA-Z ./N-ZA-Mn-za-m. /;
say $coded_message;

__END__

# you can use this to count the chars in a string, as you can substitute a char for itself

say $sequence;
say "The number of A's in above = " . ( $sequence =~ tr/Aa/Aa/ );
say $sequence; # it is unchanged

__END__

say "percentage GC = " . ( ( $sequence =~ tr/CGcg/CGcg/ ) * 100 / (  $sequence =~ tr/ACGTacgt/ACGTacgt/ ) );
say $sequence;

# There are some flags for transliterate, but are very rarely needed
# and you will probably break things if you try to use any
