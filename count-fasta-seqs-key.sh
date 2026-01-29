#!/bin/sh

# How this script should behave:
#
# INPUT:   Paths to one or more fasta sequence files
#
# OUTPUT:  For each file, it should write the number of sequences in the file
#          and the filename, and the total number of sequences across all files
#          at the end.
#
# EXAMPLE: In the same directory as this script, you should find an example
#          fasta file named 'example-seqs1.fasta', which contains:
#
#          >RMB3263_Cyrtodactylus_philippinicus_Negros
#          CGGGCCCATACCCCGAAAATGTTGGTATAAACCCCTTCCTATACTAATAAACCCCATTATTTGATCACTATTACTAAC
#          
#          >CWL052_Cyrtodactylus_philippinicus_Negros
#          CGGGCCCATACCCCGAAAATGTTGGTATAAACCCCTTCCTATACTAATAAACCCCATTATTTGATCACTATTACTAAC
#
#          If you run this script on this fasta file, you should get the
#          following output:          
#
#          $ sh count-fasta-seqs.sh example-seqs1.fasta
#          2 example-seqs1.fasta
#          2
#
#          There should be another example fasta file named
#          'example-seqs2.fasta', which contains:
#
#          >RMB7155_Sphenomorphus_arborens_Negros
#          ATGAACCCCATTATAACCTCCCTCATTTTATCAAGCCTGGCCCTTGGAACCGTAATCACACTAACAAGCTACCACTGA
#          
#          >RMB7156_Sphenomorphus_arborens_Negros
#          ATGAACCCCATTATAACCTCCCTCATTTTATCAAGCCTGGCCCTTGGAACCGTAATCACACTAACAAGCTACCACTGA
#          
#          >RMB7163_Sphenomorphus_arborens_Negros
#          ATGAACCCCATTATAACCTCCCTCATTTTATCAAGCCTGGCCCTTGGAACCGTAATCACACTAACAAGCTACCACTGA
#
#          If you run this script on BOTH fasta files, you should get the
#          following output:          
#
#          $ sh count-fasta-seqs.sh example-seqs1.fasta example-seqs2.fasta
#          2 example-seqs1.fasta
#          3 example-seqs2.fasta
#          5
#
#
# Your goal is to work collaboratively with ~ 3 other people to edit this
# script until it passes all the tests that have been written for it. I.e., you
# should be able to run:
#
#   $ sh run_tests.sh
#
# and see 'All tests passed!' at the bottom of the output.
#
# To do this, one member of your group should fork this repository, and add the
# other members as collaborators, so that all members of the team can be
# pulling and pushing changes to the script to the collaborative remote
# repository on Github.

total=0
for file_path in "$@"
do
    file_name="$(basename "$file_path")"
    seq_count="$(grep ">" "$file_path" | wc -l)"
    total="$(expr $total + $seq_count)"
    echo $seq_count $file_name
done
echo $total
