#####Code for application
#!/usr/bin/perl -w


#open the input file containing the processing sequences
open (DEFILE, "Galaxy5_processed.txt") || die "Can't open preprocessed file: $!\n";


#Exract the output files containing the demultiplexed sequences   
open (R1FILE, ">NON_1009_1.txt") || die "Can't open replicate NON 1009 1 file: $!\n";
open (R2FILE, ">NON_1009_2.txt") || die "Can't open replicate NON 1009 2 file: $!\n";
open (R3FILE, ">NON_1009_3.txt") || die "Can't open replicate NON 1009 3 file: $!\n";
open (R4FILE, ">NON_1009_4.txt") || die "Can't open replicate NON 1009 4 file: $!\n";
open (R5FILE, ">NON_MMS_1.txt") || die "Can't open replicate NON MMS 1 file: $!\n";
open (R6FILE, ">NON_MMS_2.txt") || die "Can't open replicate NON MMS 2 file: $!\n";
open (R7FILE, ">NON_MMS_3.txt") || die "Can't open replicate NON MMS 3 file: $!\n";
open (R8FILE, ">NON_MMS_4.txt") || die "Can't open replicate NON MMS 4 file: $!\n";
open (R9FILE, ">NON_DMSO_1.txt") || die "Can't open replicate NON DMSO 1 file: $!\n";
open (R10FILE, ">NON_DMSO_2.txt") || die "Can't open replicate NON DMSO 2 file: $!\n";
open (R11FILE, ">NON_DMSO_3.txt") || die "Can't open replicate NON DMSO 3 file: $!\n";
open (R12FILE, ">NON_DMSO_4.txt") || die "Can't open replicate NON DMSO 4 file: $!\n";

open (R13FILE, ">E_1009_1.txt") || die "Can't open replicate E 1009 1 file: $!\n";
open (R14FILE, ">E_1009_2.txt") || die "Can't open replicate E 1009 2 file: $!\n";
open (R15FILE, ">E_1009_3.txt") || die "Can't open replicate E1009 3 file: $!\n";
open (R16FILE, ">E_1009_4.txt") || die "Can't open replicate E 1009 4 file: $!\n";
open (R17FILE, ">E_MMS_1.txt") || die "Can't open replicate E MMS 1 file: $!\n";
open (R18FILE, ">E_MMS_2.txt") || die "Can't open replicate E MMS 2 file: $!\n";
open (R19FILE, ">E_MMS_3.txt") || die "Can't open replicate E MMS 3 file: $!\n";
open (R20FILE, ">E_MMS_4.txt") || die "Can't open replicate E MMS 4 file: $!\n";
open (R21FILE, ">E_DMSO_1.txt") || die "Can't open replicate E DMSO 1 file: $!\n";
open (R22FILE, ">E_DMSO_2.txt") || die "Can't open replicate E DMSO 2 file: $!\n";
open (R23FILE, ">E_DMSO_3.txt") || die "Can't open replicate E DMSO 3 file: $!\n";
open (R24FILE, ">E_DMSO_4.txt") || die "Can't open replicate E DMSO 4 file: $!\n";
open (OTHERS, ">Others.txt") || die "Can't open replicate others file: $!\n";


				
#initialize the arrays and variable for each replicate 
@array1 = ();
$replicate1 = "(N|AATAGGCGCT)";
$repl1 = 0;

@array2 =();
$replicate2 = "(N|TACAGTTGCG)";
$repl2 = 0;

@array3 =();
$replicate3 = "(N|ATCCTAGCAG)";
$repl3 = 0;

@array4 =();
$replicate4 = "(N|GATTAGCCTC)";
$repl4 = 0;

@array5 =();
$replicate5 = "(N|AATGAGCCGT)";
$repl5 = 0;

@array6 =();
$replicate6 = "(N|ACGCGGATTA)";
$repl6 = 0;

@array7 =();
$replicate7 = "(N|GCTTACGGAA)";
$repl7 = 0;

@array8 =();
$replicate8 = "(N|CGGTAGACTA)";
$repl8 = 0;

@array9 =();
$replicate9 = "(N|ATTGCCGGAA)";
$repl9 = 0;

@array10 =();
$replicate10 = "(N|GACATGCTAG)";
$repl10 = 0;

@array11 =();
$replicate11 = "(N|TACGCTGCAT)";
$repl11 = 0;

@array12 =();
$replicate12 = "(N|GTCAAGCACT)";
$repl12 = 0;

@array13 = ();
$replicate13 = "(N|AGCGTATGTC)";
$repl13 = 0;

@array14 =();
$replicate14 = "(N|GCGGATTAAC)";
$repl14 = 0;

@array15 =();
$replicate15 = "(N|ATACCTCGGA)";
$repl15 = 0;

@array16 =();
$replicate16 = "(N|GGTAGACATC)";
$repl16 = 0;

@array17 =();
$replicate17 = "(N|AGGTACCTAC)";
$repl17 = 0;

@array18 =();
$replicate18 = "(N|CGATAACGCT)";
$repl18 = 0;

@array19 =();
$replicate19 = "(N|TACCGGAATG)";
$repl19 = 0;

@array20 =();
$replicate20 = "(N|TAGGACCAGT)";
$repl20 = 0;

@array21 =();
$replicate21 = "(N|CTGCAAGTTC)";
$repl21 = 0;

@array22 =();
$replicate22 = "(N|TCGCGATTCA)";
$repl22 = 0;

@array23 =();
$replicate23 = "(N|GGTAACGTAC)";
$repl23 = 0;

@array24 =();
$replicate24 = "(N|AAGACCTGTG)";
$repl24 = 0;

@others = ();
$others = 0;

#making each sequence-read (each line) to be as an single element in the array called lines (whole file) 
@lines = ();


#$demulti = ();
#$demulti = <DEFILE>;
#$mini = ();

 #use strict;
 #use warnings;



while (<DEFILE>) 
{

if (@lines =sort /$replicate1/)
{
push (@array1, $_);
#count
++$repl1;
}

elsif (@lines =sort /$replicate2/)
{
push (@array2, $_);
#count
++$repl2;
}

elsif (@lines =sort /$replicate3/)
{
push (@array3, $_);
#count
++$repl3;
}

elsif (@lines =sort /$replicate4/)
{
push (@array4, $_);
#count
++$repl4;
}

elsif (@lines =sort /$replicate5/)
{
push (@array5, $_);
#count
++$repl5;
}

elsif (@lines =sort /$replicate6/)
{
push (@array6, $_);
#count
++$repl6;
}

elsif (@lines =sort /$replicate7/)
{
push (@array7, $_);
#count
++$repl7;
}

elsif (@lines =sort /$replicate8/)
{
push (@array8, $_);
#count
++$repl8;
}

elsif (@lines =sort /$replicate9/)
{
push (@array9, $_);
#count
++$repl9;
}

elsif (@lines =sort /$replicate10/)
{
push (@array10, $_);
#count
++$repl10;
}

elsif (@lines =sort /$replicate11/)
{
push (@array11, $_);
#count
++$repl11;
}

elsif (@lines =sort /$replicate12/)
{
push (@array12, $_);
#count
++$repl12;
}

elsif (@lines =sort /$replicate13/)
{
push (@array13, $_);
#count
++$repl13;
}

elsif (@lines =sort /$replicate14/)
{
push (@array14, $_);
#count
++$repl14;
}

elsif (@lines =sort /$replicate15/)
{
push (@array15, $_);
#count
++$repl15;
}

elsif (@lines =sort /$replicate16/)
{
push (@array16, $_);
#count
++$repl16;
}

elsif (@lines =sort /$replicate17/)
{
push (@array17, $_);
#count
++$repl17;
}

elsif (@lines =sort /$replicate18/)
{
push (@array18, $_);
#count
++$repl18;
}

elsif (@lines =sort /$replicate19/)
{
push (@array19, $_);
#count
++$repl19;
}

elsif (@lines =sort /$replicate20/)
{
push (@array20, $_);
#count
++$repl20;
}

elsif (@lines =sort /$replicate21/)
{
push (@array21, $_);
#count
++$repl21;
}

elsif (@lines =sort /$replicate22/)
{
push (@array22, $_);
#count
++$repl22;
}

elsif (@lines =sort /$replicate23/)
{
push (@array23, $_);
#count
++$repl23;
}

elsif (@lines =sort /$replicate24/)
{
push (@array24, $_);
#count
++$repl24;
}

else
{
push (@others, $_);
++$others;
#print OTHER "there are un-demultiplexed reads!!?. $others \n";
}

}


print R1FILE "@array1";
print R2FILE "@array2";
print R3FILE "@array3";
print R4FILE "@array4";
print R5FILE "@array5";
print R6FILE "@array6";
print R7FILE "@array7";
print R8FILE "@array8";
print R9FILE "@array9";
print R10FILE "@array10";
print R11FILE "@array11";
print R12FILE "@array12";

print R13FILE "@array13";
print R14FILE "@array14";
print R15FILE "@array15";
print R16FILE "@array16";
print R17FILE "@array17";
print R18FILE "@array18";
print R19FILE "@array19";
print R20FILE "@array20";
print R21FILE "@array21";
print R22FILE "@array22";
print R23FILE "@array23";
print R24FILE "@array24";
print OTHERS "@others";


print "\n For replicate1 there are = $repl1 \n";
print "\n For replicate2 there are = $repl2 \n"; 
print "\n For replicate3 there are = $repl3 \n"; 
print "\n For replicate4 there are = $repl4 \n"; 
print "\n For replicate5 there are = $repl5 \n";
print "\n For replicate6 there are = $repl6 \n";
print "\n For replicate7 there are = $repl7 \n";
print "\n For replicate8 there are = $repl8 \n";
print "\n For replicate9 there are = $repl9 \n";
print "\n For replicate10 there are = $repl10 \n"; 
print "\n For replicate11 there are = $repl11 \n";
print "\n For replicate12 there are = $repl12 \n";
print "\n For replicate13 there are = $repl13 \n";
print "\n For replicate14 there are = $repl14\n"; 
print "\n For replicate15 there are = $repl15 \n"; 
print "\n For replicate16 there are = $repl16 \n"; 
print "\n For replicate17 there are = $repl17 \n";
print "\n For replicate18 there are = $repl18 \n";
print "\n For replicate19 there are = $repl19 \n";
print "\n For replicate20 there are = $repl20 \n";
print "\n For replicate21 there are = $repl21 \n";
print "\n For replicate22 there are = $repl22 \n"; 
print "\n For replicate23 there are = $repl23 \n";
print "\n For replicate24 there are = $repl24 \n";
print "\n For others there are = $others \n";

close DEFILE;

exit;

#####End of code for application
