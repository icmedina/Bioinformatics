#!C:\perl\perl\bin

use strict;
use warnings;

my $file = "2A07.pdb";

  open PDB_IN, '<', $file or die "Can't read file: $!";
	my @file = <PDB_IN>;
  close PDB_IN;	 

my %compnds;
my @lastline;
my ($mol_id,$token,$val,$cur_val,$cur_token);
  foreach my $line (@file){
	if ($line=~m/^(COMPND)\s+(\d*)\s(MOL_ID:)\s(\d+);/){	# match the line containing molecule id
	  $mol_id = "$4";										# set the molecule id
	}
	elsif ($line=~m/^(COMPND)\s+(\d*)\s(.+):\s(.+);/){		# match a line containing the token name (separated by :) 
	  $token = lc("$3"); $val = "$4";  						# and the complete value (ending in ;)
	  $val =~ s/\s+$//;										# remove trailing spaces
	  $val =~s/(\w+)/\u\L$1/g;								# convert values to mixed case
	  $compnds{$mol_id}{ucfirst($token)} = $val;			# enter the token and values to mol_id hash
	}
	elsif ($line=~m/^(COMPND)\s+(\d*)\s(.+):\s(.+)/){		# a line containing the token name with incomplete value
	  $token = lc("$3"); $val = "$4";
	  $val =~s/(\w+)/\u\L$1/g; $val =~ s/\s+$//;			# note, the line is not yet printed at this point
	} 
	elsif ($line=~m/^(COMPND)\s+(\d*)\s(.+)/){				# a line without token name with continuation value
	  $cur_token = $token; 									# get the current token name from the last token
	  $cur_val = "$3";										# the current value is the continuation of the last val
	  $cur_val =~ s/\s+$//; $cur_val =~s/(\w+)/\u\L$1/g; 
	  $val .= $cur_val;										# concatenate the current value with the last value
	  $compnds{$mol_id}{ucfirst($cur_token)} =  $val;
	}
  }
  
  # output the contents of the mol_id hash
  foreach my $molecule_id (sort keys %compnds) {
    foreach my $tokens (keys %{ $compnds{$molecule_id} }) {
	  print "$molecule_id, $tokens: $compnds{$molecule_id}{$tokens}\n";
    }
  }