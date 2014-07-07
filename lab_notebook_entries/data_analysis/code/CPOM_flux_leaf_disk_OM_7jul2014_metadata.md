# Final Determination of the OM content of the leaf disks for the CPOM flux exp.

## Metadata

Collected by: KDP and KF

Collected on: 30 May 2014

Affiliation: Longwood University

Location: Longwood University

Description: 

* Senecent tulip poplar leaves were collected and air dried during the fall of 2013

* 5 leaves were each gently submerged in DI water for approx. 5 minutes to soften the leaf

* a 10 mm (#5) cork borer was used to cut a single leaf disk from each leaf, avoiding major veins

* each disk was placed in a pre-weighed crucible and dried at 50 dC, then ashed at 550 dC

* Note: BOD bottle #10 had a 3-4 instar Chironominae in it. We only recovered 17 leaf disks so the crucible #10 only had 9 leaf disks. Some leaf disks were almost completely skeletonized and others had chunks taken from them.

Created: 7 July 2014

Modified:

### Variables

#### Measured Variables

* rep = the replicate identifier

* cruc = the crucible identiying number

* cruc.mass = the mass of the empty crucible (g)

* cruc.leaf = the mass of the crucible plus the leaf disk drying at 50 dC (g)

* cruc.ash = the mass of the crucible plus the ash after 4 h at 550 dC (g)

#### Calculated Variables

* leaf = the dry mass of the leaf disk (g)

* ash = the mass of the ash after 4 h at 550 dC (g)

* prop.OM = the proportion of organic matter in the leaf disk

* AFDM = the ash free dry mass of the leaf disk


## R Code

    rep <- c(1:8)
    cruc <- c(17:24)
    cruc.mass <- c(30.5141, 29.4362, 28.5470, 29.1382, 31.0017, 26.9369, 28.8154, 29.3969)
    cruc.leaf <- c(30.5527, 29.4730, 28.5782, 29.1532, 31.0313, 26.9732, 28.8530, 29.4262)
    cruc.ash <- c(30.5309, 29.4472, 28.5577, 29.1441, 31.0130, 26.9480, 28.8266, 29.4053)

### Calculated Variables

    leaf <- cruc.leaf- cruc.mass
    ash <- cruc.ash - cruc.mass
    prop.OM <- 1 - (ash / leaf)
    AFDM <- leaf * prop.OM

    leafOM <- data.frame(rep, cruc, cruc.mass, cruc.leaf, cruc.ash, leaf, ash, prop.OM, AFDM)

## Output

    write.table(leafOM, "./data/CPOM_flux_leaf_disk_OM_7jul2014.txt", row.names = F, sep = "\t", quote = F) 
