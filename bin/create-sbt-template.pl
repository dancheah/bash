#!/usr/bin/env perl
use strict;
use warnings;
use v5.12.0;
use File::Path qw(mkpath rmtree);
use Getopt::Long;
use autodie;

my $plugin_dir = "project/plugins";
my $plugin_file = "project/plugins/Plugins.scala";
my $project_dir = "project/build";
my $project_file = "project/build/Project.scala";

# todo: make a scala script version
# todo: create a version for eclipse

sub main {
    my $clean;
    GetOptions("clean" => \$clean);

    if ($clean) {
        clean_sbt_files();
    } else {
        setup_sbt();
    }

    return 0;
}

sub clean_sbt_files {
    say "Cleaned $project_dir";
    rmtree($project_dir);
    say "Cleaned $plugin_dir";
    rmtree($plugin_dir);
}

sub setup_sbt {
    if ( -f $plugin_file ) {
        say "$plugin_file exist already. Skipping";
    } else {
        mkpath($plugin_dir);
        open my $fh, ">", $plugin_file;
        print $fh create_plugin_file();
        close $fh;
        say "Created $plugin_file";
    }

    if ( -f $project_file ) {
        say "Project.scala exist already. Skipping";
    } else {
        mkpath($project_dir);
        open my $fh, ">", $project_file;
        print $fh create_project_file();
        close $fh;
        say "Created $project_file";
    }
}

sub create_plugin_file {
    my $template = <<TEMPLATE
import sbt._
class Plugins(info: ProjectInfo) extends PluginDefinition(info) {
  // SBT Intellij plugin - works great with the Intellij SBT plugin
  // See for more information: https://github.com/mpeltonen/sbt-idea
  val sbtIdeaRepo = "sbt-idea-repo" at "http://mpeltonen.github.com/maven/"
  val sbtIdea = "com.github.mpeltonen" % "sbt-idea-plugin" % "0.4.0"

  // Akka plugin
  val akkaRepo   = "Akka Repo" at "http://akka.io/repository"
  val akkaPlugin = "se.scalablesolutions.akka" % "akka-sbt-plugin" % "1.1.3"
}
TEMPLATE
}

sub create_project_file {
    my $template = <<TEMPLATE
import sbt._
class MyProject(info: ProjectInfo) extends DefaultProject(info) with IdeaProject with AkkaProject {
  // Akka
  // http://www.davidgreco.it/MySite/Blog/Entries/2011/1/6_I_started_to_climb_the_Akka_mountain.html 
  val akkaRepo = "Akka Maven Repository" at "http://akka.io/repository"
  val akkaHttp = akkaModule("http")

  // Jetty
  val jetty7Server = "org.eclipse.jetty" % "jetty-server" % "7.0.1.v20091125" % "test"
  val jetty7WebApp = "org.eclipse.jetty" % "jetty-webapp" % "7.0.1.v20091125" % "test"

  // Various project dependencies
  val scalatest = "org.scalatest" % "scalatest_2.9.0" % "1.6.1"
  val junit = "junit" % "junit" % "4.8"
  val scalacheck = "org.scala-tools.testing" % "scalacheck_2.9.0" % "1.9" 
}
TEMPLATE
}

main();

# vim: sts=4 sw=4 ts=4 et ft=perl
