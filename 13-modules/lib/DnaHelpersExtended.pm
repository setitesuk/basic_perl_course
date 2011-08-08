package DnaHelpersExtended;

use Modern::Perl;
use File::Slurp;


use base 'Exporter';
our @EXPORT = qw{
  find_amino_acid
  amino_acid_codes
  sequence_and_present_amino_acid_codes
};

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


1;
