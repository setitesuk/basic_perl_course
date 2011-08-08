#!/software/perl -w

use Modern::Perl;

# write a module (in the lib directory) which has a methods to

# 1) return some DNA sequences,
# 2) a method to work out the gc content (number of those bases) of a given dna sequence
# 3) a method to work out the ta content (number of those bases) of a given dna sequence

# write the script to use this, and loop over the dna sequences returned informing you of the gc and ta content

# go onto 02-reuse_module.pl

use lib 'lib';
use SequenceCreator;

my @sequences = sequencing_machine();

foreach my $sequence ( @sequences ) {
  say $sequence;
  say 'GC count: ' . gc_count( $sequence );
  say 'TA count: ' . ta_count( $sequence );
}

