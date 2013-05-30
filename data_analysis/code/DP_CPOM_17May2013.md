# CPOM Data on Daulton Pond 13 May 2013 Sampling

## Metadata

Collected by: Kenneth Fortino and Leanna Tacik

Collected on: 13 May 2013

Affiliation: Longwood University

Location: Daulton Pond, Farmville, VA.  The pond is N of Milnwood Rd, opposite Scott Dr.

Description: 

* Data represent the mass of CPOM fragments greater than 1mm for CPOM
mass calculations removed from Ekman samples that were washed through
250 &mu;m mesh.
* CPOM dried at 50^o^ C. 


Created: 30 May 2013

Modified:

### Variables:

* lake = the abbreviated name of the lake
    * DP = Daulton Pond

* samp = the type of sample collected
    * open = away from shore
    * lit = littoral, approx 10 m from shore

* depth = the water depth at the sample location (m)

* repl = the replicate code

* dish.bag.mass = the initial mass of the weighing dish or paper bag (g)

* dish.bag.OM = the mass of the weighing dish or bag + the mass of the dried CPOM (g)

* CPOM.ekman = the mass of the CPOM in the ekman sample (g (0.0225 m)^-2^)

* CPOM = the mass of the CPOM normalized to a sq meter (g m^-2^)

## R Code

~~~~~~~~
# Generate Variable and Enter Data

lake <- rep("DP", 12)
samp <- c(rep("open", 6), rep("lit", 6))
site <- rep(c(rep("A", 2), rep("B", 2), rep("C", 2)), 2)
depth <- c(3.2, 3.2, 3.1, 3.1, 1.9, 1.9, 1.5, 1.5, 0.9, 0.9, 1.5, 1.5)
repl <- rep(c(1, 2), 6)
dish.bag.mass <- c(7.0536, 7.0629, 7.0574, 7.0600, 7.0584, 7.0614, 7.0620, 7.0642, 7.1773, 7.2978, 7.0605, 7.0561)
dish.bag.OM <- c(7.4395, 7.7112, 7.5408, 7.5414, 7.3178, 7.2328, 8.3886, 8.5745, NA, NA, 9.0551, 8.3004)
CPOM.ekman <- dish.bag.OM - dish.bag.mass
CPOM <- CPOM.ekman / 0.0225

# Create Data Frame for DP CPOM

DP.CPOM <- data.frame(lake, samp, site, depth, repl, dish.bag.mass, dish.bag.OM, CPOM.ekman, CPOM, stringsAsFactors = F)

# Save data table

write.table(DP.CPOM, file = "./data/DP_CPOM_13May2013.txt", row.names = F, quote = F, sep = "\t")

## Output

> DP.CPOM
   lake samp site depth repl dish.bag.mass dish.bag.OM CPOM.ekman      CPOM
1    DP open    A   3.2    1        7.0536      7.4395     0.3859 17.151111
2    DP open    A   3.2    2        7.0629      7.7112     0.6483 28.813333
3    DP open    B   3.1    1        7.0574      7.5408     0.4834 21.484444
4    DP open    B   3.1    2        7.0600      7.5414     0.4814 21.395556
5    DP open    C   1.9    1        7.0584      7.3178     0.2594 11.528889
6    DP open    C   1.9    2        7.0614      7.2328     0.1714  7.617778
7    DP  lit    A   1.5    1        7.0620      8.3886     1.3266 58.960000
8    DP  lit    A   1.5    2        7.0642      8.5745     1.5103 67.124444
9    DP  lit    B   0.9    1        7.1773          NA         NA        NA
10   DP  lit    B   0.9    2        7.2978          NA         NA        NA
11   DP  lit    C   1.5    1        7.0605      9.0551     1.9946 88.648889
12   DP  lit    C   1.5    2        7.0561      8.3004     1.2443 55.302222
> 
