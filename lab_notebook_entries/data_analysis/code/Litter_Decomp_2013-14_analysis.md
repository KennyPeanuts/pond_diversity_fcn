# Data Analysis for the Litter Decomposition Experiment Winter 2013 - 2014

## Purpose

The experiment was to assess the loss of mass from leaves in 3 ponds in Farmville VA.

## Date

* Created 19 Feb 2014

* Modified 19 Feb 2014

## Author

KF

## Code

### Import Data

    leaf <- read.delim("./data/leaf_decomp_calc_2013-14.txt", header = T, stringsAsFactors = F)

### Calculate Percent Mass Remaining

#### Daulton Pond

    T0.DP <- mean(leaf$AFDM[leaf$lake == "Daulton Pond" & leaf$days == 0], na.rm = T)
    prop.rem.DP <- 1 - ((T0.DP - leaf$AFDM[leaf$lake == "Daulton Pond"]) / leaf$AFDM[leaf$lake == "Daulton Pond"])

#### Campus Pond

    T0.CP <- mean(leaf$AFDM[leaf$lake == "Campus Pond" & leaf$days == 0], na.rm = T)
    prop.rem.CP <- 1 - ((T0.DP - leaf$AFDM[leaf$lake == "Campus Pond"]) / leaf$AFDM[leaf$lake == "Campus Pond"])

#### Lancer Park Pond

    T0.LPP <- mean(leaf$AFDM[leaf$lake == "Lancer Park Pond" & leaf$days == 0], na.rm = T)
    prop.rem.LPP <- 1 - ((T0.DP - leaf$AFDM[leaf$lake == "Lancer Park Pond"]) / leaf$AFDM[leaf$lake == "Lancer Park Pond"])
