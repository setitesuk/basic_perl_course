#!/software/perl -w

use Modern::Perl;

### intro

my %personal_info = (
  forename => 'Andy',
  surname  => 'Brown',
  height   => '180',
  hair     => 'brown',
  eyes     => 'blue',
);

say $personal_info{forename};

__END__

### 2 methods of assignment

# unclear assignment, but shows can be constructed like an array
my %string_key_and_value_hash = qw{key1 val1 key2 val2 key3 val3};

say %string_key_and_value_hash; # why are they in random order
__END__
# clearer assignment
my %string_key_any_value_hash = (
  key1 => 'val1',
  key2 => 'valB',
  key3 => '3',
  key4 => undef,
);

# basically, the => is like a comma, and is commonly known as the 'fat comma'
# but it tells the perl interpreter that your key does not need to be quoted (unless it contains 'odd' chars)

# print all, but in ends up in random order
say %string_key_any_value_hash;

__END__

# print all in keys alphanumerical order
foreach my $key ( sort keys %string_key_any_value_hash ) {
  say $key . ' : ' . $string_key_any_value_hash{$key};
}

__END__

say 'The first value in the string_key_and_value_hash is $string_key_and_value_hash{key1}';
say "The first value in the string_key_and_value_hash is $string_key_and_value_hash{key1}"; # again, double quotes interpolate the variable

__END__

# keys can be numerical

my %keys_are_numbers = (
  1 => 'one', 2 => 'two', 3 => 'three', 
);

say $keys_are_numbers{2};

# no major benefits over array, except that you don't automatically have a result if you never created the key,
# and you don't have to start at zero, however, you will need to sort the keys as you read them


