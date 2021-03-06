package _ONE;

sub getEnzymeList{
	my @RE = ("GACGTC", 	#'AatII'   => 'GACGTC 5',
		"GTMKAC",	#'AccI'    => 'GTMKAC 2',
		"AACGTT",	#'AclI'	     => 'AACGTT 2',
		"GRCGYC", 	#'AcyI'    => 'GRCGYC 2',
		"CTTAAG",	#'AflII'   => 'CTTAAG 1',
		"ACRYGT",	#'AflIII'  => 'ACRYGT 1',
		"ACCGGT ",  	#'AgeI'    => 'ACCGGT 1',
		"TTTAAA ",  	#'AhaIII'  => 'TTTAAA 3',
		"GACNNNNNGTC", 	#'AhdI'    => 'GACNNNNNGTC 6',
		"AGCT",		#'AluI'    => 'AGCT 2',
		"CAGNNNCTG",	#'AlwNI'   => 'CAGNNNCTG 6',
		"GCANNNNNTGC",	#'ApaBI'   => 'GCANNNNNTGC 8',
		"GGGCCC",	#'ApaI'    => 'GGGCCC 5',
		"GTGCAC",	#'ApaLI'   => 'GTGCAC 1',
		"RAATTY",	#'ApoI'    => 'RAATTY 1',
		"GGCGCGCC",	#'AscI'    => 'GGCGCGCC 2'
		"GGNCC",	#'AsuI'    => 'GGNCC 1',
		"TTCGAA",	#'AsuII'   => 'TTCGAA 2',
		"CYCGRG",	#'AvaI'    => 'CYCGRG 1',
		"GGWCC",	#'AvaII'   => 'GGWCC 1',
		"CCTAGG",	#'AvrII'   => 'CCTAGG 1',
		"TGGCCA", 	#'BalI'    => 'TGGCCA 3',
		"GGATCC",	# 'BamHI'   => 'GGATCC 1',
		"TGATCA",	# 'BclI'    => 'TGATCA 1',
		"WCCGGW",	#'BetI'    => 'WCCGGW 1',
		"GCCNNNNNGGC",	#'BglI'    => 'GCCNNNNNGGC 7',
		"AGATCT",	#'BglII'   => 'AGATCT 1',
		"YACGTR",	#'BsaAI'   => 'YACGTR 3',
		"GATNNNNATC",	#'BsaBI'   => 'GATNNNNATC 5',
		"GCGCGC",	#'BsePI'   => 'GCGCGC 1',
		"CCNNNNNNNGG",	#'BsiYI'   => 'CCNNNNNNNGG 7',
		"TGTACA",	#'Bsp1407I'=> 'TGTACA 1',
		"TCATGA",	#'BspHI'   => 'TCATGA 1',
		"ACATGT",	#'BspLU11I'=> 'ACATGT 1',
		"TCCGGA",	# 'BspMII'  => 'TCCGGA 1',
		"GGTNACC",	#'BstEII'  => 'GGTNACC 1',
		"CCANNNNNNTGG",	#'BstXI'   => 'CCANNNNNNTGG 8',
		"GCNNGC",	# 'Cac8I'   => 'GCNNGC 3',
		"CCSGG",	#'CauII'   => 'CCSGG 2',
		"RCCGGY",	#'Cfr10I'  => 'RCCGGY 1',
		"YGGCCR",	# 'CfrI'    => 'YGGCCR 1',
		"ATCGAT",	# 'ClaI'    => 'ATCGAT 2',
		"RGCY",	#'CviJI'   => 'RGCY 2',
		"TGCA",	#  'CviRI'   => 'TGCA 2',
		"CTNAG",	# 'DdeI'    => 'CTNAG 1',
		"GATC",	#'DpnI'    => 'GATC 2',
		"TTTAAA",	# 'DraI'    => 'TTTAAA 3',
		"RGGNCCY",	#  'DraII'   => 'RGGNCCY 2',
		"CACNNNGTG",# 'DraIII'  => 'CACNNNGTG 6',
		"GACNNNNNNGTC",#'DrdI'    => 'GACNNNNNNGTC 7',
		"CCRYGG",	#'DsaI'    => 'CCRYGG 1',
		"GACNNNNNGTC",#      'Eam1105I'=> 'GACNNNNNGTC 6',
		"AGCGCT",	# 'Eco47III'=> 'AGCGCT 3',
		"CCTNNNNNAGG",#'EcoNI'   => 'CCTNNNNNAGG 5',
		"GAATTC",	# 'EcoRI'   => 'GAATTC 1',
		"CCWGG",	# 'EcoRII'  => 'CCWGG 0',
		"GATATC",	#'EcoRV'   => 'GATATC 3',
		"GCTNAGC",	# 'EspI'    => 'GCTNAGC 2',
		"GCNGC",	#'Fnu4HI'  => 'GCNGC 2',
		"CGCG",	# 'FnuDII'  => 'CGCG 2',
		"GGCCGGCC",	#'FseI'    => 'GGCCGGCC 6',
		"WGGCCW",	#'HaeI'    => 'WGGCCW 3',
		"RGCGCY",	#'HaeII'   => 'RGCGCY 5',
		"GGCC",	#'HaeIII'  => 'GGCC 2',
		"GWGCWC",	# 'HgiAI'   => 'GWGCWC 5',
		"GGYRCC",	#'HgiCI'   => 'GGYRCC 1',
		"GRGCYC",	#'HgiJII'  => 'GRGCYC 5',
		"GCGC",	#'HhaI'    => 'GCGC 3',
		"GTYRAC",	#'HincII'  => 'GTYRAC 3',
		"GTYRAC",	# 'HindII'  => 'GTYRAC 3',
		"AAGCTT",	# 'HindIII' => 'AAGCTT 1',
		"GANTC",	#'HinfI'   => 'GANTC 1',
		"GTTAAC",	#'HpaI'    => 'GTTAAC 3',
		"CCGG",	#'HpaII'   => 'CCGG 1',
		"GGTACC",	#'KpnI'    => 'GGTACC 5',
		"CTAG",	#'MaeI'    => 'CTAG 1',
		"ACGT",	# 'MaeII'   => 'ACGT 1',
		"GTNAC",	#'MaeIII'  => 'GTNAC 0',
		"GATC",	#'MboI'    => 'GATC 0',
		"CGRYCG",	#'McrI'    => 'CGRYCG 4',
		"CAATTG",	# 'MfeI'    => 'CAATTG 1',
		"ACGCGT",	#'MluI'    => 'ACGCGT 1',
		"TTAA",	#'MseI'    => 'TTAA 1',
		"CAYNNNNRTG",#'MslI'    => 'CAYNNNNRTG 5',
		"TGCGCA",	#'MstI'    => 'TGCGCA 3',
		"GCNNNNNNNGC",#'MwoI'    => 'GCNNNNNNNGC 7',
		"GCCGGC",	# 'NaeI'    => 'GCCGGC 3',
		"GGCGCC",	#  'NarI'    => 'GGCGCC 2',
		"CCATGG",	#'NcoI'    => 'CCATGG 1',
		"CATATG",	# 'NdeI'    => 'CATATG 2',
		"GCTAGC",	#'NheI'    => 'GCTAGC 1',
		"CATG",	#'NlaIII'  => 'CATG 4',
		"GGNNCC",	#'NlaIV'   => 'GGNNCC 3',
		"GCGGCCGC",	#'NotI'    => 'GCGGCCGC 2',
		"TCGCGA",	# 'NruI'    => 'TCGCGA 3',
		"CMGCKG",	# 'NspBII'  => 'CMGCKG 3',
		"RCATGY",	#'NspI'    => 'RCATGY 5',
		"TTAATTAA",	#'PacI'    => 'TTAATTAA 5',
		"CCANNNNNTGG",#'PflMI'   => 'CCANNNNNTGG 7',
		"CACGTG",	#'PmaCI'   => 'CACGTG 3',
		"GTTTAAAC",	#'PmeI'    => 'GTTTAAAC 4',
		"RGGWCCY",	#'PpuMI'   => 'RGGWCCY 2',
		"GACNNNNGTC",#'PshAI'   => 'GACNNNNGTC 5',
		"CTGCAG",	#'PstI'    => 'CTGCAG 5',
		"CGATCG",	# 'PvuI'    => 'CGATCG 4',
		"CAGCTG",	#'PvuII'   => 'CAGCTG 3',
		"GTAC",	# 'RsaI'    => 'GTAC 2',
		"CGGWCCG",	# 'RsrII'   => 'CGGWCCG 2',
		"GAGCTC",	#'SacI'    => 'GAGCTC 5',
		"CCGCGG",	#'SacII'   => 'CCGCGG 4',
		"GGNCC",	#'Sau96I'  => 'GGNCC 1',
		"GTCGAC",	#'SalI'    => 'GTCGAC 1',
		"GGGWCCC",	#'SanDI'   => 'GGGWCCC 2',
		"CCTNAGG",	#'SauI'    => 'CCTNAGG 2',
		"CCTGCAGG",	#'SbfI'    => 'CCTGCAGG 6',
		"AGTACT",	# 'ScaI'    => 'AGTACT 3',
		"CCNGG",	# 'ScrFI'   => 'CCNGG 2',
		"GDGCHC",	#  'SduI'    => 'GDGCHC 5',
		"CCNNGG",	# 'SecI'    => 'CCNNGG 1',
		"ACCWGGT",	# 'SexAI'   => 'ACCWGGT 1',
		"CTRYAG",	#'SfeI'    => 'CTRYAG 1',
		"GGCCNNNNNGGCC",# 'SfiI'    => 'GGCCNNNNNGGCC 8',
		"GCGATCGC",	#'SgfI'    => 'GCGATCGC 5',
		"CRCCGGYG",	#'SgrAI'   => 'CRCCGGYG 2',
		"CCCGGG",	#'SmaI'    => 'CCCGGG 3',
		"CTYRAG",	# 'SmlI'    => 'CTYRAG 1',
		"TACGTA",	# 'SnaBI'   => 'TACGTA 3',
		"ACTAGT",	#  'SpeI'    => 'ACTAGT 1',
		"GCATGC",	#'SphI'    => 'GCATGC 5',
		"CGTACG",	#  'SplI'    => 'CGTACG 1',
		"GCCCGGGC",	#'SrfI'    => 'GCCCGGGC 4',
		"CCTGCAGG",	#'Sse8387I'=> 'CCTGCAGG 6',
		"AGGWCCT",	#'Sse8647I'=> 'AGGWCCT 2',
		"AATATT",	#'SspI'    => 'AATATT 3',
		"AGGCCT",	# 'StuI'    => 'AGGCCT 3',
		"CCWWGG",	#'StyI'    => 'CCWWGG 1',
		"ATTTAAAT",	# 'SwaI'    => 'ATTTAAAT 4',
		"TCGA",	#'TaqI'    => 'TCGA 1',
		"WGTACW",	#'TatI'    => 'WGTACW 1',
		"GAWTC",	#'TfiI'    => 'GAWTC 1',
		"GCWGC",	#  'TseI'    => 'GCWGC 1',
		"GTSAC",	# 'Tsp45I'  => 'GTSAC 0',
		"ACNGT",	# 'Tsp4CI'  => 'ACNGT 3',
		"AATT",	#'TspEI'   => 'AATT 0',
		"CASTGNN",	#'TspRI'   => 'CASTGNN 7',
		"GACNNNGTC",#'Tth111I' => 'GACNNNGTC 4',
		"ATTAAT",	#'VspI'    => 'ATTAAT 2',
		"TCTAGA",	# 'XbaI'    => 'TCTAGA 1',
		"CCANNNNNNNNNTGG",#'XcmI'    => 'CCANNNNNNNNNTGG 8',
		"CTCGAG",	# 'XhoI'    => 'CTCGAG 1',
		"RGATCY",	#'XhoII'   => 'RGATCY 1',
		"CGGCCG",	#'XmaIII'  => 'CGGCCG 1',
		"GAANNNNTTC",#'XmnI'    => 'GAANNNNTTC 5'

	);
	return @RE;     
}

sub getEnzymeName{
	my $Ename;
	
	my %REName = ("GACGTC " => "AatII",
		"GTMKAC" => "AccI",
		"AACGTT" => "AclI",
		"GRCGYC" => "AcyI",
		"CTTAAG" => "AflII",
		"ACRYGT" => "AflIII",
		"ACCGGT" => "AgeI",
		"TTTAAA" => "AhaIII",
		"GACNNNNNGTC" => "AhdI",
		"AGCT" => "AluI",
		"CAGNNNCTG" => "AlwNI",
		"GCANNNNNTGC" => "ApaBI",
		"GGGCCC" => "ApaI",
		"GTGCAC" => "ApaLI",
		"RAATTY" => "ApoI",
		"GGCGCGCC" => "AscI",
		"GGNCC" => "AsuI",
		"TTCGAA" => "AsuII",
		"CYCGRG" => "AvaI",
		"GGWCC" => "AvaII",
		"CCTAGG" => "AvrII",
		"TGGCCA" => "BalI",
		"GGATCC" => "BamHI",
		"TGATCA" => "BclI",
		"WCCGGW" => "BetI",
		"GCCNNNNNGGC" => "BglI",
		"AGATCT" => "BglII",
		"YACGTR" => "BsaAI",
		"GATNNNNATC" => "BsaBI",
		"GCGCGC" => "BsePI",
		"CCNNNNNNNGG" => "BsiYI",
		"TGTACA" => "Bsp1407I",
		"TCATGA" => "BspHI",
		"ACATGT" => "BspLU11I",
		"TCCGGA" => "BspMII",
		"GGTNACC" => "BstEII",
		"CCANNNNNNTGG" => "BstXI",
		"GCNNGC" => "Cac8I",
		"CCSGG" => "CauII",
		"RCCGGY" => "Cfr10I",
		"YGGCCR" => "CfrI",
		"ATCGAT" => "ClaI",
		"RGCY" => "CviJI",
		"TGCA" => "CviRI",
		"CTNAG" => "DdeI",
		"GATC" => "DpnI",
		"TTTAAA" => "DraI",
		"RGGNCCY" => "DraII",
		"CACNNNGTG" => "DraIII",
		"GACNNNNNNGTC" => "DrdI",
		"CCRYGG" => "DsaI",
		"GACNNNNNGTC" => "Eam1105I",
		"AGCGCT" => "Eco47III",
		"CCTNNNNNAGG" => "EcoNI",
		"GAATTC" => "EcoRI",
		"CCWGG" => "EcoRII",
		"GATATC" => "EcoRV",
		"GCTNAGC" => "EspI",
		"GCNGC" => "Fnu4HI",
		"CGCG" => "FnuDII",
		"GGCCGGCC" => "FseI",
		"WGGCCW" => "HaeI",
		"RGCGCY" => "HaeII",
		"GGCC" => "HaeIII",
		"GWGCWC" => "HgiAI",
		"GGYRCC" => "HgiCI",
		"GRGCYC" => "HgiJII",
		"GCGC" => "HhaI",
		"GTYRAC" => "HincII",
		"GTYRAC" => "HindII",
		"AAGCTT" => "HindIII",
		"GANTC" => "HinfI",
		"GTTAAC" => "HpaI",
		"CCGG" => "HpaII",
		"GGTACC" => "KpnI",
		"CTAG" => "MaeI",
		"ACGT" => "MaeII",
		"GTNAC" => "MaeIII",
		"GATC" => "MboI",
		"CGRYCG" => "McrI",
		"CAATTG" => "MfeI",
		"ACGCGT" => "MluI",
		"TTAA" => "MseI",
		"CAYNNNNRTG" => "MslI",
		"TGCGCA" => "MstI",
		"GCNNNNNNNGC" => "MwoI",
		"GCCGGC" => "NaeI",
		"GGCGCC" => "NarI",
		"CCATGG" => "NcoI",
		"CATATG" => "NdeI",
		"GCTAGC" => "NheI",
		"CATG" => "NlaIII",
		"GGNNCC" => "NlaIV",
		"GCGGCCGC" => "NotI",
		"TCGCGA" => "NruI",
		"CMGCKG" => "NspBII",
		"RCATGY" => "NspI",
		"TTAATTAA" => "PacI",
		"CCANNNNNTGG" => "PflMI",
		"CACGTG" => "PmaCI",
		"GTTTAAAC" => "PmeI",
		"RGGWCCY" => "PpuMI",
		"GACNNNNGTC" => "PshAI",
		"CTGCAG" => "PstI",
		"CGATCG" => "PvuI",
		"CAGCTG" => "PvuII",
		"GTAC" => "RsaI",
		"CGGWCCG" => "RsrII",
		"GAGCTC" => "SacI",
		"CCGCGG" => "SacII",
		"GGNCC" => "Sau96I",	
		"GTCGAC" => "SalI",
		"GGGWCCC" => "SanDI",
		"CCTNAGG" => "SauI",
		"CCTGCAGG" => "SbfI",
		"AGTACT" => "ScaI",
		"CCNGG" => "ScrFI",
		"GDGCHC" => "SduI",
		"CCNNGG" => "SecI",
		"ACCWGGT" => "SexAI",
		"CTRYAG" => "SfeI",
		"GGCCNNNNNGGCC" => "SfiI",
		"GCGATCGC" => "SgfI",
		"CRCCGGYG" => "SgrAI",
		"CCCGGG" => "SmaI",
		"CTYRAG" => "SmlI",
		"TACGTA" => "SnaBI",
		"ACTAGT" => "SpeI",	
		"GCATGC" => "SphI",
		"CGTACG" => "SplI",
		"GCCCGGGC" => "SrfI",
		"CCTGCAGG" => "Sse8387I",
		"AGGWCCT" => "Sse8647I",
		"AATATT" => "SspI",
		"AGGCCT" => "StuI",
		"CCWWGG" => "StyI",
		"ATTTAAAT" => "SwaI",
		"TCGA" => "TaqI",
		"WGTACW" => "TatI",
		"GAWTC" => "TfiI",
		"GCWGC" => "TseI",	
		"GTSAC" => "Tsp45I",
		"ACNGT" => "Tsp4CI",
		"AATT" => "TspEI",
		"CASTGNN" => "TspRI",
		"GACNNNGTC" => "Tth111I",
		"ATTAAT" => "VspI",
		"TCTAGA" => "XbaI",
		"CCANNNNNNNNNTGG" => "XcmI",
		"CTCGAG" => "XhoI",
		"RGATCY" => "XhoII",
		"CGGCCG" => "XmaIII",
		"GAANNNNTTC" => "XmnI"
	);

	$Ename = $REName{$_[0]};
	return $Ename;
}

sub getLocation{
	my $Elocation;
	my %RELocation = (
          "GACGTC" => "5",
          "GTMKAC" => "2",
          "AACGTT" => "2",
          "GRCGYC" => "2",
          "CTTAAG" => "1",
          "ACRYGT" => "1",
          "ACCGGT" => "1",
          "TTTAAA" => "3",
	  "GACNNNNNGTC" => "6",
          "AGCT" => "2",
          "CAGNNNCTG" => "6",
          "GCANNNNNTGC" => "8",
          "GGGCCC" => "5",
          "GTGCAC" => "1",
	"RAATTY" => "1",
          "GGCGCGCC" => "2",
          "GGNCC" => "1",
          "TTCGAA" => "2",
          "CYCGRG" => "1",
          "GGWCC" => "1",
          "CCTAGG" => "1",
          "TGGCCA" => "3",
          "GGATCC" => "1",
          "TGATCA" => "1",
          "WCCGGW" => "1",
          "GCCNNNNNGGC" => "7",
          "AGATCT" => "1",
          "YACGTR" => "3",
          "GATNNNNATC" => "5",
          "GCGCGC" => "1",
          "CCNNNNNNNGG" => "7",
          "TGTACA" => "1",
          "TCATGA" => "1",
          "ACATGT" => "1",
          "TCCGGA" => "1",
          "GGTNACC" => "1",
          "CCANNNNNNTGG" => "8",
          "GCNNGC" => "3",
          "CCSGG" => "2",
	"RCCGGY" => "1",
          "YGGCCR" => "1",
          "ATCGAT" => "2",
          "RGCY" => "2",
          "TGCA" => "2",
          "CTNAG" => "1",
          "GATC" => "2",
	  "TTTAAA" => "3",
          "RGGNCCY" => "2",
          "CACNNNGTG" => "6",
          "GACNNNNNNGTC" => "7",
          "CCRYGG" => "1",
          "GACNNNNNGTC" => "6",
          "AGCGCT" => "3",
          "CCTNNNNNAGG" => "5",
          "GAATTC" => "1",
          "CCWGG" => "0",
          "GATATC" => "3",
          "GCTNAGC" => "2",
          "GCNGC" => "2",
          "CGCG" => "2",
          "GGCCGGCC" => "6",
          "WGGCCW" => "3",
          "RGCGCY" => "5",
          "GGCC" => "2",
          "GWGCWC" => "5",
          "GGYRCC" => "1",
          "GRGCYC" => "5",
          "GCGC" => "3",
	  "GTYRAC" => "3",
          "GTYRAC" => "3",
          "AAGCTT" => "1",
          "GANTC" => "1",
          "GTTAAC" => "3",
          "CCGG" => "1",
          "GGTACC" => "5",
          "CTAG" => "1",
          "ACGT" => "1",
          "GTNAC" => "0",
          "GATC" => "0",
          "CGRYCG" => "4",
          "CAATTG" => "1",
          "ACGCGT" => "1",
          "TTAA" => "1",
          "CAYNNNNRTG" => "5",
          "TGCGCA" => "3",
          "GCNNNNNNNGC" => "7",
          "GCCGGC" => "3",
          "GGCGCC" => "2",
          "CCATGG" => "1",
          "CATATG" => "2",
          "GCTAGC" => "1",
          "CATG" => "4",
          "GGNNCC" => "3",
          "GCGGCCGC" => "2",
          "TCGCGA" => "3",
          "CMGCKG" => "3",
          "RCATGY" => "5",
          "TTAATTAA" => "5",
          "CCANNNNNTGG" => "7",
          "CACGTG" => "3",
          "GTTTAAAC" => "4",
          "RGGWCCY" => "2",
          "GACNNNNGTC" => "5",
          "CTGCAG" => "5",
          "CGATCG" => "4",
          "CAGCTG" => "3",
          "GTAC" => "2",
          "CGGWCCG" => "2",
          "GAGCTC" => "5",
          "CCGCGG" => "4",
	"GGNCC" => "1",
          "GTCGAC" => "1",
          "GGGWCCC" => "2",
          "CCTNAGG" => "2",
	  "CCTGCAGG" => "6",
          "AGTACT" => "3",
          "CCNGG" => "2",
          "GDGCHC" => "5",
          "CCNNGG" => "1",
          "ACCWGGT" => "1",
          "CTRYAG" => "1",
          "GGCCNNNNNGGCC" => "8",
          "GCGATCGC" => "5",
          "CRCCGGYG" => "2",
          "CCCGGG" => "3",
          "CTYRAG" => "1",
          "TACGTA" => "3",
          "ACTAGT" => "1",
          "GCATGC" => "5",
          "CGTACG" => "1",
          "GCCCGGGC" => "4",
          "CCTGCAGG" => "6",
          "AGGWCCT" => "2",
          "AATATT" => "3",
          "AGGCCT" => "3",
          "CCWWGG" => "1",
          "ATTTAAAT" => "4",
          "TCGA" => "1",
          "WGTACW" => "1",
          "GAWTC" => "1",
          "GCWGC" => "1",
          "GTSAC" => "0",
          "ACNGT" => "3",
          "AATT" => "0",
          "CASTGNN" => "7",
          "GACNNNGTC" => "4",
          "ATTAAT" => "2",
          "TCTAGA" => "1",
          "CCANNNNNNNNNTGG" => "8",
          "CTCGAG" => "1",
          "RGATCY" => "1",
          "CGGCCG" => "1",
          "GAANNNNTTC" => "5",
	);

	$Elocation = $RELocation{$_[0]};
	return $Elocation;
}

sub reverseComplement{
	my $reverse;
	$reverse = reverse($_[0]);
	$reverse =~ s/A/1/g;
	$reverse =~ s/C/2/g;
	$reverse =~ s/G/3/g;
	$reverse =~ s/T/4/g;
	$reverse =~ s/1/T/g;
	$reverse =~ s/2/G/g;
	$reverse =~ s/3/C/g;
	$reverse =~ s/4/A/g;
	print "$reverse";
}
1;