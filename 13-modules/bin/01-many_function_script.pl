#!/software/perl -w

use Modern::Perl;

use File::Slurp;

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

# produce a hash which has the sequence as the key, and all the amino acids
# codes for amino acids found as an arrayref for that sequence
sub sequence_and_present_amino_acid_codes {

  my %amino_acid_codes = amino_acid_codes( 'data/amino_acid_codes.txt' );

  my @sequences = read_file( 'data/sequences.txt' );

  my %results;

  foreach my $sequence ( @sequences ) {

    chomp $sequence;
    my @seen_amino_acid_codes;

    foreach my $amino_acid ( sort keys %amino_acid_codes ) {

      my $seen_amino_acid_code = find_amino_acid( $sequence, $amino_acid_codes{$amino_acid} );
      push @seen_amino_acid_codes, $seen_amino_acid_code if $seen_amino_acid_code;
    }

    $results{$sequence} = [ @seen_amino_acid_codes ];

  }

  return %results;
}

# read the file provided, and return the data in a hash with the amino acid as a key,
# and it code and and codons in hashrefs of it, the codons are in an arrayref
sub amino_acid_codes {
  my ( $source_file ) = @_;

  my @rows = read_file( $source_file );

  my %amino_acid_codes;

  foreach my $row ( @rows ) {
    chomp $row;
    my @items = split /\s+/xms, $row;
    my $amino_acid = shift @items;
    my $three_letter_code = shift @items;
    $amino_acid_codes{$amino_acid} = {
      '3_letter_code' => $three_letter_code,
      'codons' => [ @items ],
    };
  }

  return %amino_acid_codes;
}

# taking a sequence and a hashref of data about a particular amino acid, find out
# if it is present, and return the 3 letter code for the amino acid if it is
sub find_amino_acid {
  my ( $sequence, $amino_acid_data ) = @_;

  my $return;

  foreach my $codon ( @{ $amino_acid_data->{codons} } ) {

    if ( $sequence =~ m/$codon/ixms ) {
      $return = $amino_acid_data->{'3_letter_code'};
      last;
    }

  }

  return $return;
}

