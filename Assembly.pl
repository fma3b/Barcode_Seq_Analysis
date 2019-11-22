#####Code for application
#!/usr/bin/perl

#This script is written for Assembling the counts for each mutant.

#open the Heterozygous files that have systematic names and Barcode sequences with counts:
 
open (R1FILE, 'COUNT_e_1009_1.txt') || die "Can't open counts e 1009 1 file: $!\n";
open (R2FILE, 'COUNT_e_1009_2.txt') || die "Can't open counts e 1009 2 file: $!\n";
open (R3FILE, 'COUNT_e_1009_3.txt') || die "Can't open counts e 1009 3 file: $!\n";
open (R4FILE, 'COUNT_e_1009_4.txt') || die "Can't open counts e 1009 4 file: $!\n";

open (R5FILE, 'COUNT_e_mms_1.txt') || die "Can't open counts_mms_1 file: $!\n";
open (R6FILE, 'COUNT_e_mms_2.txt') || die "Can't open counts_mms_2 file: $!\n";
open (R7FILE, 'COUNT_e_mms_3.txt') || die "Can't open counts_mms_3 file: $!\n";
open (R8FILE, 'COUNT_e_mms_4.txt') || die "Can't open counts_mms_4 file: $!\n";

open (R9FILE, 'COUNT_e_dmso_1.txt') || die "Can't open counts_DMSO_1 file: $!\n";
open (R10FILE, 'COUNT_e_dmso_2.txt') || die "Can't open counts_DMSO_2 file: $!\n";
open (R11FILE, 'COUNT_e_dmso_3.txt') || die "Can't open counts_DMSO_3 file: $!\n";
open (R12FILE, 'COUNT_e_dmso_4.txt') || die "Can't open counts_DMSO_4 file: $!\n";

open (NAMES, 'GeneNames.txt') || die "Can't open counts_DMSO_4 file: $!\n";
            


open (ALLOUT, ">E_ALL_COUNTING_Edited.txt") || die "Can't open sorted all file: $!\n";


#read the data from 1009 files as arrays
@array_1 = <R1FILE>;
@array_2 = <R2FILE>;
@array_3 = <R3FILE>;
@array_4 = <R4FILE>;

#read the data from MMS files as arrays
@array_5 = <R5FILE>;
@array_6 = <R6FILE>;
@array_7 = <R7FILE>;
@array_8 = <R8FILE>;

#read the data from DMSO files as arrays
@array_9 = <R9FILE>;
@array_10 = <R10FILE>;
@array_11 = <R11FILE>;
@array_12 = <R12FILE>;
@both = <NAMES>;



%hash_both = ();
foreach $both(@both)
{
#Split the all both names file data into column 1 (serial numbers), column 2(systematic names), column 3 (common names), and (general function)
   @mini = split(/\t/, $both);
   #save systematic names in a variable
   $sys_names = $mini[0];
   #save common names in a variable
   $common_names = $mini[1];
   #save general function in a variable
   $function = $mini[2];
   #remove the unseen new line character:
   chomp $sys_names;
   $sys_names =~ s/[^a-zA-Z0-9]//g;
   #chomp $common;
  # $common =~ s/[^a-zA-Z0-9]//g;
   #chomp $function;
   #$function =~ s/[^a-zA-Z0-9]//g;
   
#$values="$common \t $function";

$hash_both{$sys_names}="$common_names";

#@new_names=@hash_both{$sys_names};

#print  "\n $sys_names \t $common_names ";
}

%hash_one=();
foreach $array_1(@array_1)
{
#Split the barcodes file data into column 1(systematic names), column 2 (barcodes)
   @mini = split(/\t/, $array_1);
   
   $sys_names = $mini[0];
   $barcodes = $mini[1];
   $counts = $mini[2];

  chomp $sys_names;
   $sys_names =~ s/[^a-zA-Z0-9]//g;
   chomp $barcodes;
   $barcodes =~ s/[^a-zA-Z0-9]//g;
   chomp $counts;
   $counts =~ s/[^a-zA-Z0-9]//g;
   
#print to make sure it is right:  
#print  " \n $sys_names \t $counts \n";

$hash_one{$sys_names} ="$barcodes \t $counts";
#@values_hash_one=@hash_one{$counts};
#print " \n @values_hash_one \n";
#print " \n$hash_one{$sys_names}\n";
}



%hash_tow=();
foreach $array_2(@array_2)
{
#Split the barcodes file data into column 1(systematic names), column 2 (barcodes)
   @mini = split(/\t/, $array_2);
   
   $sys_names = $mini[0];

   $counts = $mini[2];

   chomp $sys_names;
   $sys_names =~ s/[^a-zA-Z0-9]//g;
   
   chomp $counts;
   $counts =~ s/[^a-zA-Z0-9]//g;
   
#print to make sure it is right:  
#print  " \n $barcodes \t $counts \n";

$hash_tow{$sys_names} = $counts;
#@values_hash_tow=@hash_tow{$sys_names};
#print " \n @values_hash_tow \n";
#print " \n$hash_tow{$barcodes}\n";
}


%hash_three=();
foreach $array_3(@array_3)
{
#Split the barcodes file data into column 1(systematic names), column 2 (barcodes)
   @mini = split(/\t/, $array_3);
   
   $sys_names = $mini[0];

   $counts = $mini[2];

   chomp $sys_names;
   $sys_names =~ s/[^a-zA-Z0-9]//g;
   
   chomp $counts;
   $counts =~ s/[^a-zA-Z0-9]//g;
   
#print to make sure it is right:  
#print  " \n $barcodes \t $counts \n";
$hash_three{$sys_names} = $counts;
#@values_hash_three=@hash_three{$sys_names};
#print " \n @values_hash_three \n";
#print " \n$hash_three{$barcodes}\n";
}


%hash_four=();
foreach $array_4(@array_4)
{
#Split the barcodes file data into column 1(systematic names), column 2 (barcodes)
   @mini = split(/\t/, $array_4);
   
   $sys_names = $mini[0];

   $counts = $mini[2];

  chomp $sys_names;
   $sys_names =~ s/[^a-zA-Z0-9]//g;
   
   chomp $counts;
   $counts =~ s/[^a-zA-Z0-9]//g;
   
#print to make sure it is right:  
#print  " \n $barcodes \t $counts \n";

$hash_four{$sys_names} = $counts;
#@values_hash_four=@hash_four{$sys_names};
#print " \n @values_hash_four \n";
#print " \n$hash_four{$barcodes}\n";
}



%hash_five=();
foreach $array_5(@array_5)
{
#Split the barcodes file data into column 1(systematic names), column 2 (barcodes)
   @mini = split(/\t/, $array_5);
   
   $sys_names = $mini[0];

   $counts = $mini[2];

  chomp $sys_names;
   $sys_names =~ s/[^a-zA-Z0-9]//g;
   
   chomp $counts;
   $counts =~ s/[^a-zA-Z0-9]//g;
   
#print to make sure it is right:  
#print  " \n $barcodes \t $counts \n";

$hash_five{$sys_names} = $counts;
#@values_hash_one=@hash_five{$sys_names};
#print " \n @values_hash_one \n";
#print " \n$hash_five{$barcodes}\n";
}



%hash_six=();
foreach $array_6(@array_6)
{
#Split the barcodes file data into column 1(systematic names), column 2 (barcodes)
   @mini = split(/\t/, $array_6);
   
   $sys_names = $mini[0];

   $counts = $mini[2];

   chomp $sys_names;
   $sys_names =~ s/[^a-zA-Z0-9]//g;
   
   chomp $counts;
   $counts =~ s/[^a-zA-Z0-9]//g;
   
#print to make sure it is right:  
#print  " \n $barcodes \t $counts \n";

$hash_six{$sys_names} = $counts;
#@values_hash_six=@hash_six{$sys_names};
#print " \n @values_hash_tow \n";
}


%hash_seven=();
foreach $array_7(@array_7)
{
#Split the barcodes file data into column 1(systematic names), column 2 (barcodes)
   @mini = split(/\t/, $array_7);
   
   $sys_names = $mini[0];

   $counts = $mini[2];

   chomp $sys_names;
   $sys_names =~ s/[^a-zA-Z0-9]//g;
   
   chomp $counts;
   $counts =~ s/[^a-zA-Z0-9]//g;
   
#print to make sure it is right:  
#print  " \n $barcodes \t $counts \n";
$hash_seven{$sys_names} = $counts;
#@values_hash_seven=@hash_seven{$sys_names};
#print " \n @values_hash_three \n";
}


%hash_eight=();
foreach $array_8(@array_8)
{
#Split the barcodes file data into column 1(systematic names), column 2 (barcodes)
   @mini = split(/\t/, $array_8);
   
   $sys_names = $mini[0];

   $counts = $mini[2];

   chomp $sys_names;
   $sys_names =~ s/[^a-zA-Z0-9]//g;
   
   chomp $counts;
   $counts =~ s/[^a-zA-Z0-9]//g;
   
#print to make sure it is right:  
#print  " \n $barcodes \t $counts \n";

$hash_eight{$sys_names} = $counts;
#@values_hash_eight=@hash_eight{$sys_names};
#print " \n @values_hash_four \n";
}


%hash_nine=();
foreach $array_9(@array_9)
{
#Split the barcodes file data into column 1(systematic names), column 2 (barcodes)
   @mini = split(/\t/, $array_9);
   
   $sys_names = $mini[0];

   $counts = $mini[2];

  chomp $sys_names;
   $sys_names =~ s/[^a-zA-Z0-9]//g;
   
   chomp $counts;
   $counts =~ s/[^a-zA-Z0-9]//g;
   
#print to make sure it is right:  
#print  " \n $barcodes \t $counts \n";

$hash_nine{$sys_names} = $counts;
#@values_hash_nine=@hash_nine{$sys_names};
#print " \n @values_hash_nine \n";
}


%hash_ten=();
foreach $array_10(@array_10)
{
#Split the barcodes file data into column 1(systematic names), column 2 (barcodes)
   @mini = split(/\t/, $array_10);
   
   $sys_names = $mini[0];

   $counts = $mini[2];

  chomp $sys_names;
   $sys_names =~ s/[^a-zA-Z0-9]//g;
   
   chomp $counts;
   $counts =~ s/[^a-zA-Z0-9]//g;
   
#print to make sure it is right:  
#print  " \n $barcodes \t $counts \n";

$hash_ten{$sys_names} = $counts;
#@values_hash_ten=@hash_ten{$sys_names};
#print " \n @values_hash_ten \n";
}


%hash_eleven=();
foreach $array_11(@array_11)
{
#Split the barcodes file data into column 1(systematic names), column 2 (barcodes)
   @mini = split(/\t/, $array_11);
   
   $sys_names = $mini[0];

   $counts = $mini[2];

   chomp $sys_names;
   $sys_names =~ s/[^a-zA-Z0-9]//g;
   
   chomp $counts;
   $counts =~ s/[^a-zA-Z0-9]//g;
   
#print to make sure it is right:  
#print  " \n $barcodes \t $counts \n";

$hash_eleven{$sys_names} = $counts;
#@values_hash_nine=@hash_eleven{$sys_names};
#print " \n @values_hash_eleven \n";
}

%hash_twelve=();
foreach $array_12(@array_12)
{
#Split the barcodes file data into column 1(systematic names), column 2 (barcodes)
   @mini = split(/\t/, $array_12);
   
   $sys_names = $mini[0];

   $counts = $mini[2];

   chomp $sys_names;
   $sys_names =~ s/[^a-zA-Z0-9]//g;
   
   chomp $counts;
   $counts =~ s/[^a-zA-Z0-9]//g;
   
#print to make sure it is right:  
#print  " \n $barcodes \t $counts \n";

$hash_twelve{$sys_names} = $counts;
#@values_hash_twelve=@hash_twelve{$sys_names};
#print " \n @values_hash_twelve \n";
}



while (my ($key, $value)=each(%hash_one)) 
{
print ALLOUT "$hash_both{$key} \t $key \t $value \t $hash_tow{$key} \t $hash_three{$key} \t $hash_four{$key} \t $hash_five{$key} \t $hash_six{$key} \t $hash_seven{$key} \t $hash_eight{$key} \t $hash_nine{$key} \t $hash_ten{$key} \t $hash_eleven{$key} \t $hash_twelve{$key}\n";
}



 
close R1FILE;
close R2FILE;
close R3FILE;
close R4FILE;
close R5FILE;
close R6FILE;
close R7FILE;
close R8FILE;
close R9FILE;
close R10FILE;
close R11FILE;
close R12FILE;
close NAMES;
 
exit;

#####End of code for application

