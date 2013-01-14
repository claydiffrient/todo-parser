#!/usr/bin/perl

#Finds all instances of "//TODO:" in a file and lists them in the command line.
#Written by Clay Diffrient (clay.diffrient@gmail.com)

#Require at least one file for input.
$num_args = scalar (@ARGV);
if ($num_args < 1)
{
   print "\n Usage: todo.pl source_file\n";
   exit;
}

#Loop through performing for each file input.
foreach (@ARGV)
{
   parse_file($_);
}

#Trims beginning and ending whitespace
sub trim($)
{
   my $string = shift;
   $string =~ s/^\s+//;
   $string =~ s/\s+$//;
   return $string;
}

sub parse_file
{
   $file = $_[0];
   open (FILE, $file);
   while (<FILE>)
   {
      if ($_ =~ m/\/\/TODO:/)
      {
         print trim($_) . "\n";
      }
   }
}


