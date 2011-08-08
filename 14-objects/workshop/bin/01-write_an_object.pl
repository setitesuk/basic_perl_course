#!/software/perl -w

use Modern::Perl;

# Objects are perfect for keeping code with data, and for mocking out real objects
# (after all, what is a sequencing machine except for something which takes in an
# input and outputs sequence.)

# In this workshop, I would like you to create 3 objects

# A sequencing machine object, which can generate sequence reads of an requested length, and a
# random quantity between 100 and 200

# A sequence object which has some methods to inform you of information about the sequence

# An object which provides the codons for an amino acid (bonus points if you can make it produce
# all the amino acids as individual objects to act upon) - the amino_acid_codes file is in the data directory

# In the lib directory, you will find copies of the modules DnaHelpersExtended and SequenceCreator,
# which have most of the methods you will need (although you will need to change them)

# In this script, we should see the sequencing machine producing reads, looking at each as an object
# and looking for Methionine and a stop codon, as these may contain a complete gene

# use the three object classes (modules)

