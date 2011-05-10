#!/software/perl -w

use Modern::Perl;

use lib 'lib';
use SequenceManipulatorMethods;

my $sequence_manipulator = SequenceManipulatorMethods->new( {
  sequence => 'ACTAGTCGATCTGATCGTAGCGTNGCTAGTCGTAT',
} );

say $sequence_manipulator;
say $sequence_manipulator->sequence();

$sequence_manipulator->change_base( 'a', 't' );
say $sequence_manipulator->sequence();
