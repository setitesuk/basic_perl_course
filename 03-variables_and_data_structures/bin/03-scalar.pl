#!/software/perl -w

use Modern::Perl;

### Assignment

my $integer_scalar = 10;

my $string_scalar = 'I am a string';

say $integer_scalar;
say $string_scalar;

__END__

### What do I do with a scalar?

say $integer_scalar + $integer_scalar; # numeric addition

say $string_scalar . $integer_scalar; # string concatenation

say $string_scalar * $integer_scalar; # gives warning that string_scalar isn't numeric, converts to 0 and so answer 0

__END__

# what do you think the following would do
say $string_scalar x $integer_scalar; # x is a 'return this x times feature'

__END__

### Mix scalars and fixed values

say 'I can use a fixed string and concatenate to ' . $string_scalar;

say 30 / $integer_scalar;

__END__

### Interpolate scalars

say 'Hello, ' . $string_scalar;
say 'Hello, $string_scalar'; # single quotes won't interpolate the scalar
say 'Hello, ' . $string_scalar;
say "Hello, $string_scalar"; # double quotes will interpolate the scalar

__END__

### undef

my $undef_scalar;

say $undef_scalar;

__END__

$string_scalar = undef;

say $string_scalar if $string_scalar; # we have cleared $string scalar, so we won't print anything
