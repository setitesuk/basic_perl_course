#!/software/perl -w

use Modern::Perl;

my $contact = 'Andy Brown: 01234 567890';

my @contact_details = $contact =~ m/(\w+)\s+(\w+):\s+(\d+)\s+(\d+)/;
say $contact_details[1];

