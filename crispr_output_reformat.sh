OUTPUT=$(cat $1 | awk 'NR > 16' | sed 's/=//g' | sed 's/#//g' | sed 's/Crispr_begin_position://g' | sed 's/DR://g' | sed 's/Spacer_begin_position//g' | sed 's/Spacer_length//g' | sed 's/Spacer_sequence//g' | awk '{print $1"\t"$2"\t"$3}')
cas_seq=$(echo "$OUTPUT" | awk 'FNR == 1 {print $1}')
cas_len=$(echo "$OUTPUT" | awk 'FNR == 1 {$3=($3+1); print $3}')
echo "$OUTPUT" | sed ':a;N;$!ba;s/\t\n/ /g'  | awk 'BEGIN {a=c=0}NR > 3 {a=(($1-b)); c=(($1+$2)); print a"\t"$1"\t"s"\t"$1"\t"c"\t"$3}' b="$cas_len" s="$cas_seq" | sed '$ d' | cat -n
