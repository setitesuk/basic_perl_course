#!/software/perl -w

use Modern::Perl;

use File::Slurp;
use lib 'lib';
use DnaHelpersExtended;

# this case has further 'refactored' the code to have almost everything in a function,
# and also uses find_amino_acid, which has been slightly modified from our previous incarnation

# we will use this to help us move on to our next topic - modules

write_sequences_with_amino_acid_codes_to_file();

# deal with obtaining the required data and write it to file
sub write_sequences_with_amino_acid_codes_to_file {
  my %sequence_and_codes = sequence_and_present_amino_acid_codes();
  my @results;

  foreach my $sequence ( keys %sequence_and_codes ) {
    push @results, ( join "\t", $sequence, @{$sequence_and_codes{$sequence}} ) . "\n";
  }

  write_file( 'output/sequences_with_codons_present.txt', @results );
}

