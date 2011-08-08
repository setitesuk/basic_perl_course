#!/software/perl -w

use Modern::Perl;

use lib 'lib';
use SequenceManipulatorAttributes;

my $sequence_manipulator = SequenceManipulatorAttributes->new( {
  sequence => 'ACTAGTCGATCTGATCGTAGCGTNGCTAGTCGTAT',
} );

say $sequence_manipulator;
say $sequence_manipulator->sequence();

my $sequence_manipulator_2 = SequenceManipulatorAttributes->new();

say $sequence_manipulator_2;
$sequence_manipulator_2->sequence( 'agctagctgatctgatgtcnnagctgatgct' );
say $sequence_manipulator_2->sequence();
