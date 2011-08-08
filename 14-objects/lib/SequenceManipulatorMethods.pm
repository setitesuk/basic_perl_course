package SequenceManipulatorMethods;

use Modern::Perl;
use Moose;

has 'sequence' => (
  isa => 'Str',
  is  => 'rw',
);

sub length {
  my ( $self ) = @_;
  return length $self->sequence();
}

sub change_base {
  my ( $self, $original_base, $new_base ) = @_;

  if ( $original_base !~ m/[ACGTN]/ixms || $new_base !~ m/[ACGTN]/ixms ) {
    die 'one of your bases is not a legitimate base';
  }

  my $sequence = $self->sequence();

  $sequence =~ s/$original_base/$new_base/gixms;

  $self->sequence( $sequence );

  return $sequence;
}


1;
