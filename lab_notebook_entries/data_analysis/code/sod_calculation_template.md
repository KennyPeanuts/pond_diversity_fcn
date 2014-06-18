# Calculation of sediment oxygen demand for the CPOM Flux Exp

## Date of Run 

INSERT DATE HERE

## Metadata

### Collected by:

AG, KP

### Created on:

### Modified:

### Affiliation:

Longwood University

### Description: 

The code for the calculation of sediment oxygen demand from the winkler titration data from the CPOM Flux Experiment

## R Code

### Import Data

    sod <- read.delim("./data/cpom_flux_sod_DATE.csv", header = T, stringsAsFactors = F, sep = ",")
    std <- read.delim("./data/winker_standardization_DATE.txt", header = T)
    repl <- read.delim("./data/repl_water_DATE.txt", header = T)
    vial <- read.delim("./data/vial_volume_summer_2014.txt", header = T)

###Calculations

    # DO Calculations
    ## Calculation of [DO] of T0 samples
    DOvol.T0 <- (((sod$RmeasT0 - std$Rblk) std$Vstd * std$Nstd * std$E)/(std$Rstd - std$Rblk) * (std$Vb - std$Vreg)) - std$DOreg
    ## Calculation of [DO] of TF samples
    DOvol.TF <- (((sod$RmeasTF - std$Rblk) std$Vstd * std$Nstd * std$E)/(std$Rstd - std$Rblk) * (std$Vb - std$Vreg)) - std$DOreg
    ## Calculation of replacement water [DO] no nutrients
    replDOvol0 <- (((repl$Rrepl0 - std$Rblk) std$Vstd * std$Nstd * std$E)/(std$Rstd - std$Rblk) * (std$Vb - std$Vreg)) - std$DOreg
    ## Calculation of the replacement water [DO] nutrients
    replDOvolN <- (((repl$RreplN - std$Rblk) std$Vstd * std$Nstd * std$E)/(std$Rstd - std$Rblk) * (std$Vb - std$Vreg)) - std$DOreg
    ## Convert from ml/L to mmol/L
    R <- 0.08205746 # ideal gas constant in (L atm)/(mol K)
    DOmmol.T0 <- (sod$pressure * DOvol.T0) / (R * sod$temp)
    DOmmol.TF <- (sod$pressure * DOvol.TF) / (R * sod$temp)
    replDOmmol0 <- (sod$pressure * replDOvol0) / (R * sod$temp)
    replDOmmolN <- (sod$pressure * replDOvolN) / (R * sod$temp)
    # SOD Calculations
    ## Calculation of T0 DO concentration
    DO.T0.0 <- (DOmmol.T0[sod$Nutrient == "no"] * (1 - (Replvol[sod$Nutrient == "no"] / BODwatervol[sod$Nutrient == "no"]))) + (replDOmmol0 * (Replvol[sod$Nutrient == "no"] / BODwatervol[sod$Nutrient == "no"]))
    DO.T0.N <- (DOmmol.T0[sod$Nutrient == "yes"] * (1 - (Replvol[sod$Nutrient == "yes"] / BODwatervol[sod$Nutrient == "yes"]))) + (replDOmmolN * (Replvol[sod$Nutrient == "yes"] / BODwatervol[sod$Nutrient == "yes"]))
    DO.T0 <- c(DO.T0.0, DO.T0.N)
    ## Calculation of mmols of oxygen in the bottles
    DOmmol.bot.T0 <- DO.T0 * sod$BODwatervol
    DOmmol.bot.TF <- DOmmol.TF * sod$BODwatervol
    ## Calculation of change in mmol DO during incubation
    dDO <- DOmmol.bot.T0 - DOmmol.bot.TF
    ## Normalize by sediment area --> convert to per m2
    mmolO2.m2 <- dDO / sod$A
    ## Convert times to POSIXlt standard
    t0 <- as.POSIXlt(time0)
    tF <- as.POSIXlt(timeF)
    ## Calculate the incubation hours
    incubation.h <- as.numeric(t
    ## Normalize by hours of incubation
    mmolO2.m2.h <- mmol.m2 / 
