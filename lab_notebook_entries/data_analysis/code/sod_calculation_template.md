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

    sod <- read.delim("./data/cpom_flux_sod_date.csv", header = T, stringsAsFactors = F, sep = ",")
    std <- read.delim("./data/winker_standardization_date.txt", header = T)
    vial <- read.delim("./data/vial_volume_summer_2014.txt", header = T)

### Calculated DO Concentration



