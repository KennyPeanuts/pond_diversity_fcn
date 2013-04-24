# Macroinvertebrate abundance data and analysis for WL and LPP

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

Back in the lab the CPOM was removed from the samples by washing through a 1 mm sieve.  Macroinvertebrates retained with this coarse fraction were removed from the CPOM by picking in a basin without magnification.  

The macroinvertebrates collected in the fine fraction were removed from the fine sediment under a dissecting scope.

Insects were identified to family (ceratopogonidae), subfamily (chironomidae) or genus (chaoborus).  

Oligochatetes were not identified or quantified and occurred mostly as fragments

Created: 17 April 2013

Modified:

18 April 2013 - added LPP data to bug dataset - KF

23 April 2013 - created data table of mean macroinvertebrate densities and the percent contribution of each taxa to the total density - KF

### Variables:

* lake = the name of the lake
    * WL = Wilkes Lake
    * LPP = Lance Park Pond

* samp = the type of sample
    * open = away from the shore
    * lit = littoral, near shore

* repl = the replicate

* depth = the water depth where the sample was collected (m)

* cerat.count = the number of Ceratopogonidae collected from a single Ekman

* tany.count = the number of Tanypodinae collected from a single Ekman

* chiro.count = the number of Chironominae collected from a single Ekman

* chaob.count = the number of Chaoborus collected from a single Ekman

* cerat = the density of Ceratopogonidae in n m^-2^

* tany = the density of Tanypodinae in n m^-2^

* chiro = the the density of Chironominae in n m^-2^

* chaob = the density of Chaoborus in n m^-2^

* bugs = the total macroinvertebrate density (omitting oligochaetes) in n m^-2^

## R Code

~~~~

# Generate Variables for data.frame

lake <- c(rep("WL", 6), rep("LPP", 6))
samp <- rep(c(rep("open", 3), rep("lit", 3)), 2)
repl <- rep(c("A", "B", "C"), 4)
depth <- c(rep(2.0, 3), rep(1.9, 3), rep(1.0, 3), rep(1.1, 3))
cerat.count <- c(0, 0, 5, 4, 7, 6, 0, 1, 0, 2, 0, 2)
tany.count <- c(25, 14, 23, 81, 29, 117, 5, 3, 1, 29, 20, 47)
chiro.count <- c(6, 5, 2, 0, 5, 0, 14, 4, 5, 5, 6, 41)
chaob.count <- c(5, 8, 15, 11, 16, 14, 0, 0, 0, 0, 0, 0)
# convert from count per ekman (n / 0.0225 m^2^) to densty (n / m^2^)
cerat <- cerat.count / 0.0225
tany <- tany.count / 0.0225
chiro <- chiro.count / 0.0225
chaob <- chaob.count / 0.0225
bugs <- cerat + tany + chiro + chaob
# create data.frame of macroinvertebrates for spring samples
WL.LPP.bugs.sp13 <- data.frame(lake, samp, repl, depth, cerat.count, tany.count, chiro.count, chaob.count, cerat, tany, chiro, chaob, bugs, stringsAsFactors = F)

# save data table

write.table(WL.LPP.bugs.sp13, file = "./data/WL_LPP_bugs_sp13.txt", row.names = F, quote = F)

~~~~

## Output

~~~~

   lake samp repl depth cerat.count tany.count chiro.count chaob.count
1    WL open    A   2.0           0         25           6           5
2    WL open    B   2.0           0         14           5           8
3    WL open    C   2.0           5         23           2          15
4    WL  lit    A   1.9           4         81           0          11
5    WL  lit    B   1.9           7         29           5          16
6    WL  lit    C   1.9           6        117           0          14
7   LPP open    A   1.0           0          5          14           0
8   LPP open    B   1.0           1          3           4           0
9   LPP open    C   1.0           0          1           5           0
10  LPP  lit    A   1.1           2         29           5           0
11  LPP  lit    B   1.1           0         20           6           0
12  LPP  lit    C   1.1           2         47          41           0
       cerat       tany      chiro    chaob      bugs
1    0.00000 1111.11111  266.66667 222.2222 1600.0000
2    0.00000  622.22222  222.22222 355.5556 1200.0000
3  222.22222 1022.22222   88.88889 666.6667 2000.0000
4  177.77778 3600.00000    0.00000 488.8889 4266.6667
5  311.11111 1288.88889  222.22222 711.1111 2533.3333
6  266.66667 5200.00000    0.00000 622.2222 6088.8889
7    0.00000  222.22222  622.22222   0.0000  844.4444
8   44.44444  133.33333  177.77778   0.0000  355.5556
9    0.00000   44.44444  222.22222   0.0000  266.6667
10  88.88889 1288.88889  222.22222   0.0000 1600.0000
11   0.00000  888.88889  266.66667   0.0000 1155.5556
12  88.88889 2088.88889 1822.22222   0.0000 4000.0000
>

~~~~

## Analysis

### Macroinvertebrate  Presentation Table for Carly's Poster

The following code is to generate a table of the mean density of the different macroinvertebrate taxa in each of the lakes and sampled locations.

#### Metadata

* lake = the name of the lake (as above)
* samp = the location of the sample (as above)
* tany.mean = the mean density of tanypodinae (num m^-2)
* tany.sd = the standard deviation of tany.mean
* cerat.mean = the mean density of ceratopogonidae (num m^-2)
* cerat.sd = the standard deviation of cerat.mean
* chiro.mean = the mean density of chironiminae (num m^-2)
* chiro.sd = the standard deviation of chiro.mean
* chaob.mean = the mean density of chaoborus (num m^-2)
* chaob.sd = the standard deviation of chaob.mean
* bugs.mean = the mean density of all the collected and enumerated macroinvertebrates (excludes oligocheates) (num m^-2)
* bugs.sd = the standard deviation of bugs.mean
* tany.perc = the percentage of the total macroinvertebrate density (bugs.mean) that is made up of tanypodinae
* cerat.perc = the percentage of the total macroinvertebrate density (bugs.mean) that is made up of ceratopogonidae
* chiro.perc = the percentage of the total macroinvertebrate density (bugs.mean) that is made up of chironominae
* chaob.perc = the percentage of the total macroinvertebrate density (bugs.mean) that is made up of chaoborus

~~~~

# Calculate Mean Density and SD for each taxon in each sampling location and lake
## Wilkes Lake
## tany
tapply(WL.LPP.bugs.sp13$tany[WL.LPP.bugs.sp13$lake == "WL"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "WL"], mean)
tapply(WL.LPP.bugs.sp13$tany[WL.LPP.bugs.sp13$lake == "WL"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "WL"], sd)
# cerat
tapply(WL.LPP.bugs.sp13$cerat[WL.LPP.bugs.sp13$lake == "WL"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "WL"], mean)
tapply(WL.LPP.bugs.sp13$cerat[WL.LPP.bugs.sp13$lake == "WL"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "WL"], sd)
# chiro
tapply(WL.LPP.bugs.sp13$chiro[WL.LPP.bugs.sp13$lake == "WL"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "WL"], mean)
tapply(WL.LPP.bugs.sp13$chiro[WL.LPP.bugs.sp13$lake == "WL"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "WL"], sd)
# chaob
tapply(WL.LPP.bugs.sp13$chaob[WL.LPP.bugs.sp13$lake == "WL"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "WL"], mean)
tapply(WL.LPP.bugs.sp13$chaob[WL.LPP.bugs.sp13$lake == "WL"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "WL"], sd)
# bugs
tapply(WL.LPP.bugs.sp13$bugs[WL.LPP.bugs.sp13$lake == "WL"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "WL"], mean)
tapply(WL.LPP.bugs.sp13$bugs[WL.LPP.bugs.sp13$lake == "WL"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "WL"], sd)
## Lancer Park Pond
## tany
tapply(WL.LPP.bugs.sp13$tany[WL.LPP.bugs.sp13$lake == "LPP"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "LPP"], mean)
tapply(WL.LPP.bugs.sp13$tany[WL.LPP.bugs.sp13$lake == "LPP"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "LPP"], sd)
# cerat
tapply(WL.LPP.bugs.sp13$cerat[WL.LPP.bugs.sp13$lake == "LPP"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "LPP"], mean)
tapply(WL.LPP.bugs.sp13$cerat[WL.LPP.bugs.sp13$lake == "LPP"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "LPP"], sd)
# chiro
tapply(WL.LPP.bugs.sp13$chiro[WL.LPP.bugs.sp13$lake == "LPP"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "LPP"], mean)
tapply(WL.LPP.bugs.sp13$chiro[WL.LPP.bugs.sp13$lake == "LPP"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "LPP"], sd)
# chaob
tapply(WL.LPP.bugs.sp13$chaob[WL.LPP.bugs.sp13$lake == "LPP"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "LPP"], mean)
tapply(WL.LPP.bugs.sp13$chaob[WL.LPP.bugs.sp13$lake == "LPP"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "LPP"], sd)
# bugs
tapply(WL.LPP.bugs.sp13$bugs[WL.LPP.bugs.sp13$lake == "LPP"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "LPP"], mean)
tapply(WL.LPP.bugs.sp13$bugs[WL.LPP.bugs.sp13$lake == "LPP"], WL.LPP.bugs.sp13$samp[WL.LPP.bugs.sp13$lake == "LPP"], sd)

## Generate data.frame

lake <- c("WL", "WL", "LPP", "LPP")
samp <- c("open", "lit", "open", "lit")
tany.mean <- c(919, 3363, 133, 1422)
tany.sd <- c(260, 1966, 89, 611)
cerat.mean <- c(74, 252, 15, 59)
cerat.sd <- c(128, 68, 26, 51)
chiro.mean <- c(193, 74, 341, 770)
chiro.sd <- c(92, 128, 245, 911)
chaob.mean <- c(415, 607, 0, 0)
chaob.sd <- c(228, 112, NA, NA)
bugs.mean <- c(1600, 4296, 489, 2251)
bugs.sd <- c(400, 1778, 311, 1530)
tany.perc <- (tany.mean / bugs.mean) * 100
cerat.perc <- (cerat.mean / bugs.mean) * 100
chiro.perc <- (chiro.mean / bugs.mean) * 100
chaob.perc <- (chaob.mean / bugs.mean) * 100

# Create data frame
WL.LPP.meanBugs.sp13 <- data.frame(lake, samp, tany.mean, tany.sd, cerat.mean, cerat.sd, chiro.mean, chiro.sd, chaob.mean, chaob.sd, bugs.mean, bugs.sd, tany.perc, cerat.perc, chiro.perc, chaob.perc)

# Create output table
write.table(WL.LPP.meanBugs.sp13, file = "./data/WL_LPP_meanBugs_sp13.txt", row.names = F, quote = F)

~~~~

## Output

~~~~

> WL.LPP.meanBugs.sp13
  lake samp tany.mean tany.sd cerat.mean cerat.sd chiro.mean chiro.sd
1   WL open       919     260         74      128        193       92
2   WL  lit      3363    1966        252       68         74      128
3  LPP open       133      89         15       26        341      245
4  LPP  lit      1422     611         59       51        770      911
  chaob.mean chaob.sd bugs.mean bugs.sd tany.perc cerat.perc chiro.perc
1        415      228      1600     400  57.43750   4.625000  12.062500
2        607      112      4296    1778  78.28212   5.865922   1.722533
3          0       NA       489     311  27.19836   3.067485  69.734151
4          0       NA      2251    1530  63.17192   2.621057  34.207019
  chaob.perc
1   25.93750
2   14.12942
3    0.00000
4    0.00000

~~~~
