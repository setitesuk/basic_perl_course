#!/software/perl -w

use Modern::Perl;

# The while keyword

my $true_comparison = 10;
my $count = 0;

while ( $count < $true_comparison ) {
  say 'while version : ' . $count;
  $count++; # increment count
}

__END__

# until - less used version, try not to use unless it is not readable with while

$count = 0;

until ( $count == $true_comparison ) {
  say 'until version : ' . $count;
  $count++;
}

__END__

# for and foreach
# both are actually interchangeable, although they should be used differently

my @codons = qw{AAA AAC AAG AAT ACA ACC ACG ACT AGA AGC AGG AGT ATA ATC ATG ATT};

foreach my $codon ( @codons ) { # fairly common to see for instead of foreach
  say 'foreach version : ' . $codon;
}

__END__

for (my $i = 0; $i < @codons; $i++ ) { # almost never see foreach instead of for
  say 'for version : ' . $codons[$i];
}

# since this is the 'C' version, it is not liked in the community, as such would
# suggest foreach and put a counter like while if you need to know the index

__END__

# you can also use while whilst looping over and array

while ( my $codon = shift @codons ) {
  say 'while method of looping over array: ' . $codon;
}

# however, this will erase the array, but stops because the statement becomes false
# when the assignment can't be done, as no more things in the array
# until won't work here!