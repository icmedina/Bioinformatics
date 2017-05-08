#!/usr/bin/perl -w

use strict;

print "\nPaste the path and the filename:";
  my $filename = <STDIN>;
  (my $file, my $ext) = &parse_out_extension($filename); 
print "$file.$ext";

sub parse_out_extension {
    die("No filename to parse.\n") if ( ! @_ );
    
    my ($file)    = @_;
    my @pieces;

    map { push(@pieces,$_) } split(/\./,$file);

    my $ext  = pop(@pieces);
       $file =~ s/\.$ext//;
    
    return ($file,$ext) if $file;
}
