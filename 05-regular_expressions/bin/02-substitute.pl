#!/software/perl -w

use Modern::Perl;

my $sequence = 'CCGGATCACTATGACCTGCTTTCGCACCTGCTCGCGCCGTCACGCTCGCAGTC';

unless ( $sequence =~ m/cat/i ) {
  say 'we do not have a cat';
}

__END__

# we want a cat

$sequence =~ s/cac/cat/i;

if ( $sequence =~ m/cat/i ) {
  say 'we now have a cat';
}

# how many cats?

say $sequence; # 1 - how many cac's were there? 3

# note it did the first one it came to

__END__

# how do we get 3 cats - use /g (globally substitute)

$sequence =~ s/cac/cat/gi;

say $sequence;

# be careful with the g flag, if you only want to introduce 1 coding change, then you don't want to globally substitute all of one codon.

__END__

# You can substitute in a user defined variable
# You can substitute for a user defined variable

my $favourite_codon = 'aaa'; # it's all the first letter of my name;
my $least_favourite_codon = 'cat'; # I don't actually like cats

$sequence =~ s/$least_favourite_codon/$favourite_codon/gi;

say $sequence;

__END__

# the return value is the number of substitutions made, or undef if none are made
# because of the false value for no substitutions, you can use as a boolean

say $sequence =~ s/aaa/cac/i; # 1 (we didn't specify global)
say $sequence =~ s/aaa/cac/gi; # 2 (the remaining ones)
say $sequence =~ s/cat/aaa/gi; # undef, we had already cleared away all the cats

__END__

# in substituting, watch out for greediness

my $clone = $sequence;

$sequence =~ s/g.*cac/aaa/i;
say $sequence;
$clone =~ s/g.*?cac/aaa/i;
say $clone;
# note that we wouldn't have been able to do multiple substitutions,
# since the first one was the first g matched to the last cac



