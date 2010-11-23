#!/usr/bin/perl
# A script to combine some files or files in a directory together in a path
use strict;
use warnings;
use feature ':5.10'; # Minumum we need is Perl 5.10
use Cwd 'abs_path';
use File::Find;
use Getopt::Long;

sub main {
    my $regex;
    GetOptions('regex=s' => \$regex);

    say join ":", map { process($_, $regex) } @ARGV;

    return 0;
}

sub process {
    my ($name, $regex) = @_;

    if ( -d $name ) {
        return process_dir($name, $regex);
    } elsif ( -f $name ) {
        return process_file($name, $regex);
    }
}

sub process_dir {
    my ($dir, $regex) = @_;
    $dir = abs_path($dir);
    my @files = ();
    find(sub {
            my $name = $File::Find::name;
            if ( $name ne $dir and (!$regex || $name =~ $regex) ) {
                push @files, $name;
            }
        }, ($dir));

    return join ":", map { abs_path($_) } @files;
}

sub process_file {
    my ($file) = @_;
    return abs_path($_);
}

main();

# vim: sts=4 sw=4 ts=4 et ft=perl
