#!/bin/bash
cat data_genome_table.csv | awk -F "\t" '{print $1 $5}' |while read m p; do
       len=$(echo $p | sed 's/N//g' | tr -d '\n' | wc -c)
       cntA=$(echo $p | grep -oh 'A\|a' | tr -d '\n' | wc -c)
       cntT=$(echo $p | grep -oh 'T\|t' | tr -d '\n' | wc -c)
       cntG=$(echo $p | grep -oh 'G\|g' | tr -d '\n' | wc -c)
       cntC=$(echo $p | grep -oh 'C\|c' | tr -d '\n' | wc -c)
       cntGC=$(echo $p | grep -oh 'C\|G\|g\|c' | tr -d '\n' | wc -c)
       cntAT=$(echo $p | grep -oh 'A\|T\|a\|t' | tr -d '\n' | wc -c)
       ap=$(awk "BEGIN {printf \"%.2f\",(${cntA}/${len})*100}")
       tp=$(awk "BEGIN {printf \"%.2f\",(${cntT}/${len})*100}")
       gp=$(awk "BEGIN {printf \"%.2f\",(${cntG}/${len})*100}")
       cp=$(awk "BEGIN {printf \"%.2f\",(${cntC}/${len})*100}")
       apkb=$(awk "BEGIN {printf \"%.0f\",(${cntA}/${len})*1000}")
       tpkb=$(awk "BEGIN {printf \"%.0f\",(${cntT}/${len})*1000}")
       gpkb=$(awk "BEGIN {printf \"%.0f\",(${cntG}/${len})*1000}")
       cpkb=$(awk "BEGIN {printf \"%.0f\",(${cntC}/${len})*1000}")
       gc=$(awk "BEGIN {printf \"%.2f\",(${cntGC}/${len})*100}")
       at=$(awk "BEGIN {printf \"%.2f\",(${cntAT}/${len})*100}")
       gckb=$(awk "BEGIN {printf \"%.0f\",(${cntGC}/${len})*1000}")
       atkb=$(awk "BEGIN {printf \"%.0f\",(${cntAT}/${len})*1000}")
       gcS=$(awk "BEGIN {printf \"%.3f\",(${cntG} - ${cntC})/(${cntG} + ${cntC})}")
       atS=$(awk "BEGIN {printf \"%.3f\",(${cntA} - ${cntT})/(${cntA} + ${cntT})}")
data=$(printf "$m\t$cntA\t$cntT\t$cntG\t$cntC\t$gc\t$at\t$ap\t$tp\t$gp\t$cp\t$apkb\t$tpkb\t$gpkb $cpkb\t$gckb\t$atkb\t$gcS\t$atS")
echo $data
done
