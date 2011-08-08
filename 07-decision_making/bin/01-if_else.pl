#!/software/perl -w

use Modern::Perl;

# we have already met some simple sections where we have made some chioces. Lets look at decision
# making a bit more closely, particularly since you will want to do more than just one/two things

# if
# two ways of writing code here

my $this = 'Hello';
my $that = 'Hello';

# block form
if ( $this ) {
  say $this;
}

__END__

# postfix form
say $that if $that;

# Advice: only use the post fix form if simple action and simple test of true

__END__

# unless
# The opposite of if

my $false;

# block form
unless ( $false ) {
  say 'I tested false';
}

# postfix form
say '0 is false' unless 0;

# varying arguments for and against the use of unless, partly because you can't extend the block form with else.

__END__

# else
# use with the block form of if to give you another thing to do

my $seq = 'CCGGATCACTATGACCTGCTTTCG';

if ( $seq =~ m/ATG/im ) {
  say "$seq contains Methionine";
} else {
  say "$seq contains that damned cat again";
}

__END__

my $clone = $seq;
$clone =~ s/atg/cat/gim;

if ( $clone =~ m/ATG/im ) {
  say "$clone contains Methionine";
} else {
  say "$clone contains that damned cat again";
}

__END__

# elsif
# again, with the block form of if, allows you to keep trying different 'true's until you find the one that you want

if ( $clone =~ m/ATG/im ) {
  say "$clone contains Methionine";
} elsif ( $clone =~ m/dog/im ) {
  say "$clone from foreign planet, or this isn't DNA";
} elsif ( $clone =~ m/aaa/im ) {
  say "$clone has my favourite codon in it";
} else {
  say "$clone contains that damned cat again";
}

$clone =~ s/cat/dog/gim;

if ( $clone =~ m/ATG/im ) {
  say "$clone contains Methionine";
} elsif ( $clone =~ m/dog/im ) {
  say "$clone from foreign planet, or this isn't DNA";
} elsif ( $clone =~ m/aaa/im ) {
  say "$clone has my favourite codon in it";
} else {
  say "$clone contains that damned cat again";
}

$clone =~ s/dog/aaa/gim;

if ( $clone =~ m/ATG/im ) {
  say "$clone contains Methionine";
} elsif ( $clone =~ m/dog/im ) {
  say "$clone from foreign planet, or this isn't DNA";
} elsif ( $clone =~ m/aaa/im ) {
  say "$clone has my favourite codon in it";
} else {
  say "$clone contains that damned cat again";
}

__END__

# will always short out at the first one it matches

$clone .= 'atg';

if ( $clone =~ m/ATG/im ) {
  say "$clone contains Methionine";
} elsif ( $clone =~ m/dog/im ) {
  say "$clone from foreign planet, or this isn't DNA";
} elsif ( $clone =~ m/aaa/im ) {
  say "$clone has my favourite codon in it";
} else {
  say "$clone contains that damned cat again";
}

# I can't tell it has my favourite codon, it shorted out after matching methionine
# As such, always check what you are trying to build (see testing later)
# Having multiple choices is expensive (especially if pattern matching), so always try
# to use put the most commonly expected match as high up the list as possible

# you can have as many elsif blocks as you like

