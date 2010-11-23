#!/usr/bin/perl
# A script to combine some files or files in a directory together in a path
use strict;
use warnings;
use feature ':5.10';
use Cwd 'abs_path';
use Getopt::Long;

# TODO: export statements that get emitted should be wrapped in an if
# statement. This way use won't add it to the path if it is there
# already. Alternatively use unset
sub main {
    # Help bring something into a PATH
    # Sample usage:
    # use.pl --home-var RUBY_HOME --home-dir ~/foo

    my $home_var;
    my $home_dir;

    GetOptions('home-var=s' => \$home_var,
        'home-dir=s' => \$home_dir);

    my $abs_home_dir = abs_path($home_dir) // "NOTFOUND";
    if ( -d $abs_home_dir ) {
        say "export $home_var=$abs_home_dir";
    }

    my $bin_dir = "$abs_home_dir/bin" // "NOTFOUND";
    if ( -d $bin_dir ) {
        say 'export PATH='.$bin_dir.':'.$ENV{PATH};
    }

    return 0;
}

main();

# vim: sts=4 sw=4 ts=4 et ft=perl
