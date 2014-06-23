# Analysis of the SOD results from the CPOM Flux Experiment - Summer 2014

## Purpose

This code it to analyze the SOD data from the treatments with and without CPOM and/or nutrients

## Import data

    sod10jun <- read.table("./data/sod_calculation_10jun2014.csv", header = T, sep = ",")
    sod12jun <- read.table("./data/sod_calculation_12jun2014.csv", header = T, sep = ",")
    sod17jun <- read.table("./data/sod_calculation_17jun2014.csv", header = T, sep = ",")
    bottleOM <- read.table("./data/CPOM_flux_bottleOM_initial.csv", header = T, sep = ",")

## Data Analysis

