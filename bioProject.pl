#!/user/bin/perl

# Get the file path from the user.
print "Please input the PDB file path below.\n";
print " >";
my $filePath;
$filePath = <STDIN>;
chop $filePath;
#$filePath = "PDBFile.pdb";
print "\n";

# Retrieve the lines of text from the file.
open(FILE,$filePath);
my @lines;
@lines = <FILE>;
close(FILE);

# Retrieve the SEQRES lines.
my @seqresLines;
foreach $line (@lines)
{
	if ($line =~ /^SEQRES/)
	{
		push(@seqresLines, $line);
	}
}
print "SEQRES Lines:\n";
foreach $temp0 (@seqresLines)
{
	print "$temp0\n";
}
print "\n";

# Wait for the user to press the [ENTER] key before continuing.
print "Press [ENTER] to continue.";
<STDIN>;
print "\n";

# Perform initial cleaning on the SEQRES lines.
my @cleanSEQRESLines;
my $tempSEQRESLine;
foreach $seqresLine (@seqresLines)
{
	if (substr($seqresLine, 0, 12) =~ /A/)
	{
		$tempSEQRESLine = substr($seqresLine, 19, 51);
		push(@cleanSEQRESLines, $tempSEQRESLine);
	}
}
print "Initially Cleaned SEQRES Lines:\n";
foreach $temp1 (@cleanSEQRESLines)
{
	print "$temp1\n";
}
print "\n";

# Wait for the user to press the [ENTER] key before continuing.
print "Press [ENTER] to continue.";
<STDIN>;
print "\n";

# Retrieve the proteins.
my @proteins;
my $tempProtein;
foreach $cleanSEQRESLine (@cleanSEQRESLines)
{
	for ($ctr = 0; $ctr < 48; $ctr = $ctr + 1)
	{
		$tempProtein = substr($cleanSEQRESLine, $ctr, 3);
		if ($tempProtein !~ /\s/)
		{
			push(@proteins, $tempProtein);
		}
	}
}
print "Amino Acids (Peptide Chain):\n";
foreach $temp2 (@proteins)
{
	print "$temp2 ";
}
print "\n\n";
print "Number of Amino Acids:\n";
print scalar @proteins;
print "\n\n";

# Wait for the user to press the [ENTER] key before continuing.
print "Press [ENTER] to continue.";
<STDIN>;
print "\n";

# Get the counts and percentages of each amino acid;
my $phe;
my $leu;
my $ile;
my $met;
my $val;
my $ser;
my $pro;
my $thr;
my $ala;
my $tyr;
my $his;
my $asn;
my $lys;
my $asp;
my $glu;
my $cys;
my $trp;
my $arg;
my $gly;
$phe = 0;
$leu = 0;
$ile = 0;
$met = 0;
$val = 0;
$ser = 0;
$pro = 0;
$thr = 0;
$ala = 0;
$tyr = 0;
$his = 0;
$asn = 0;
$lys = 0;
$asp = 0;
$glu = 0;
$cys = 0;
$trp = 0;
$arg = 0;
$gly = 0;
foreach $protein1 (@proteins)
{
	if ($protein1 =~ /PHE/)
	{
		$phe = $phe + 1;
	}
	elsif ($protein1 =~ /^LEU/)
	{
		$leu = $leu + 1;
	}
	elsif ($protein1 =~ /^ILE/)
	{
		$ile = $ile + 1;
	}
	elsif ($protein1 =~ /^MET/)
	{
		$met = $met + 1;
	}
	elsif ($protein1 =~ /^VAL/)
	{
		$val = $val + 1;
	}
	elsif ($protein1 =~ /^SER/)
	{
		$ser = $ser + 1;
	}
	elsif ($protein1 =~ /^PRO/)
	{
		$pro = $pro + 1;
	}
	elsif ($protein1 =~ /^THR/)
	{
		$thr = $thr + 1;
	}
	elsif ($protein1 =~ /^ALA/)
	{
		$ala = $ala + 1;
	}
	elsif ($protein1 =~ /^TYR/)
	{
		$tyr = $tyr + 1;
	}
	elsif ($protein1 =~ /^HIS/)
	{
		$his = $his + 1;
	}
	elsif ($protein1 =~ /^GLN/)
	{
		$gln = $gln + 1;
	}
	elsif ($protein1 =~ /^ASN/)
	{
		$asn = $asn + 1;
	}
	elsif ($protein1 =~ /^LYS/)
	{
		$lys = $lys + 1;
	}
	elsif ($protein1 =~ /^ASP/)
	{
		$asp = $asp + 1;
	}
	elsif ($protein1 =~ /^GLU/)
	{
		$glu = $glu + 1;
	}
	elsif ($protein1 =~ /^CYS/)
	{
		$cys = $cys + 1;
	}
	elsif ($protein1 =~ /^TRP/)
	{
		$trp = $trp + 1;
	}
	elsif ($protein1 =~ /^ARG/)
	{
		$arg = $arg + 1;
	}
	elsif ($protein1 =~ /^GLY/)
	{
		$gly = $gly + 1;
	}
}
my $aminoAcidCount;
$aminoAcidCount = @proteins;
print "Amino Acid Counts (Percentages):\n";
print "PHE: $phe (" . (($phe / $aminoAcidCount) * 100) . "\%)\n";
print "LEU: $leu (" . (($leu / $aminoAcidCount) * 100) . "\%)\n";
print "ILE: $ile (" . (($ile / $aminoAcidCount) * 100) . "\%)\n";
print "MET: $met (" . (($met / $aminoAcidCount) * 100) . "\%)\n";
print "VAL: $val (" . (($val / $aminoAcidCount) * 100) . "\%)\n";
print "SER: $ser (" . (($ser / $aminoAcidCount) * 100) . "\%)\n";
print "PRO: $pro (" . (($pro / $aminoAcidCount) * 100) . "\%)\n";
print "THR: $thr (" . (($thr / $aminoAcidCount) * 100) . "\%)\n";
print "ALA: $ala (" . (($ala / $aminoAcidCount) * 100) . "\%)\n";
print "TYR: $tyr (" . (($tyr / $aminoAcidCount) * 100) . "\%)\n";
print "HIS: $his (" . (($his / $aminoAcidCount) * 100) . "\%)\n";
print "GLN: $gln (" . (($gln / $aminoAcidCount) * 100) . "\%)\n";
print "ASN: $asn (" . (($asn / $aminoAcidCount) * 100) . "\%)\n";
print "LYS: $lys (" . (($lys / $aminoAcidCount) * 100) . "\%)\n";
print "ASP: $asp (" . (($asp / $aminoAcidCount) * 100) . "\%)\n";
print "GLU: $glu (" . (($glu / $aminoAcidCount) * 100) . "\%)\n";
print "CYS: $cys (" . (($cys / $aminoAcidCount) * 100) . "\%)\n";
print "TRP: $trp (" . (($trp / $aminoAcidCount) * 100) . "\%)\n";
print "ARG: $arg (" . (($arg / $aminoAcidCount) * 100) . "\%)\n";
print "GLY: $gly (" . (($gly / $aminoAcidCount) * 100) . "\%)\n\n";

# Wait for the user to press the [ENTER] key before continuing.
print "Press [ENTER] to continue.";
<STDIN>;
print "\n";

# Determine the possible mRNA sequences responsible for the protein sequence.
my $mRNAString;
my $PossibleCOmbinationCount;
$mRNAString = "";
$count = 1;
foreach $protein (@proteins)
{
	if ($protein =~ /PHE/)
	{
		$mRNAString = $mRNAString . "(UUU|UUC)";
		$count = $count * 2;
	}
	elsif ($protein =~ /^LEU/)
	{
		$mRNAString = $mRNAString . "(UUA|UUG|CUU|CUC|CUA|CUG)";
		$count = $count * 6;
	}
	elsif ($protein =~ /^ILE/)
	{
		$mRNAString = $mRNAString . "(AUU|AUC|AUA)";
		$count = $count * 3;
	}
	elsif ($protein =~ /^MET/)
	{
		$mRNAString = $mRNAString . "AUG";
	}
	elsif ($protein =~ /^VAL/)
	{
		$mRNAString = $mRNAString . "(GUU|GUC|GUA|GUG)";
		$count = $count * 4;
	}
	elsif ($protein =~ /^SER/)
	{
		$mRNAString = $mRNAString . "(UCU|UCC|UCA|UCG|AGU|AGC)";
		$count = $count * 6;
	}
	elsif ($protein =~ /^PRO/)
	{
		$mRNAString = $mRNAString . "(CCU|CCC|CCA|CCG)";
		$count = $count * 4;
	}
	elsif ($protein =~ /^THR/)
	{
		$mRNAString = $mRNAString . "(ACU|ACC|ACA|ACG)";
		$count = $count * 4;
	}
	elsif ($protein =~ /^ALA/)
	{
		$mRNAString = $mRNAString . "(GCU|GCC|GCA|GCG)";
		$count = $count * 4;
	}
	elsif ($protein =~ /^TYR/)
	{
		$mRNAString = $mRNAString . "(UAU|UAC)";
		$count = $count * 2;
	}
	elsif ($protein =~ /^HIS/)
	{
		$mRNAString = $mRNAString . "(CAU|CAC)";
		$count = $count * 2;
	}
	elsif ($protein =~ /^GLN/)
	{
		$mRNAString = $mRNAString . "(CAA|CAG)";
		$count = $count * 2;
	}
	elsif ($protein =~ /^ASN/)
	{
		$mRNAString = $mRNAString . "(AAU|AAC)";
		$count = $count * 2;
	}
	elsif ($protein =~ /^LYS/)
	{
		$mRNAString = $mRNAString . "(AAA|AAG)";
		$count = $count * 2;
	}
	elsif ($protein =~ /^ASP/)
	{
		$mRNAString = $mRNAString . "(GAU|GAC)";
		$count = $count * 2;
	}
	elsif ($protein =~ /^GLU/)
	{
		$mRNAString = $mRNAString . "(GAA|GAG)";
		$count = $count * 2;
	}
	elsif ($protein =~ /^CYS/)
	{
		$mRNAString = $mRNAString . "(UGU|UGC)";
		$count = $count * 2;
	}
	elsif ($protein =~ /^TRP/)
	{
		$mRNAString = $mRNAString . "UGG";
	}
	elsif ($protein =~ /^ARG/)
	{
		$mRNAString = $mRNAString . "(CGU|CGC|CGA|CGG|AGA|AGG)";
		$count = $count * 6;
	}
	elsif ($protein =~ /^GLY/)
	{
		$mRNAString = $mRNAString . "(GGU|GGC|GGA|GGG)";
		$count = $count * 4;
	}
	else
	{
		print "\n\n$protein\n\n";
	}
	$mRNAString = $mRNAString . "\n";
}
chomp $mRNAString;
print "Possible mRNA Sequences:\n";
print $mRNAString;
print "\n\n";
print "Possible Combination Count:\n";
print $count;
print "\n\n";

# Wait for the user to press the [ENTER] key before continuing.
print "Press [ENTER] to continue.";
<STDIN>;
print "\n";

# Determine the possible DNA template strands responsible for the protein sequence.
my $DNATemplateStrandString;
$DNATemplateStrandString = $mRNAString;
$DNATemplateStrandString =~ s/U/1/g;
$DNATemplateStrandString =~ s/C/2/g;
$DNATemplateStrandString =~ s/A/3/g;
$DNATemplateStrandString =~ s/G/4/g;
$DNATemplateStrandString =~ s/1/A/g;
$DNATemplateStrandString =~ s/2/G/g;
$DNATemplateStrandString =~ s/3/T/g;
$DNATemplateStrandString =~ s/4/C/g;
print "Possible DNA Template Strands:\n";
print $DNATemplateStrandString;
print "\n\n";

# Wait for the user to press the [ENTER] key before continuing.
print "Press [ENTER] to continue.";
<STDIN>;
print "\n";

# Determine the possible DNA coding strands.
my $DNACodingStrandString;
$DNACodingStrandString = $mRNAString;
$DNACodingStrandString =~ s/U/T/g;
print "Possible DNA Coding Strands:\n";
print $DNACodingStrandString;
print "\n\n";


# Wait for the user to press the [ENTER] key before exiting.
print "Press [ENTER] to exit.";
<STDIN>;