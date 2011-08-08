#!/software/perl -w

use Modern::Perl;

print 'Enter a number: ';
my $number = <STDIN>; # special filehandle which means that the program will stop and wait for some input by the user, followed by enter
chomp $number; # this will remove the newline character

say "You entered $number. The square of this number is " . $number**2 . '.';
