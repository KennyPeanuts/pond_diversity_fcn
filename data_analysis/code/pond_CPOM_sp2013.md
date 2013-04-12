# CPOM Mass Data and Analysis for WL and LPP

## Metadata

Collected by: Kenneth Fortino, Leanna Tacik, and Carly Martin

Collected on: 

* Wilkes Lake - 20 Feb 2013
* Lancer Park Pond - 20 March 2013

Affiliation: Longwood University

Location:

* Wilkes Lake - Samples were collected to the E of the island approximately equidistant from the N and S shore of the lake and about 20 m from the S shore.
* Lancer Park Pond - Samples were collected in the approximate middle of the lake and in the SW corner of the pond about 1 m from the S shore

Description:

Three replicate samples were collected with an Ekman dredge and then washed through a 250&mu;m mesh in the field and preserved in 70% ethanol. 

Back in the lab the preserved samples were washed through a 1 mm sieve.  For WL the material retained by the sieve was dried in a pre-weighed weigh boat at 50~o~ C for at least 48h before massing.  For LPP the material retained by the sieve was collected in a pre-weighed paper lunch bag and dried for at least 48 h before massing.

Created: 12 April 2013

Modified:

### Variables:

* lake = the name of the lake
    * WL = Wilkes Lake
    * LPP = Lance Park Pond

* samp = the type of sample
    * open = away from the shore
    * lit = littoral, near shore

* repl = the replicate

* depth = the water depth where the sample was collected (m)

* cruc.num = the name of the crucible

* cruc.mass = the mass of the empty crucible (g)

* cruc.sed = the mass of the crucuble and the dry sediment (g)

* cruc.ash = the mass of the crucible and ashed (550~o~ C for 4h) sediment (g)

* sed = the mass of the dry sediment (g)

* ash = the mass of the ashed sediment (g)

* OM = the mass of the organic matter (g)

* perc.OM = the percent organic matter in the sediment

* boat.bag.num = the name of the pre-weighed weighboat or paper pag

* boat.bag.mass = the mass of the empty weighboat or paper bag (g)

* boat.bag.CPOM = the mass of the weighboat + the dried CPOM (g)

* CPOM = the mass of the dry CPOM (g)

## R Code

~~~~~~~~~~~~~~~~~~~~~~~~

# Import LOI data to add CPOM data

WL.LPP.LOI.sp13 <- read.delim("./data/WL_LPP_LOI_sp13.txt", header = T, sep = " ", stringsAsFactors = F)

# Create variable for CPOM
# note these data replace the data in WL_CPOM_20Feb2013.md

boat.bag.num <- c(27, 72, 57, 28, 53, 66, 4, 5, 6, 1, 2, 3)
boat.bag.mass <- c(1.6925, 1.8084, 1.7482, 1.9434, 1.8294, 1.8443, 7.1048, 7.0473, 7.1103, 7.0334, 6.9891, 7.1693)
boat.bag.CPOM <- c(1.8544, 2.204, 2.0725, 2.4342, 2.4063, 2.5529, 12.3407, 9.0054, 8.4776, 36.5694, 12.7007, 23.0556)
CPOM <- boat.bag.CPOM - boat.bag.mass

# Create data.frame of all OM data from WL LPP spring 2013 sampling

WL.LPP.OM.sp13 <- data.frame(WL.LPP.LOI.sp13, boat.bag.num, boat.bag.mass, boat.bag.CPOM, CPOM)

# Save data table

write.table(WL.LPP.OM.sp13, file = "./data/WL_LPP_OM_sp13.txt", row.names = F, quote = F)

~~~~~~~~~~~~~~~~~~~~~~~~

## Data

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

> WL.LPP.OM.sp13
   lake samp repl depth cruc.num cruc.mass cruc.sed cruc.ash    sed    ash
1    WL open    A   2.0        1   13.1339  16.1084  16.0627 2.9745 2.9288
2    WL open    B   2.0        2   12.6351  16.9807  16.7785 4.3456 4.1434
3    WL open    C   2.0        3   13.0659  14.1274  14.0378 1.0615 0.9719
4    WL  lit    A   1.9        4   12.2410  13.4951  13.3678 1.2541 1.1268
5    WL  lit    B   1.9        5   12.9951  14.9187  14.7305 1.9236 1.7354
6    WL  lit    C   1.9        6   11.9876  13.2359  13.1089 1.2483 1.1213
7   LPP open    A   1.0        7   12.1973  13.1231  13.0049 0.9258 0.8076
8   LPP open    B   1.0        8   12.5987  14.3463  14.1463 1.7476 1.5476
9   LPP open    C   1.0        9   11.6665  13.0951  12.9363 1.4286 1.2698
10  LPP  lit    A   1.1       10   12.9349  13.5505  13.4565 0.6156 0.5216
11  LPP  lit    B   1.1       11   11.8880  12.7876  12.6797 0.8996 0.7917
12  LPP  lit    C   1.1       12   11.7819  12.1739  12.1200 0.3920 0.3381
     perc.OM boat.bag.num boat.bag.mass boat.bag.CPOM    CPOM
1   1.536393           27        1.6925        1.8544  0.1619
2   4.652982           72        1.8084        2.2040  0.3956
3   8.440886           57        1.7482        2.0725  0.3243
4  10.150706           28        1.9434        2.4342  0.4908
5   9.783739           53        1.8294        2.4063  0.5769
6  10.173836           66        1.8443        2.5529  0.7086
7  12.767336            4        7.1048       12.3407  5.2359
8  11.444266            5        7.0473        9.0054  1.9581
9  11.115778            6        7.1103        8.4776  1.3673
10 15.269656            1        7.0334       36.5694 29.5360
11 11.994220            2        6.9891       12.7007  5.7116
12 13.750000            3        7.1693       23.0556 15.8863
> 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Analysis

### Relationship between CPOM, lake, and sample location

~~~~~~~~~~~~~~~~~~~~~~~~~

anova(lm(CPOM ~ as.factor(lake) * as.factor(samp), data = WL.LPP.OM.sp13))

plot(CPOM ~ as.factor(samp), data = WL.LPP.OM.sp13, subset = lake == "WL", ylim = c(0, 30))

plot(CPOM ~ as.factor(samp), data = WL.LPP.OM.sp13, subset = lake == "LPP", add = T)
