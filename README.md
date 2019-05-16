# Barcode_seq-Analysis

# Post-sequencing functional analysis of synthetic UPTAG DNA barcodes of S. cerevisiae heterozygous and homozygous mutants.

#Experimental design: For heterozygous deletion pool that represents Essential genes, there are 4 replicates of E_SH1009 (Treatment), 4 replicates of E_MMS (Positive control), 4 replicates of E_DMSO (Negative control). For homozygous deletion pool that represents Non-essential genes, there are 4 replicates of NON_SH1009 (Treatment), 4 replicates of NON_MMS (Positive control), 4 replicates of NON_DMSO (Negative control). 

#Method: Two pools of S. cerevisiae (~1056) heterozygous mutants and (~4320) homozygous mutants were treated with aurone SH1009 at the concentration (~ 500 uM) that inhibited the growth by 20% for 48h. After purifying genomic DNA from the mutants, the synthetic UPTAG DNA barcodes (20 bp) were amplified using uniquely indexed primers to distinguish each sample. Then, multiplexed-next generation sequencing was used to quantitate the abundance of each mutant because mutant is uniquely identified with a synthetic DNA barcode. 

#The Illumina sequencer generated a Fastq file that was converted to Fasta file using online converter tool due to the ease of manipulating the Fasta file. 

#In order to process and analyze sequence reads, several Perl scripts were created and exanimated for their accuracy in barcode-seq functional analysis using the chemical genetic data of pervious lab study. These scripts can be run on Mac or Windows systems without need for high computer skills. Also, the efficiency of these scripts is applicable within only one day using computer with memory higher than 8 GB. 

#First: Processing.pl
#In Processing.pl script, the converted fasta file was the input file that processed to remove the header lines using substitution function (s//), resulting in total of 12,000,000 pure sequence reads. Each read contained 50 bp from 5' to 3'; 10 bp index tag, 18 bp common forward U1 region, 20 bp UPTAG unique barcode, and 2 bp from U2 common reverse region. 

#Second: Demultipexing.pl
#In Demultipexing.pl script, the total 12,000,000 sequence reads were de-multiplexed based on the index tags (~10 bp) using sort function (sort//) in order to assign each sequence read to its original sample. As a result of sorting function, 24 output files were extracted, each file represents one PCR product called with the same name of its forward primer, S3 Table.

#Third: String.pl 
#String.pl script was written for joining each demultiplexed sequence reads into a string which makes the next step (matching & counting) more faster. 24 input demultiplexed files were converted to 24 output string-files.  

#Fort: Match_Count.pl
There are 24 Match_Count.pl scripts. Each string replicate was run through its own match_count.pl script to save time and memory. In each script, the frequency of each unique DNA barcode that represents one mutant was counted and assigned to its mutant’s systematic name using regular expression (~//ig). 

#Finally: Assembling.pl 
#E_Assembling.pl script was created to bring all the counts for each mutant form 12 Counting-files of heterozygous profile while N_Assembling.pl script was created to bring all the counts for each mutant form 12 Counting-files of homozygous profile using hash function ($hash) where the key was the systematic name of the mutant and the values were the counts of that mutant throughout treatment (SH1009), positive control (MMS), and negative control (DMSO). 
