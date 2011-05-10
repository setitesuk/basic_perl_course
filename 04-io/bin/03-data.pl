#!/software/perl -w

use Modern::Perl;

while ( my $line = <DATA> ) {
  print $line; 
} # special filehandle which says to read all the text after the __DATA__ or __END__ marker


__DATA__

Is this the real life?
Is this just fantasy?
Caught in a Landslide
No escape from Reality

Open your eyes,
Look up to the sky and see

I'm just a poor boy
I need no sympathy
