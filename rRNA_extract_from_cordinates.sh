#!/bin/bash
cat rRNA.bed | while read a b c
do
curl -s "https://www.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=$a&seq_start=$b&seq_stop=$c&rettype=fasta" >> result_rRNA_2_join.fasta
done;
