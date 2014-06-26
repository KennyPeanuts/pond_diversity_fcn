# Analysis of the SOD results from the CPOM Flux Experiment - Summer 2014

## Purpose

This code it to analyze the water R data from the treatments with and without CPOM and/or nutrients

## Import data

    wR11 <- read.table("./data/waterR_calculation_11jun2014.csv", header = T, sep = ",")
    wR13 <- read.table("./data/waterR_calculation_13jun2014.csv", header = T, sep = ",")
    wR18 <- read.table("./data/waterR_calculation_18jun2014.csv", header = T, sep = ",")
    wR25 <- read.table("./data/waterR_calculation_25jun2014.csv", header = T, sep = ",")


## Data Analysis

### Get average from all dates

    sum.wR <- wR11$waterR + wR13$waterR + wR18$waterR + wR25$waterR
    wR.avg <- sum.wR / 4

