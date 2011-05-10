#!/software/perl -w

use Modern::Perl;

# Objects are perfect for keeping code with data, and for mocking out real objects
# (after all, what is a sequencing machine except for something which takes in an
# input and outputs sequence.)

# In this workshop, I would like you to create 3 objects

# A sequencing machine object, which can generate sequence reads of an requested length, and a
# quantity of 200

# A sequence object which has some methods to inform you of information about the sequence

# An object which provides the codons for an amino acid (bonus points if you can make it produce
# all the amino acids as individual objects to act upon) - the amino_acid_codes file is in the data directory

# In the lib directory, you will find copies of the modules DnaHelpersExtended and SequenceCreator,
# which have most of the methods you will need (although you will need to change them)

# In this script, we should see the sequencing machine producing reads, looking at each as an object
# and looking for Methionine and a stop codon, as these may contain a complete gene

# use the three object classes (modules)
use lib 'lib';
use PerlSequencer;
use Sequence;
use AminoAcid;

my $sequencer = PerlSequencer->new(); # get a sequencer object

my @sequences;
foreach my $sequence ( $sequencer->produce_reads( 75 ) ) {
  # produce_reads produces an array of sequences of requested length, which we loop over
  push @sequences, Sequence->new( { sequence => $sequence } );
  # each of the sequences we put into a sequence object, and store these in an array
}

my $amino_acid_data_source = AminoAcid->new(); # produce an amino acid data source object

my %amino_acids = $amino_acid_data_source->amino_acids(); # Obtain a data structure (hash) which has all the amino acids

my @contains_met_stp; # set up a capture array for the ones we want

foreach my $seq_object ( @sequences ) {

  my $has_met;
  my $has_stp;
    # set up some flags to set if we find the wanted aminon acids

  foreach my $amino_acid ( qw{ Methionine Stop } ) { # loop over just the wanted amino acid names


    foreach my $codon ( @{ $amino_acids{$amino_acid}->codons() } ) { # loop over the codons for the amino acid, retrieving from the amino acid object for the specific amino acid, via the codons attribute

      if ( $seq_object->contains( $codon ) ) { # use the contains method on the seq_object to see if it has the codon

        if ( $amino_acid eq 'Stop' ) {
          $has_stp++;
        } else {
          $has_met++;
        }
        # set the appropriate flag if found

        last; # don't carry on checking further codons, we already know we have found one

      }
    }
  }

  if ( $has_met and $has_stp ) {
    push @contains_met_stp, $seq_object;
  }
  # if we have both flags set, the push the seq_object onto the capture array
}

# give some output, by looping over the capture array, and printing out the sequences

say scalar @contains_met_stp . ' sequence contain both Methionine and Stop codons.';

say 'These sequences are: ';
foreach my $seq_object ( @contains_met_stp ) {
  say $seq_object->sequence();
}
