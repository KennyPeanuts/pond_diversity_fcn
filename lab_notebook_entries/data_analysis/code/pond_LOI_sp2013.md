# LOI data for WL and LPP 

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

Sediment samples were collected with an Ekman dredge. The samples were placed in a plastic basin and gently homogenized.  A 20 ml glass scintillation vial was used to collect the homogenized sediment.  The collected sediments were then dried at 50~o~ C until being processed for LOI on 11 April 2013.

The samples were processed for LOI by transferring most of the sample to a pre-weighed ceramic crucible and then ashing at 550~o~ C for 4h 5m.  The samples were removed from the furnace and weighed before they cooled to room temperature to prevent the condensation of water vapor on the samples.

Created: 11 April 2013

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

## R Code

### Data

    lake <- c(rep("WL", 6), rep("LPP", 6))
    samp <- rep(c(rep("open", 3), rep("lit", 3)), 2)
    repl <- rep(c("A", "B", "C"), 4)
    depth <- c(rep(2.0, 3), rep(1.9, 3), rep(1.0, 3), rep(1.1, 3))
    cruc.num <- 1:12
    cruc.mass <- c(13.1339, 12.6351, 13.0659, 12.2410, 12.9951, 11.9876, 12.1973, 12.5987, 11.6665, 12.9349, 11.8880, 11.7819)
    cruc.sed <- c(16.1084, 16.9807, 14.1274, 13.4951, 14.9187, 13.2359, 13.1231, 14.3463, 13.0951, 13.5505, 12.7876, 12.1739)
    cruc.ash <- c(16.0627, 16.7785, 14.0378, 13.3678, 14.7305, 13.1089, 13.0049, 14.1463, 12.9363, 13.4565, 12.6797, 12.1200)

### Calculated Variables

    sed <- cruc.sed - cruc.mass
    ash <- cruc.ash - cruc.mass
    OM <- sed - ash
    perc.OM <- (OM / sed) * 100
    
### Dataframe

    WL.LPP.LOI.sp13 <- data.frame(lake, samp, repl, depth, cruc.num, cruc.mass, cruc.sed, cruc.ash, sed, ash, perc.OM)
    write.table(WL.LPP.LOI.sp13, file = "./data/WL_LPP_LOI_sp13.txt", quote = F, row.names = F)

#### WL.LPP.LOI.sp13

~~~~~~~~~~~~~~~~~

> WL.LPP.LOI.sp13
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
     perc.OM
1   1.536393
2   4.652982
3   8.440886
4  10.150706
5   9.783739
6  10.173836
7  12.767336
8  11.444266
9  11.115778
10 15.269656
11 11.994220
12 13.750000

~~~~~~~~~~~~~~~~~~~
### Analysis

LPP has more organic matter in the sediments than WL and across lakes there is more organic matter in the littoral samples and no interaction between sample and lake.

~~~~~~~~~~~~~
anova(lm(perc.OM ~ lake * samp, data = WL.LPP.LOI.sp13))

> anova(lm(perc.OM ~ lake * samp, data = WL.LPP.LOI.sp13))
Analysis of Variance Table

Response: perc.OM
          Df Sum Sq Mean Sq F value   Pr(>F)   
lake       1 83.228  83.228 21.5412 0.001663 **
samp       1 37.328  37.328  9.6614 0.014483 * 
lake:samp  1  7.989   7.989  2.0679 0.188375   
Residuals  8 30.909   3.864                    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

par(las=1)
pdf("./output/plots/percOM_by_lake_samp_sp13.pdf")
jpeg("./output/plots/percOM_by_lake_samp_sp13.jpg")
plot(perc.OM ~ samp, data = WL.LPP.LOI.sp13, subset = lake == "WL", ylim = c(0, 20), col = 3)
plot(perc.OM ~ samp, data = WL.LPP.LOI.sp13, subset = lake == "LPP", col = "brown", add = T)
legend(2, 20, c("WL", "LPP"), pch = 16, col = c(3, "brown"))
dev.off()

~~~~~~~~~~~~~~~~~~

![Figure: Percent OM of littoral and open sediment in LPP and WL](../plots/percOM_by_lake_samp_sp13.jpg)


