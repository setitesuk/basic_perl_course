package SequenceManipulatorAttributes;

use Modern::Perl;
use Moose;

has 'sequence' => (
  isa => 'Str',
  is  => 'rw',
);


1;
