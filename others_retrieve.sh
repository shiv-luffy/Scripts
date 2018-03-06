#!/bin/bash
cat ids_to_test.txt | while read LINE
do
curl -s "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&id=$LINE&retmode=xml" > newdata.txt
exec 3<> filtered.txt
xsltproc --novalid otransform.xsl - < newdata.txt >> filtered.txt
echo "" >> filtered.txt
exec 3>&-
done;
