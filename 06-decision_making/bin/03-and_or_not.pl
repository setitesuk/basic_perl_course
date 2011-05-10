#!/software/perl -w

use Modern::Perl;

# What if you want to progress on when two or more things are true, maybe one is true

# && / and

my $true = 1;
my $also_true = 2;
my $false = 0;
my $also_false = 0;

if ( $true && $also_true ) {
  say 'true && also_true is true';
}

__END__

unless ( $true && $false ) {
  say 'true && false is not true'
} # note: using unless

unless ( $false and $also_false ) {
  say 'false and also_false not true';
}

__END__

# || / or

if ( $true || $also_true ) {
  say 'true || also_true is true';
}

if ( $true || $false ) {
  say 'true || false is true';
}

__END__

if ( $false or $true ) {
  say 'false or true is true';
}

unless ( $false or $also_false ) {
  say 'false or also_false is false';
}

__END__

# ! / not

if ( ! $false ) {
  say 'false has been made true with !';
}
if ( not $also_false ) {
  say 'also_false has been made true with not';
}

__END__

# && / || have higher preference than and / or, best not to mix to behave as you expect

# we can mix and match groups of true/false 

if ( $false
      ||
     ( $true && $also_true )
   ) {
  say 'I got to true in the end';
}

__END__

# does sequence contain a methionine and stop (may be a gene)

my $sequence = 'CCGGATCACTATGACCTG';

if ( $sequence =~ m/atg/im
      &&
     ( $sequence =~ m/TAA/im || $sequence =~ m/TAG/im || $sequence =~ m/TGA/im )
  ) {
    say 'contains a methionine codon and a stop codon';
}

__END__

if ( $sequence =~ m/atg/im
      &&
      ! ( $sequence =~ m/CAA/im || $sequence =~ m/CAG/im )
  ) {
    say 'contains a methionine codon and not a glutamine codon';
}

__END__

# we can use || in assignment

my $truth = $false || $true;

say 'truth: ' . $truth;

# line up many, cut out as soon as a true value found

$truth = $false || $also_true || 'I am a truthful string';

say 'truth: ' . $truth;

__END__

# we can stick in operations

$truth = ( $false + $also_false ) || ( $true + $also_true);

say 'truth: ' . $truth;

# ||= if no this, make this that

$truth ||= $true;

say 'truth: ' . $truth;

$truth = 0; # remember, 0 is false

$truth ||= {}; # you can see this sort of thing a lot when we explore functions and objects

say 'truth: ' . $truth;

