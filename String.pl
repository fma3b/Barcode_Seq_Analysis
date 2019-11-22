#####Code for application
#!/usr/bin/perl

#This script is written for joining each demultiplexed sequence reads into a string
#which makes the next step (matching & counting) more faster.


#open 12 heterozygous replicates files:
#open the replicate files containing the demultiplexed sequence reads for 1009:   
open (R1FILE, 'E_1009_1.txt') || die "Can't open replicate E_1009 1 file: $!\n";
open (R2FILE, 'E_1009_2.txt') || die "Can't open replicate E_1009 2 file: $!\n";
open (R3FILE, 'E_1009_3.txt') || die "Can't open replicate E_1009 3 file: $!\n";
open (R4FILE, 'E_1009_4.txt') || die "Can't open replicate E_1009 4 file: $!\n";
#open the replicate files containing the demultiplexed sequence reads for MMS:   
open (R5FILE, 'E_MMS_1.txt') || die "Can't open replicate E_MMS 1 file: $!\n";
open (R6FILE, 'E_MMS_2.txt') || die "Can't open replicate E_MMS 2 file: $!\n";
open (R7FILE, 'E_MMS_3.txt') || die "Can't open replicate E_MMS 3 file: $!\n";
open (R8FILE, 'E_MMS_4.txt') || die "Can't open replicate E_MMS 4 file: $!\n";
#open the replicate files containing the demultiplexed sequence reads for DMSO:   
open (R9FILE, 'E_DMSO_1.txt') || die "Can't open replicate E_DMSO 1 file: $!\n";
open (R10FILE,'E_DMSO_2.txt') || die "Can't open replicate E_DMSO 2 file: $!\n";
open (R11FILE,'E_DMSO_3.txt') || die "Can't open replicate E_DMSO 3 file: $!\n";
open (R12FILE,'E_DMSO_4.txt') || die "Can't open replicate E_DMSO 4 file: $!\n";



#open 12 homozygous replicates files:
#open the replicate files containing the demultiplexed sequence reads for 1009:   
open (R13FILE, 'NON_1009_1.txt') || die "Can't open replicate NON_1009 1 file: $!\n";
open (R14FILE, 'NON_1009_2.txt') || die "Can't open replicate NON_1009 2 file: $!\n";
open (R15FILE, 'NON_1009_3.txt') || die "Can't open replicate NON_1009 3 file: $!\n";
open (R16FILE, 'NON_1009_4.txt') || die "Can't open replicate NON_1009 4 file: $!\n";
#open the replicate files containing the demultiplexed sequence reads for MMS:   
open (R17FILE, 'NON_MMS_1.txt') || die "Can't open replicate NON_MMS 1 file: $!\n";
open (R18FILE, 'NON_MMS_2.txt') || die "Can't open replicate NON_MMS 2 file: $!\n";
open (R19FILE, 'NON_MMS_3.txt') || die "Can't open replicate NON_MMS 3 file: $!\n";
open (R20FILE, 'NON_MMS_4.txt') || die "Can't open replicate NON_MMS 4 file: $!\n";
#open the replicate files containing the demultiplexed sequence reads for DMSO:   
open (R21FILE, 'NON_DMSO_1.txt') || die "Can't open replicate NON_DMSO 1 file: $!\n";
open (R22FILE, 'NON_DMSO_2.txt') || die "Can't open replicate NON_DMSO 2 file: $!\n";
open (R23FILE, 'NON_DMSO_3.txt') || die "Can't open replicate NON_DMSO 3 file: $!\n";
open (R24FILE, 'NON_DMSO_4.txt') || die "Can't open replicate NON_DMSO 4 file: $!\n";


#output 12 heterozygous replicates files that will contain the string sequence:
#output the files that will contain the string sequence for 1009 replicates:  
open (R1OUT, ">STRING_E_1009_1.txt") || die "Can't open  STRING_E_1009 1 file: $!\n";
open (R2OUT, ">STRING_E_1009_2.txt") || die "Can't open  STRING_E_1009 2 file: $!\n";
open (R3OUT, ">STRING_E_1009_3.txt") || die "Can't open  STRING_E_1009 3 file: $!\n";
open (R4OUT, ">STRING_E_1009_4.txt") || die "Can't open  STRING_E_1009 4 file: $!\n";
#output the replicate files containing the the string sequence for MMS replicates:   
open (R5OUT, ">STRING_E_MMS_1.txt") || die "Can't open replicate E_MMS 1 file: $!\n";
open (R6OUT, ">STRING_E_MMS_2.txt") || die "Can't open replicate E_MMS 2 file: $!\n";
open (R7OUT, ">STRING_E_MMS_3.txt") || die "Can't open replicate E_MMS 3 file: $!\n";
open (R8OUT, ">STRING_E_MMS_4.txt") || die "Can't open replicate E_MMS 4 file: $!\n";
#output the replicate files containing the the string sequence for DMSO replicates:   
open (R9OUT, ">STRING_E_DMSO_1.txt") || die "Can't open E DMSO 1 file: $!\n";
open (R10OUT, ">STRING_E_DMSO_2.txt") || die "Can't open E DMSO 2 file: $!\n";
open (R11OUT, ">STRING_E_DMSO_3.txt") || die "Can't open E DMSO 3 file: $!\n";
open (R12OUT, ">STRING_E_DMSO_4.txt") || die "Can't open E DMSO 4 file: $!\n";



#output 12 homozygous replicates files that will contain the string sequence:
#output the files that will contain the string sequence for 1009 replicates:  
open (R13OUT, ">STRING_NON_1009_1.txt") || die "Can't open  STRING_NON_1009 1 file: $!\n";
open (R14OUT, ">STRING_NON_1009_2.txt") || die "Can't open  STRING_NON_1009 2 file: $!\n";
open (R15OUT, ">STRING_NON_1009_3.txt") || die "Can't open  STRING_NON_1009 3 file: $!\n";
open (R16OUT, ">STRING_NON_1009_4.txt") || die "Can't open  STRING_NON_1009 4 file: $!\n";
#output the files that will contain the string sequence for MMS replicates:  
open (R17OUT, ">STRING_NON_MMS_1.txt") || die "Can't open replicate NON_MMS 1 file: $!\n";
open (R18OUT, ">STRING_NON_MMS_2.txt") || die "Can't open replicate NON_MMS 2 file: $!\n";
open (R19OUT, ">STRING_NON_MMS_3.txt") || die "Can't open replicate NON_MMS 3 file: $!\n";
open (R20OUT, ">STRING_NON_MMS_4.txt") || die "Can't open replicate NON_MMS 4 file: $!\n";
#output the files that will contain the string sequence for DMSO replicates:  
open (R21OUT, ">STRING_NON_DMSO_1.txt") || die "Can't open NON DMSO 1 file: $!\n";
open (R22OUT, ">STRING_NON_DMSO_2.txt") || die "Can't open NON DMSO 2 file: $!\n";
open (R23OUT, ">STRING_NON_DMSO_3.txt") || die "Can't open NON DMSO 3 file: $!\n";
open (R24OUT, ">STRING_NON_DMSO_4.txt") || die "Can't open NON DMSO 4 file: $!\n";




#read the data from each E_1009 input file as an array
@replicate_1 = <R1FILE>;
@replicate_2 = <R2FILE>;
@replicate_3 = <R3FILE>;
@replicate_4 = <R4FILE>;

#read the data from each E_MMS input file as an array
@replicate_5 = <R5FILE>;
@replicate_6 = <R6FILE>;
@replicate_7 = <R7FILE>;
@replicate_8 = <R8FILE>;

#read the data from each E_DMSO input file as an array
@replicate_9 = <R9FILE>;
@replicate_10 = <R10FILE>;
@replicate_11 = <R11FILE>;
@replicate_12 = <R12FILE>;


#read the data from each NON_1009 input file as an array
@replicate_13 = <R13FILE>;
@replicate_14 = <R14FILE>;
@replicate_15 = <R15FILE>;
@replicate_16 = <R16FILE>;

#read the data from each NON_MMS input file as an array
@replicate_17 = <R17FILE>;
@replicate_18 = <R18FILE>;
@replicate_19 = <R19FILE>;
@replicate_20 = <R20FILE>;

#read the data from each NON_DMSO input file as an array
@replicate_21 = <R21FILE>;
@replicate_22 = <R22FILE>;
@replicate_23 = <R23FILE>;
@replicate_24 = <R24FILE>;



#For each replicate file, Put all the sequence reads for each replicate into a single string
$string_1= join( '', @replicate_1);
$string_2= join( '', @replicate_2);
$string_3= join( '', @replicate_3);
$string_4= join( '', @replicate_4);
$string_5= join( '', @replicate_5);
$string_6= join( '', @replicate_6);
$string_7= join( '', @replicate_7);
$string_8= join( '', @replicate_8);
$string_9= join( '', @replicate_9);
$string_10= join( '', @replicate_10);
$string_11= join( '', @replicate_11);
$string_12= join( '', @replicate_12);
$string_13= join( '', @replicate_13);
$string_14= join( '', @replicate_14);
$string_15= join( '', @replicate_15);
$string_16= join( '', @replicate_16);
$string_17= join( '', @replicate_17);
$string_18= join( '', @replicate_18);
$string_19= join( '', @replicate_19);
$string_20= join( '', @replicate_20);
$string_21= join( '', @replicate_21);
$string_22= join( '', @replicate_22);
$string_23= join( '', @replicate_23);
$string_24= join( '', @replicate_24);


# Remove whitespace
$string_1=~ s/\s//g;
$string_2=~ s/\s//g; 
$string_3=~ s/\s//g; 
$string_4=~ s/\s//g; 
$string_5=~ s/\s//g; 
$string_6=~ s/\s//g; 
$string_7=~ s/\s//g; 
$string_8=~ s/\s//g;
$string_9=~ s/\s//g; 
$string_10=~ s/\s//g; 
$string_11=~ s/\s//g; 
$string_12=~ s/\s//g; 
$string_13=~ s/\s//g;
$string_14=~ s/\s//g; 
$string_15=~ s/\s//g; 
$string_16=~ s/\s//g; 
$string_17=~ s/\s//g; 
$string_18=~ s/\s//g; 
$string_19=~ s/\s//g; 
$string_20=~ s/\s//g;
$string_21=~ s/\s//g; 
$string_22=~ s/\s//g; 
$string_23=~ s/\s//g; 
$string_24=~ s/\s//g; 




#print to each output txt file:
print R1OUT "$string_1";
print R2OUT "$string_2";
print R3OUT "$string_3";
print R4OUT "$string_4";
print R5OUT "$string_5";
print R6OUT "$string_6";
print R7OUT "$string_7";
print R8OUT "$string_8";
print R9OUT "$string_9";
print R10OUT "$string_10";
print R11OUT "$string_11";
print R12OUT "$string_12";
print R13OUT "$string_13";
print R14OUT "$string_14";
print R15OUT "$string_15";
print R16OUT "$string_16";
print R17OUT "$string_17";
print R18OUT "$string_18";
print R19OUT "$string_19";
print R20OUT "$string_20";
print R21OUT "$string_21";
print R22OUT "$string_22";
print R23OUT "$string_23";
print R24OUT "$string_24";

#close all files:
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
close R13FILE;
close R14FILE;
close R15FILE;
close R16FILE;
close R17FILE;
close R18FILE;
close R19FILE;
close R20FILE;
close R21FILE;
close R22FILE;
close R23FILE;
close R24FILE;

exit;

#####End of code for application
