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

Modified: 17 April 2013

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
cerat.count <- c(0, 0, 5, 4, 7, 6, NA, NA, NA, NA, NA, NA)
tany.count <- c(25, 14, 23, 81, 29, 117, NA, NA, NA, NA, NA, NA)
chiro.count <- c(6, 5, 2, 0, 5, 0, NA, NA, NA, NA, NA, NA)
chaob.count <- c(5, 8, 15, 11, 16, 14, NA, NA, NA, NA, NA, NA)
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

   lake samp repl depth cerat.count tany.count chiro.count chaob.count    cerat
1    WL open    A   2.0           0         25           6           5   0.0000
2    WL open    B   2.0           0         14           5           8   0.0000
3    WL open    C   2.0           5         23           2          15 222.2222
4    WL  lit    A   1.9           4         81           0          11 177.7778
5    WL  lit    B   1.9           7         29           5          16 311.1111
6    WL  lit    C   1.9           6        117           0          14 266.6667
7   LPP open    A   1.0          NA         NA          NA          NA       NA
8   LPP open    B   1.0          NA         NA          NA          NA       NA
9   LPP open    C   1.0          NA         NA          NA          NA       NA
10  LPP  lit    A   1.1          NA         NA          NA          NA       NA
11  LPP  lit    B   1.1          NA         NA          NA          NA       NA
12  LPP  lit    C   1.1          NA         NA          NA          NA       NA
        tany     chiro    chaob     bugs
1  1111.1111 266.66667 222.2222 1600.000
2   622.2222 222.22222 355.5556 1200.000
3  1022.2222  88.88889 666.6667 2000.000
4  3600.0000   0.00000 488.8889 4266.667
5  1288.8889 222.22222 711.1111 2533.333
6  5200.0000   0.00000 622.2222 6088.889
7         NA        NA       NA       NA
8         NA        NA       NA       NA
9         NA        NA       NA       NA
10        NA        NA       NA       NA
11        NA        NA       NA       NA
12        NA        NA       NA       NA

~~~~

