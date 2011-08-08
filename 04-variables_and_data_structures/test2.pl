#! /software/perl -w

use Modern::Perl;


my @tv_Progs = (
  {
    name => 'Doctor Who',
    main_character => 'The Doctor',
  },
  {
    name => 'Babylon 5',
    main_character => 'Sheridan',
  },
  {
    name => 'Life on Mars',
    main_character => 'Gene Hunt',
  },
  {
    name => 'Star Trek',
    main_character => 'Kirk',
  },
  {
    name => 'Camberwick Green',
    main_character => 'Windy Miller',
  },
);

foreach my $tv_prog ( @tv_Progs ) {
  say $tv_prog;
  say $tv_prog->{main_character};
}
