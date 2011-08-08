#! /software/perl -w

use Modern::Perl;


my @tv_Progs = ();
my %tv_Prog = (
  name => 'Star Trek',
  main_character => 'Kirk',
  first_officer => 'spock',
);

push @tv_Progs, \%tv_Prog;

say $tv_Progs[0]->{main_character};


