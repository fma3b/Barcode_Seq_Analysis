#####Code for application
#!/usr/bin/perl

#This script is written for matching and counting the barcode sequences.

 
#open the files that has the systematic names and the barcodes sequences for all non_essential (homozygous strains):
open(BARCODES, 'Heterozygous_Barcodes.txt') || die "cant open the all barcode hetero file: $!\n";

#open the string sequence for replicate_1 9051 file:   
open (RFILE, 'STRING_E_1009_1.txt') || die "Can't open string_e_1009 1 file: $!\n";


#Exract the output files that will contain the counting sequences   
open (ROUT, ">COUNT_e_1009_1.txt") || die "Can't open counts_e_1009 1 file: $!\n";


#read the data from all barcodes homo file as an array
@homo = <BARCODES>;
$homo = ();
@mini=();
@barcodes = ();

#read the data from 9051_1 file as an array
$string = <RFILE>;
#print $string;

#Declare the hashes:
my %count=();
my %sys_bc_hash=();

foreach $homo(@homo)
{
#Split the barcodes file data into column 1(systematic names), column 2 (barcodes)
   @mini = split(/\t/, $homo);
   
   #save barcode sequence in a variable
   $sys_names = $mini[0];
   #save systematic name in a variable
   $barcodes = $mini[1];
   #remove the unseen new line character:
   chomp $sys_names;
   $sys_names =~ s/[^a-zA-Z0-9]//g;
   chomp $barcodes;
   $barcodes =~ s/[^a-zA-Z0-9]//g;
#print to make sure it is right:  
#print  " \n $sys_names \t $barcodes \n";
@barcodes = $barcodes;
$sys_bc_hash{$barcodes} = $sys_names;

foreach$barcodes(<@barcodes>)
{

#I add * star to the all barcodes because "we have include exact barcode matches and near matches (i.e., 1 base off)
# and create an overall tally for each barcode within each experimental". 
#According to (Smith, et.al 2012 :Barcode Sequencing for Understanding Drug–Gene Interactions). 
        
        while ($string=~ /$barcodes*/ig)
        { 
        $count{$barcodes}++ 
        }
        
        unless ($string=~ /$barcodes/ig)
        {
        $count{$barcodes}= 0;
        }

        
}


}

$counter=0;

while (my($key, $value) = each(%count))
{
if ($value>=1)
{++$counter;}
print ROUT "\n $sys_bc_hash{$key} \t $key \t $value"; 
}

$persentage_represent= 0;

$persentage_represent=$counter/1100*100;

print "\n For E_1009_1, there are ~ $persentage_represent% of total Heterozygous Mutant. \n";




 

close BARCODES;
close RFILE;

 
exit;

#####End of code for application
