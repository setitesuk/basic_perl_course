#!/software/perl -w

use Modern::Perl;

use File::Slurp;

### slurp in a whole book

my $slobbit = read_file( 'data/the_slobbit' );

say $slobbit;

__END__

### we can do something to it

$slobbit =~ s/Andy/Bilbo/gm;

say 'Hero changed';
say $slobbit;

__END__

# our data may be in some table like format, so we probably don't want it all in one scalar
# slurp in a qseq file, with rows going into an array

my @reads = read_file( 'data/1234_1_qseq.txt' );

say @reads;

__END__

foreach my $read ( @reads ) {
  my @data = split /\s+/m, $read;
  say $data[8];
}

__END__

### In many cases, always take advantage of File::Slurp

### However, if you want to do it completely by yourself, you need to go through some steps

### open a file handle to the file you want to read

open my $fh, '<', 'data/the_slobbit' or die 'Could not open data/the_slobbit for reading';

while ( <$fh> ) {
  s/Gran/Uncle/xms;
  print;
}

close $fh or die 'Could not close the filehandle for file data/the_slobbit';

