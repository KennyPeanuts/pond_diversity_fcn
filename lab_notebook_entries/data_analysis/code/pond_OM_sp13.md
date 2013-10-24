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
12 April 2013
31 May 2013
KF, added surface area estimates for the ponds

### Variables:

* lake = the name of the lake
    * WL = Wilkes Lake
    * LPP = Lance Park Pond

* sa = surface area (m^2^): estimated by measuring L X W on google maps

* samp = the type of sample
    * open = away from the shore
    * lit = littoral, near shore

* repl = the replicate

* depth = the water depth where the sample was collected (m)

* cruc.num = the name of the crucible

* cruc.mass = the mass of the empty crucible (g)

* cruc.sed = the mass of the crucuble and the dry sediment (g)

* cruc.ash = the mass of the crucible and ashed (550^o^ C for 4h) sediment (g)

* sed = the mass of the dry sediment in crucible (g)

* ash = the mass of the ashed sediment in crucible (g)

* OM = the mass of the organic matter in crucible (g)

* perc.OM = the percent organic matter in the sediment

* boat.bag.num = the name of the pre-weighed weighboat or paper pag

* boat.bag.mass = the mass of the empty weighboat or paper bag (g)

* boat.bag.CPOM = the mass of the weighboat + the dried CPOM (g)

* CPOM.ekman = the mass of the dry CPOM (g / 0.0225 m^2^)

* CPOM = the mass of the dry CPOM (g / m^2^)

## R Code

~~~~~~~~~~~~~~~~~~~~~~~~

# Import LOI data to add CPOM data

WL.LPP.LOI.sp13 <- read.delim("./data/WL_LPP_LOI_sp13.txt", header = T, sep = " ", stringsAsFactors = F)

# Create variable for CPOM
# note these data replace the data in WL_CPOM_20Feb2013.md

sa <- c(rep(194760, 6), rep(1395, 6))
boat.bag.num <- c(27, 72, 57, 28, 53, 66, 4, 5, 6, 1, 2, 3)
boat.bag.mass <- c(1.6925, 1.8084, 1.7482, 1.9434, 1.8294, 1.8443, 7.1048, 7.0473, 7.1103, 7.0334, 6.9891, 7.1693)
boat.bag.CPOM <- c(1.8544, 2.204, 2.0725, 2.4342, 2.4063, 2.5529, 12.3407, 9.0054, 8.4776, 36.5694, 12.7007, 23.0556)
CPOM.ekman <- boat.bag.CPOM - boat.bag.mass
# convert from g / 0.0225 m^2^ to g / m^2^
CPOM <- CPOM.ekman / 0.0225
# Create data.frame of all OM data from WL LPP spring 2013 sampling

WL.LPP.OM.sp13 <- data.frame(WL.LPP.LOI.sp13, sa, boat.bag.num, boat.bag.mass, boat.bag.CPOM, CPOM.ekman, CPOM)

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
     perc.OM boat.bag.num boat.bag.mass boat.bag.CPOM CPOM.ekman        CPOM
1   1.536393           27        1.6925        1.8544     0.1619    7.195556
2   4.652982           72        1.8084        2.2040     0.3956   17.582222
3   8.440886           57        1.7482        2.0725     0.3243   14.413333
4  10.150706           28        1.9434        2.4342     0.4908   21.813333
5   9.783739           53        1.8294        2.4063     0.5769   25.640000
6  10.173836           66        1.8443        2.5529     0.7086   31.493333
7  12.767336            4        7.1048       12.3407     5.2359  232.706667
8  11.444266            5        7.0473        9.0054     1.9581   87.026667
9  11.115778            6        7.1103        8.4776     1.3673   60.768889
10 15.269656            1        7.0334       36.5694    29.5360 1312.711111
11 11.994220            2        6.9891       12.7007     5.7116  253.848889
12 13.750000            3        7.1693       23.0556    15.8863  706.057778
>

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Analysis

### Relationship between CPOM, lake, and sample location

Due to non-homogeneity in the variance the CPOM mass was ln transformed

~~~~~~~~~~~~~~~~~~~~~~~~~

# SD in CPOM across samp
tapply((WL.LPP.OM.sp13$CPOM), WL.LPP.OM.sp13$samp, sd)
     lit     open 
522.8097  85.5926 

tapply(log(WL.LPP.OM.sp13$CPOM), WL.LPP.OM.sp13$samp, sd)
     lit     open 
1.815811 1.302288

# SD in CPOM across lake
tapply(WL.LPP.OM.sp13$CPOM, WL.LPP.OM.sp13$lake, sd)
       LPP         WL 
485.471298   8.574693

tapply(log(WL.LPP.OM.sp13$CPOM), WL.LPP.OM.sp13$lake, sd)
      LPP        WL 
1.1783661 0.5225174 

~~~~~~~~~~~~~~~~~~~~~~~~~~

After transformation the CPOM mass was significantly greater in LPP and in the littoral samples and there was no interaction between the factors.

~~~~~~~~~~~~~~~~

# 2-way ANOVA of CPOM mass ln transformed by lake * sample location

anova(lm(log(CPOM) ~ as.factor(lake) * as.factor(samp), data = WL.LPP.OM.sp13))

> anova(lm(log(CPOM) ~ as.factor(lake) * as.factor(samp), data = WL.LPP.OM.sp13))
Analysis of Variance Table

Response: log(CPOM)
                                Df  Sum Sq Mean Sq F value    Pr(>F)    
as.factor(lake)                  1 21.3718 21.3718 59.9653 5.516e-05 ***
as.factor(samp)                  1  4.7140  4.7140 13.2266  0.006619 ** 
as.factor(lake):as.factor(samp)  1  0.7427  0.7427  2.0838  0.186865    
Residuals                        8  2.8512  0.3564                      

jpeg("./output/plots/CPOM_by_lake_samp_sp13.jpg")
par(las = 1)
plot(log(CPOM) ~ as.factor(samp), data = WL.LPP.OM.sp13, subset = lake == "WL", ylim=c(0, 7), col = "green")
plot(log(CPOM) ~ as.factor(samp), data = WL.LPP.OM.sp13, subset = lake == "LPP", add = T, col = "brown")
legend(0.5, 1.5, c("WL", "LPP"), pch=16, col=c("green", "brown"))
dev.off()
pdf("./output/plots/CPOM_by_lake_samp_sp13.pdf")
plot(log(CPOM) ~ as.factor(samp), data = WL.LPP.OM.sp13, subset = lake == "WL", ylim=c(0, 7), col = "green")
plot(log(CPOM) ~ as.factor(samp), data = WL.LPP.OM.sp13, subset = lake == "LPP", add = T, col = "brown")
legend(0.5, 1.5, c("WL", "LPP"), pch=16, col=c("green", "brown"))
dev.off()

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![ln CPOM mass by lake and sample location, Spring 2013](../plots/CPOM_by_lake_samp_sp13.jpg)




