#!/software/perl -w

use Modern::Perl;

###

# using the file 07-file_operations/data/1234_1_qseq.txt write a script
# that will obtain the sequence and the quality scores, generate a unique
# name for each read from other information, and then output out in the format

# read_name
# sequence
# quality

# into another file

# note to remember, file paths are relative to where you run from

use File::Slurp;

# read in a file
my @reads = read_file( '../07-file_operations/data/1234_1_qseq.txt' );

# create an empty output array
my @named_reads;

foreach my $read ( @reads ) {
  # split each read on the whitespace into elements
  my @data = split /\s+/m, $read;
  # take an array slice of the first 6 elements, and join them together to make a unique name
  my $name = join '_', (@data[0..5]);
  # join the name, the read and the quality strings together with a newline character,
  # (the extra empty string ensures another newline is after the quality) and then
  # push into the output array
  push @named_reads, (join "\n", $name, $data[8], $data[9], '');
}

# write out the output array to the file
write_file( 'output/named_reads.txt', @named_reads );


# for bonus points, try rewriting to use both methods for open/reading/writing

# open a filehandle for reading on the required file
open my $fh_read, '<', '../07-file_operations/data/1234_1_qseq.txt' or die 'could not open ../07-file_operations/data/1234_1_qseq.txt for reading';
# open a filehandle for writing to the file we want the output with
open my $fh_write, '>', 'output/named_reads_with_filehandles.txt' or die ' could not open /output/named_reads_with_filehandles.txt for writing';

# loop over the reads found in the file
while ( <$fh_read> ) {
  # split each read on the whitespace into elements
  my @data = split /\s+/m, $_;
  # take an array slice of the first 6 elements, and join them together to make a unique name
  my $name = join '_', (@data[0..5]);
  # join as previously, but print directly out to the filehandle for writing
  print {$fh_write} (join "\n", $name, $data[8], $data[9], '');
}

# close both filehandles
close $fh_read or die 'unable to close read filehandle ' . $fh_read;
close $fh_write or die 'unable to close write filehandle ' . $fh_write;

# whilst using File::Slurp is efficient here in the amount of code written, much larger qseq files
# would warrant using the open/print/close due to memory restrictions

# diff output/named_reads.txt output/named_reads_with_filehandles.txt


