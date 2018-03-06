BEGIN {OFS = "\t"}{i=7;
        while(i<NF){
                a=i; b=i+1 ; c=i+2;
                split($a, x, ",");
                split($b, y, ",");
                split($c, z, ",");
		for (j = 1; j < 5; j++) {
			if(y[j]>5) {
				$a = x[j];
                                $b = y[j];
                                $c = z[j];
				}
}
i+=4;}
print}
