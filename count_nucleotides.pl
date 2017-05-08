#!/usr/bin/perl

# open directory and read contents of files
print "Copyright (c) 2010\nIsidro C. Medina Jr.\n\n";

&process_folder;

sub process_folder{
print "\nType the folder you want to process: ";
@files = (  );
$folder = <STDIN>;
chomp($folder); 

unless(opendir(FOLDER, $folder)) {
    print "Cannot open folder $folder\n";
    exit;
}
@files = grep (!/^\.\.?$/, readdir(FOLDER));  # Read the folder, ignoring special entries "." and ".."
closedir(FOLDER);
}

&count;

# Open a new file to write the output.
sub count{
open (CTR_OUT, '>files/count.txt');
# Initialize values
 
 
# For each file in the folder
foreach $file (@files) {
 $ctr = 0;	   
# Open the file
		open(INPUT,"$folder/$file");
		$data = <INPUT>;
		close(INPUT);

# Count and print the number of entries. 
		@sequence = split (//, $data);
		$bases = @sequence;
    foreach $letter (@sequence){
      if ($letter eq 'N'){
      $ctr++;
      
      }		
      $quality=  100-$ctr/$bases*100;
    }
print CTR_OUT "$file \ttotal nucleotides: $bases \tN count: $ctr \tquality: $quality\n";
}
# Save and close the file.
close (CTR_OUT);
}