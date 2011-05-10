#!/software/perl -w

use Modern::Perl;

my @arguments = @ARGV; # @ARGV is a special array which contains all the space separated words after the command

foreach my $argument ( @ARGV ) {
  say $argument;
}

# we'll look at foreach later