#!/software/perl -w

use Modern::Perl;

my $sequence_1 = 'GATCGGAAGAGCGGTTCAGCAGGCATGCCGAGACCGA';
my $sequence_2 = 'TATAGTTAACAATAATATATAGTCTCAACTAGATACG';
my $sequence_3 = 'CAGGCATGCCGAGACCGATATAGTTAACAATAATATA';

# 1) lower case each string

say lc $sequence_1;
say lc $sequence_2;
say lc $sequence_3;

# 2) do any of the sequences contain methionine (atg)?

if ( $sequence_1 =~ m/atg/im ) {
  say 'sequence 1 contains methionine';
}

if ( $sequence_2 =~ m/atg/im ) {
  say 'sequence 2 contains methionine';
}

if ( $sequence_3 =~ m/atg/im ) {
  say 'sequence 3 contains methionine';
}

# 3) do any of the sequences contain a stop codon (taa,tag,tga)?

if ( $sequence_1 =~ m/taa/im || $sequence_1 =~ m/tag/im || $sequence_1 =~ m/tga/im ) {
  say 'sequence 1 contains stop';
}

if ( $sequence_2 =~ m/taa/im || $sequence_1 =~ m/tag/im || $sequence_1 =~ m/tga/im ) {
  say 'sequence 2 contains stop';
}

if ( $sequence_3 =~ m/taa/im || $sequence_1 =~ m/tag/im || $sequence_1 =~ m/tga/im ) {
  say 'sequence 3 contains stop';
}

# 4) what is the %age GC content of each string?

foreach my $seq ( $sequence_1, $sequence_2, $sequence_3 ) {
  say ( ( ( $seq =~ tr/GCgc/GCgc/ ) * 100 ) /  length $seq );
}

# 5) Let the user enter a codon to exchange methionine for in sequence_1, and switch it
# Bonus points for challenging a non-dna base letter

print 'Enter a codon you would like to swap methionine (atg) for: ';
my $user_codon = <STDIN>;
chomp $user_codon;

while ( $user_codon =~ m/[bd-fi-su-z]/im ) {
  print 'The codon you entered contains non_dna bases. Please try again: ';
  $user_codon = <STDIN>;
  chomp $user_codon;
}

$sequence_1 =~ s/atg/$user_codon/im;
say $sequence_1;

# 6) BONUS: assuming sequence is always read 5' to 3', can you print out the reverse complement
# in the order it is read of each sequence (hint, there is a reverse function, and
# you will need an extra assignment step, or the word scalar in front of it)

foreach my $seq ( $sequence_1, $sequence_2, $sequence_3 ) {
  $seq =~ tr/ACGTacgt/TGCAtgca/;
  $seq = reverse $seq;
  say $seq;
}

