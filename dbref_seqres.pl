#!C:\perl\perl\bin

use strict;
use warnings;

my $file = "2A07.pdb";

  open PDB_IN, '<', $file or die "Can't read file: $!";
	my @file = <PDB_IN>;
  close PDB_IN;	 
my (@chains, @db ,@dbAccsn, @dbIdCode);
  foreach my $line (@file){
# if ($db eq "GB")  $web = "http://www.ncbi.nlm.nih.gov/nuccore/$dbAccsn" or "http://www.ncbi.nlm.nih.gov/nuccore/$dbIdCode" 
# if ($db eq "UNP") $web = "http://www.uniprot.org/uniprot/$dbAccsn"
#                       idCode  chainID seqBegin               
  if ($line=~m/^(DBREF)\s+(\w+)\s(.)\s+(\d+)\s+()/){
  
	my $chain =  substr($line,12,1); rtrim($chain);				# get chain  identifier
	my $db =  substr($line,26,6); rtrim($db);					# get sequence database name
	my $dbAccsn =  substr($line,33,8); rtrim($dbAccsn);			# get sequence database accession code
	my $dbIdCode  =  substr($line,42,11); rtrim($dbIdCode);		# get sequence database identification code
	print 	"$chain\t$db\t$dbAccsn\t$dbIdCode\n";
	
	}
  }
  
sub rtrim { my $val = $_[0];
  $val =~ s/\s+$//;												# remove trailing spaces
  return ($val);  
}