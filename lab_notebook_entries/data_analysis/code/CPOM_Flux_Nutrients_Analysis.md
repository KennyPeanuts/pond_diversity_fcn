# Analysis of the Nutrient Data from CPOM Flux Exp.
## Summer 2014
## Metadata
* Code created: 20 Jan 2014
* Author: KF

## Purpose
These data were collected from the CPOM Flux Exp. to assess the effect of CPOM on the flux of nutrients across the sediment water interface.

## Import data

    nut <- read.table("./data/CPOM_Flux_Nutrients.csv", header = T, sep = ",")

## Initial Exploratory plots

    plot(NOx ~ DATE, data = nut, subset = CPOM == "0")
    plot(NOx ~ DATE, data = nut, subset = CPOM == "C")
    plot(NH3 ~ DATE, data = nut, subset = CPOM == "0")
    plot(NH3 ~ DATE, data = nut, subset = CPOM == "C")
    plot(NH3 ~ DATE, data = nut, subset = CPOM == "C")
    plot(P ~ DATE, data = nut, subset = CPOM == "0")
    plot(P ~ DATE, data = nut, subset = CPOM == "C")

These plots seem to indicate qulaitatively that the presence of CPOM affected the magnitide and timing of nutrient flux across the sediment water interface.