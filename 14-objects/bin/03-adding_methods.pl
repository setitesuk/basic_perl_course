#!/software/perl -w

use Modern::Perl;

use lib 'lib';
use SequenceManipulatorMethods;

my $sequence_manipulator = SequenceManipulatorMethods->new( {
  sequence => 'ACTAGTCGATCTGATCGTAGCGTNGCTAGTCGTAT',
} );

say $sequence_manipulator;
say $sequence_manipulator->sequence();
say $sequence_manipulator->length();
