# Analysis ofthe OM data from the spring/summer pond survey 2013

## Import data

    pond.OM <- read.delim("./data/Ponddata.txt", header = T, stringsAsFactors = F)

## Calculated variables

    sed.mass = pond.OM$cruc.sed - pond.OM$cruc.mass
    ash.mass = pond.OM$cruc.ash - pond.OM$cruc.mass
    perc.OM = ((sed.mass - ash.mass)/sed.mass)*100

### Variable descriptions

* sed.mass = the mass of the dry sediment sample from the ekman (g)

* ash.mass = the mass of the remaining material after >4 h at 550 dC (g)

* perc.OM = the percent organic matter in the sediment sample based on LOI

## Analysis

### CPOM summary

    summary(pond.OM$CPOM)

#### Output

~~~~

    summary(pond.OM$CPOM)
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
   3.356   15.100   30.700  196.000   83.450 2070.000

~~~~

### Standard Deviation of CPOM

    sd(pond.OM$CPOM)

#### Output

~~~~

[1] 422.8134

~~~~

### CPOM median by lake (g/m2)

    tapply(pond.OM$CPOM, pond.OM$Lake, median)
    tapply(pond.OM$CPOM[pond.OM$Sample == "Littoral"], pond.OM$Lake[pond.OM$Sample == "Littoral"], median)

#### Output

Whole Lake

~~~~~

>     tapply(pond.OM$CPOM, pond.OM$Lake, median)
       DL       LPP        WC        WL 
 42.05778 243.27778  23.66889  19.69778

~~~~

Littoral

~~~~

>     tapply(pond.OM$CPOM[pond.OM$Sample == "Littoral"], pond.OM$Lake[pond.OM$Sample == "Littoral"], median)
       DL       LPP        WC        WL 
 77.88667 706.05778  59.26444  25.64000 
    
~~~~
