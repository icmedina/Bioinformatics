#!C:\perl\perl\bin -w

use strict;

print "\nPDB ID: ";
my $file = <STDIN>; chomp ($file);


# Extract sequence chains from PDB file
# Read in PDB file: Warning - some files are very large!
  open PDB_IN, '<', $file or die "Can't read file: $!";
	my @file = <PDB_IN>;
  close PDB_IN;

print "\nRECORD TYPE: ";
my $record = <STDIN>; chomp ($record);

# Parse the record types of the PDB file
my %recordtypes = parsePDBrecordtypes(@file);

# Extract the amino acid sequences of all chains in the protein
my @chains = extractSEQRES( $recordtypes{$record} );

# Translate the 3-character codes to 1-character codes, and print
  foreach my $chain (@chains) {
	print "\n**** chain **** \n\n";
	print "$chain\n";					# 3-letter codes
	print iub3to1($chain), "\n";		# 1-letter codes
  } exit;

###############
# Subroutines #
###############

# parsePDBrecordtypes
#
#--given an array of a PDB file, return a hash with
# keys = record type names
# values = scalar containing lines for that record type

sub parsePDBrecordtypes {
my @file = @_;
my %recordtypes = ( );

  foreach my $line (@file) {
  # Get the record type name which begins at the
  # start of the line and ends at the first space
  my($recordtype) = ($line =~ /^(\S+)/);
  # .= fails if a key is undefined, so we have to
  # test for definition and use either .= or = depending
	  if(defined $recordtypes{$recordtype} ) {
		$recordtypes{$recordtype} .= $line;
	  } else {
		$recordtypes{$recordtype} = $line;
	  }
  }
  return %recordtypes;
}

# extractSEQRES
#
#--given an scalar containing SEQRES lines,
# return an array containing the chains of the sequence
sub extractSEQRES {
my($seqres) = @_;
my $lastchain = '';
my $sequence = '';
my @results = ( );

# make array of lines
my @record = split ( /\n/, $seqres);
  foreach my $line (@record) {
	# Chain is in column 12, residues start in column 20
	my($thischain) = substr($line, 11, 1);
	my($residues) = substr($line, 19, 52); # add spac at end
		# Check if a new chain, or continuation of previous chain
		if("$lastchain" eq "") {
		$sequence = $residues;
		} elsif("$thischain" eq "$lastchain") {
		$sequence .= $residues;
		# Finish gathering previous chain (unless first record)
		} elsif ( $sequence ) {
		push(@results, $sequence);
		$sequence = $residues;
		} 
		$lastchain = $thischain;
  }
# save last chain
  push(@results, $sequence);
  return @results;
}

# iub3to1
#
#--change string of 3-character IUB amino acid codes (whitespace separated)
# into a string of 1-character amino acid codes
sub iub3to1 {
my($input) = @_;
  my %three2one = (
# amino acids  
	'ALA' => 'A',
	'VAL' => 'V',
	'LEU' => 'L',
	'ILE' => 'I',
	'PRO' => 'P',
	'TRP' => 'W',
	'PHE' => 'F',
	'MET' => 'M',
	'GLY' => 'G',
	'SER' => 'S',
	'THR' => 'T',
	'TYR' => 'Y',
	'CYS' => 'C',
	'ASN' => 'N',
	'GLN' => 'Q',
	'LYS' => 'K',
	'ARG' => 'R',
	'HIS' => 'H',
	'ASP' => 'D',
	'GLU' => 'E',
# nucleotides	
	'DA' => 'A',
	'DT' => 'T',
	'DG' => 'G',
	'DC' => 'C',
  );
# clean up the input
$input =~ s/\n/ /g;
my $seq = '';

# This use of split separates on any contiguous whitespace
my @code3 = split(' ', $input);
  foreach my $code (@code3) {
	# A little error checking
	if(not defined $three2one{$code}) {
	print "Code $code not defined\n";
	next;
	}
	$seq .= $three2one{$code};
  }
  return $seq;
}