#!/bin/bash
cat ids.txt | while read LINE
do
curl -s "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&id=$LINE&retmode=xml"

xtract -pattern GBSeq -element GBSeq_accession-version,GBSeq_organism -division GBFeature -if GBFeature_key -equals tRNA -element GBFeature_key -group GBQualifier -if GBQualifier_name -starts-with product -or GBQualifier_name -contains transcription -element GBQualifier_value

echo "\n";
