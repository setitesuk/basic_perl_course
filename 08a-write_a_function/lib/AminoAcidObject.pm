package AminoAcidObject;

use Moose;
use Modern::Perl;
use File::Slurp;

has 'amino_acid_filename' => (
  isa => 'Str',
  is  => 'rw',
);


sub split_data {
  my @params = @_;
  my $self = $params[0];

  my @amino_acid_data = read_file( $self->amino_acid_filename() );

  my @split_amino_acid_data;

  foreach my $aa_row ( @amino_acid_data ) {
    my @data = split m/\s+/im, $aa_row;
    my $data_array_ref = \@data;
    push @split_amino_acid_data, $data_array_ref;
  }

  return @split_amino_acid_data;
}

1;
