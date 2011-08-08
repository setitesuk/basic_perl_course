use Test::More tests => 1;

my $script_output = qx{bin/hello_world.pl}; # wrapping a command in qx{} tells perl to go out to the shell and run that script, returning any STDOUT

is( $script_output, "Hello World\n", 'hello_world.pl returns Hello World' );
