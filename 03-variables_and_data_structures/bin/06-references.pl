#!/software/perl -w

use Modern::Perl;

my $original_scalar = 'original';
my $copy_of_original_scalar = $original_scalar;

say $original_scalar . ' ' . \$original_scalar;
say $copy_of_original_scalar . ' ' . \$copy_of_original_scalar;

__END__

$copy_of_original_scalar = 'new';
say $copy_of_original_scalar . ' ' . \$copy_of_original_scalar;

__END__

my $reference_to_original_scalar = \$original_scalar;

say $reference_to_original_scalar . ' ' . \$original_scalar; # same reference to place in memory

__END__

say ${ $reference_to_original_scalar };

__END__

$original_scalar = 'another string';

say $original_scalar . ' ' . ${ $reference_to_original_scalar }; # we have changed the references ultimate value

__END__

${ $reference_to_original_scalar } = 'original again';

say $original_scalar . ' ' . ${ $reference_to_original_scalar }; # we have changed the original value

__END__

# not huge amount of benefit with just scalars (some exceptions), but we can take references of any data structure
 # war and peace - don't want double the memory used up

my @original_array = 1..200;
my @copy_of_original_array = @original_array;

say \@original_array;
say \@copy_of_original_array;

__END__

my $array_ref = \@original_array;

say $array_ref . ' ' . \@original_array; # same reference to place in memory

say $array_ref->[0];

__END__

splice @copy_of_original_array, 100,10;

say scalar @copy_of_original_array;
say scalar @original_array;
say scalar @{ $array_ref };

__END__

push @original_array, @original_array;
say scalar @copy_of_original_array;
say scalar @original_array;
say scalar @{ $array_ref };

__END__

pop @{ $array_ref };
say scalar @copy_of_original_array;
say scalar @original_array;
say scalar @{ $array_ref };

# we have only been changing the array that is stored in memory

__END__

my %original_hash = (
  band => 'Queen',
  'lead vocals' => 'Freddie Mercury',
  'lead guitar' => 'Brian May',
  'bass guitar' => 'John Deacon',
  'drums' => 'Roger Taylor',
);

my %copy_of_original_hash = %original_hash;
say \%original_hash;
say \%copy_of_original_hash;

my $hash_ref = \%original_hash;

say $hash_ref . ' ' . \%original_hash; # sam reference to place in memory

__END__

$copy_of_original_hash{band} = 'Queen + Paul Rodgers';
$copy_of_original_hash{'lead vocals'} = 'Paul Rodgers';
delete $copy_of_original_hash{'bass guitar'};

say %original_hash;
say %copy_of_original_hash;

delete $hash_ref->{'lead vocals'}; # RIP Freddie
say %original_hash;

# as with scalar and array, we have changed to original hash in memory

__END__

# instantiate an anonymous array (scalar with a reference to an unamed array) like this

my $anon_array_ref = [];
say $anon_array_ref;

# and instantiate an anonymous hash (scalar with a reference to an unamed hash) like this

my $anon_hash_ref = {};
say $anon_hash_ref;

# these will be important for 07