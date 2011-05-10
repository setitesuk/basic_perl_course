#! /software/perl -w

use Modern::Perl;

my @array1 = qw{Hello Goodbye Chow};

my @array2 = qw{StarTrek Babylon5 CamberwickGreen};

my @array3 = qw{Cheese Ham Tuna};

foreach my $item ( @array1 ) {
  waffle($item);
}
foreach my $item ( @array2 ) {
  waffle($item);
}
foreach my $item ( @array3 ) {
  waffle($item);
}


sub waffle {
  my @params = @_;
  my $item = $params[0];

  say $item . ' supercalifragilisticexpealidocious';
  say 'never mind the ' . $item;
  say 'You say ' . $item . ', I say ' . $item;

  say 'hello';
  say 'goodbye';
  say 'chow';
  say 'bonjour';
  say 'bonjourno';
  say 'gutentag';

  return;
}
