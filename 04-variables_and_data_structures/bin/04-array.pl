#!/software/perl -w

use Modern::Perl;

### Making an array

my @string_array = qw{hello i am an array of strings};

my @integer_array = 1..10;

my @comma_made_array = ( 'i', 'see', 'a', 'little', 'silhoutte', 'of', 'a', 'man,' );

my @x_generated_array = ( 'scaramouche,' ) x 2;

### Looking at the array, and obtaining elements

say 'The string_array, without any join: ' . @string_array;

say 'The integer_array, with a comma join: ' . join ',', @integer_array;

__END__

say 'The fourth number in the integer array is ' . $integer_array[3]; # why is the fourth one 3?

say 'The last word in the string array is ' . $string_array[-1];

__END__

my @slice = @string_array[1 .. 4];

say 'An array slice of the string array, indices 1->4: ' . join ' ', @slice;

__END__

### The number of elements

say 'The number of elements in string_array is : ' . scalar @string_array; # length is string length, scalar is array length
say 'The length of x_generated_array is : ' . length @x_generated_array; # extra points to those who can say why you get 1

__END__

### interpolation

say 'The first word in the string array is $string_array[0]';
say "The first word in the string array is $string_array[0]"; # again, double quotes interpolate the variable

__END__

### Doing stuff with arrays of data

say join ' ', @comma_made_array, @x_generated_array, 'will you do the fandango?'; # we can push arrays and/or scalars together and they act as one array

__END__

my @three_lines = ( ( join ' ', @comma_made_array ) , ( join ' ', @x_generated_array ), 'will you do the ballroom blitz?' );

say scalar @three_lines;

say join "\n", @three_lines;

__END__

### Iterating over arrays

foreach my $int ( @integer_array ) {
  say $string_array[$int];
}

foreach my $str ( @string_array ) {
  say $integer_array[$str]; # as $str is a string, not an integer, then is converted to 0, and so prints out first element each time
}

__END__

### empty array

my @assigned_into_array; # you don't need to explicitly do '= ()'
$assigned_into_array[2] = 10;
say scalar @assigned_into_array; # indices that are missing are autovivified
say @assigned_into_array;

__END__

# adding and removing elements

say scalar @comma_made_array;
push @comma_made_array, @x_generated_array; # push onto end of array
say scalar @comma_made_array;
say join ' ', @comma_made_array;

__END__

my $last_element = pop @comma_made_array; # pop off the end of array
say scalar @comma_made_array;
say join ' ', @comma_made_array;

__END__

my $first_element = shift @comma_made_array; # shift off the start of array (v. important later on)
say scalar @comma_made_array;
say join ' ', @comma_made_array;

__END__

unshift @comma_made_array, $last_element; # unshift onto start of the array
say scalar @comma_made_array;
say join ' ', @comma_made_array;

__END__

# shift and unshift will alter all the indices of existing elements

splice @comma_made_array, 3, 0, @x_generated_array; # insert elements into array (changes indices of following elements)
say scalar @comma_made_array;
say join ' ', @comma_made_array;

__END__

splice @comma_made_array, 6, 1, 'shadow'; # swap an element
say scalar @comma_made_array;
say join ' ', @comma_made_array;
splice @comma_made_array, 5, 1, 'very', 'big'; # swap an element for more than 1 element (changes indices of following elements)
say scalar @comma_made_array;
say join ' ', @comma_made_array;
splice @comma_made_array, 3, 2; # remove elements (changes indices of following elements)
say scalar @comma_made_array;
say join ' ', @comma_made_array;



