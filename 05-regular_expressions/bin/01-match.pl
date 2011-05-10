#!/software/perl -w

use Modern::Perl;

# syntax
# 'string' =~ m/something to match against/xms(i)

my $sequence = 'CCGGATCACTATGACCTGCTTTCGCACCTGCTCGCGCCGTCACGCTCGCAGTC';

say $sequence;

if ( $sequence =~ m/ATG/i ) {
  say 'Sequence contains Methionine';
}

__END__

# does it contain a number (\d represents a digit, + is 1 or more)

if ( $sequence =~ m/\d+/ ) {
  say 'Sequence contain a number';
}

# does it not contain a number ( !~ is does not match operator)

if ( $sequence !~ m/\d+/ ) {
  say 'Sequence does not contain a number';
}

__END__

# does it contain a word character ( \w )

if ( $sequence =~ m/\w+/ ) {
  say 'Sequence contains word characters';
}

__END__

# does it contain a whitespace character ( \s ) - this includes \t (tab), \n (newline), ' ' (space)

my $lyrics = 'I see a little silhoutte of a man';

if ( $lyrics =~ m/\s/ ) {
  say 'Lyrics contain whitespace';
}

__END__

# we can capture information from the regex

my ( $silhoutte ) = $lyrics =~ m/\s(silhoutte)\s/i;

say $silhoutte;

__END__

# we can even capture all words like this
# capture the first word
my ( $first_word ) = $lyrics =~ m/(\w+)\s+/;

say $first_word;

# capture last word (\z matched end of string, * means 0 or more)

my ( $last_word ) = $lyrics =~ m/\s(\w+)\s*\z/m; 
say $last_word;

__END__

# regex + and * are greedy (they match the maximum that they can)
# my $sequence = 'CCGGATCACTATGACCTGCTTTCGCACCTGCTCGCGCCGTCACGCTCGCAGTC';

my ( $greedy_match ) = $sequence =~ /(\w+ACC)/;
say $greedy_match;

__END__

# to make not greedy, add ?

my ( $non_greedy_match ) = $sequence =~ /(\w+?ACC)/;
say $non_greedy_match;

__END__

# we can match user defined matches

my $user_wants_to_find_this_sequence = 'ttt';

if ( $sequence =~ /$user_wants_to_find_this_sequence/i ) {
  say "User sequence $user_wants_to_find_this_sequence found.";
}

__END__

####### what do i and m represent?

# what are the letters afterwards

# i - ignore case (obviously, be sure you want this)
# m - line boundaries ^ and $ mean different things in perl to other languages. to make it consistent,
# the m flag means ^ match at the start of any line, and $ means match at the end of any line
# (ordinarily, they mean match at start and end of the string explicitly)

# i.e.

my $text = '

Here is some
text to match


and some more that
should be expected

';

unless ( $text =~ m/(^Here.*expected$)/ ) {
  say 'The text did not match, as ^ is start of string and $ is end of the string';
}

if ( $text =~ m/(^Here.*?expected$)/m ) {
  say 'The text matched is as ^ is start of line and $ is end of a line';
}

# If you want to explicitly state match start of string, use m/\AHello/xms
# If you want to explicitly state match end of string,   use m/Goodbye\z/xms

