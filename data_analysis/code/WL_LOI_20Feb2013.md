# Data for Wilkes Lake LOI; 20 Feb 2013 Sampling

## Metadata

Collected by: Kenneth Fortino, Carly Martin, Leanna Tacik

Collected on: 20 Feb 2013

Affiliation: Longwood University

Location: Wilkes Lake, Farmville VA.  Samples were collected E of the island. 

Description: data represent the mass of sediments for LOI calculations from Ekman samples.

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
* vial.mass = the mass of the empty scintilation vial (g) 

## R Code

    lake <- rep("WL", 9)
    site <- c(rep("littoral", 3), rep("open", 3), rep("deep", 3))
    depth <- c(rep(1.9, 3), rep(2.0, 3), rep(NA, 3))
    repl <- rep(c("A", "B", "C"), 3)
    vial.mass <- c(13.1875, 13.2355, 13.3609, 13.2247, 13.2464, 13.3428, 13.2874, 13.2378, 13.4083)
    WL.LOI.20Feb2013 <- data.frame(lake, site, depth, repl, vial.mass, stringsAsFactors = F)
    write.table(WL.LOI.20Feb2013, "./data/WL_LOI_20Feb2013.txt", quote=F, row.names=F)

## Output

    > WL.LOI.20Feb2013
      lake     site depth repl vial.mass
    1   WL littoral   1.9    A   13.1875
    2   WL littoral   1.9    B   13.2355
    3   WL littoral   1.9    C   13.3609
    4   WL     open   2.0    A   13.2247
    5   WL     open   2.0    B   13.2464
    6   WL     open   2.0    C   13.3428
    7   WL     deep    NA    A   13.2874
    8   WL     deep    NA    B   13.2378
    9   WL     deep    NA    C   13.4083
  
