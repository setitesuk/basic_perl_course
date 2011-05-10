#!/software/perl -w

use Modern::Perl;

# we can use comparison operators to give us true/false decision making

# equals
if ( 10 == 10 ) {
  say 10 == 10;
}

if ( 'cat' eq 'cat' ) {
  say 'cat' eq 'cat';
}

__END__

# not equals


if ( 10 != 20 ) {
  say 10 != 20;
}

if ( 'cat' ne 'dog' ) {
  say 'cat' ne 'dog';
}

# you can continue for >< lt gt => <=