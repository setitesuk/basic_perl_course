use Test::More tests => 203;

use_ok( 'PerlSequencer' );

my $sequencer = PerlSequencer->new();

isa_ok( $sequencer, 'PerlSequencer', 'object' );

my @sequences = $sequencer->produce_reads( 25 );

is( scalar @sequences, 200, q{produce reads produced 200 reads} );

my $count = 1;
foreach my $sequence ( @sequences ) {
  is( length $sequence, 25, "sequence $count has length 25" );
  $count++;
}
