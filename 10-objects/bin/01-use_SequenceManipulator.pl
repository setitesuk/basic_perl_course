#!/software/perl -w

use Modern::Perl;

use lib 'lib';
use SequenceManipulator;

my $sequence_manipulator = SequenceManipulator->new();

say $sequence_manipulator;
