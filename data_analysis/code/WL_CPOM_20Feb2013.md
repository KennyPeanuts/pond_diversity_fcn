# Data for Wilkes Lake CPOM; 20 Feb 2013 Sampling

## Metadata

Collected by: Kenneth Fortino, Carly Martin, Leanna Tacik

Collected on: 20 Feb 2013

Affiliation: Longwood University

Location: Wilkes Lake, Farmville VA.  Samples were collected E of the island. 

Description: data represent the mass of OM fragments greater than 1mm for CPOM mass calculations removed from Ekman samples that were washed through 250 &mu;m mesh.

Created: 22 Feb 2013

Modified -

### Variables:

* lake = the name of the lake
    * WL = Wilkes Lake
    * LPP = Lancer Park Pond
* site = the relative location of the sample within the lake
    * littoral = near the shoreline ~ approx. 20 m from S shore
    * open = away from the shoreline ~ approx equidistant from N and S shore 
* depth = the depth of the water at the sampling site (m)
* repl = the replicate
* boat.num = the number identifying the weighboat
* boat.mass = the mass of the empty weighboat (g) 

## R Code

    lake <- rep("WL", 9)
    site <- c(rep("littoral", 3), rep("open", 3), rep("deep", 3))
    depth <- c(rep(1.9, 3), rep(2.0, 3), rep(NA, 3))
    repl <- rep(c("A", "B", "C"), 3)
    boat.num <- c(28, 53, 66, 27, 72, 57, NA, NA, NA)
    boat.mass <- c(1.9434, 1.8294, 1.8443, 1.6925, 1.8084, 1.7482, NA, NA, NA)
    WL.CPOM.20Feb2013 <- data.frame(lake, site, depth, repl, boat.num, boat.mass, stringsAsFactors = F)
    write.table(WL.CPOM.20Feb2013, "./data/WL_CPOM_20Feb2013.txt", quote=F, row.names=F)

## Output

    > WL.CPOM.20Feb2013
      lake     site depth repl boat.num boat.mass
    1   WL littoral   1.9    A       28    1.9434
    2   WL littoral   1.9    B       53    1.8294
    3   WL littoral   1.9    C       66    1.8443
    4   WL     open   2.0    A       27    1.6925
    5   WL     open   2.0    B       72    1.8084
    6   WL     open   2.0    C       57    1.7482
    7   WL     deep    NA    A       NA        NA
    8   WL     deep    NA    B       NA        NA
    9   WL     deep    NA    C       NA        NA
> 
