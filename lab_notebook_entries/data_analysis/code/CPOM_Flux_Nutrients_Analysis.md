# Analysis of the Nutrient Data from CPOM Flux Exp.
## Summer 2014
## Metadata
* Code created: 20 Jan 2014
* Author: KF

* Modified: 3 Feb 2015 - KF - add code to calculate flux

## Purpose
These data were collected from the CPOM Flux Exp. to assess the effect of CPOM on the flux of nutrients across the sediment water interface.

## Import data

    nut <- read.table("./data/CPOM_Flux_Nutrients.csv", header = T, sep = ",")

## Initial Exploratory plots

    plot(NOx ~ DATE, data = nut, subset = CPOM == "0")
    plot(NOx ~ DATE, data = nut, subset = CPOM == "C", add = T, col = 2)
    
    plot(NOx ~ DATE, data = nut, subset = CPOM == "0" & NUTS == "0")
    plot(NOx ~ DATE, data = nut, subset = CPOM == "C" & NUTS == "0", add = T, col = 2)
    plot(NOx ~ DATE, data = nut, subset = CPOM == "0" & NUTS == "N")
    plot(NOx ~ DATE, data = nut, subset = CPOM == "C" & NUTS == "N", add = T, col = 2)
    
    plot(NH3 ~ DATE, data = nut, subset = CPOM == "C")
    plot(NH3 ~ DATE, data = nut, subset = CPOM == "C")
    plot(P ~ DATE, data = nut, subset = CPOM == "0")
    plot(P ~ DATE, data = nut, subset = CPOM == "C")

These plots seem to indicate qulaitatively that the presence of CPOM affected the magnitide and timing of nutrient flux across the sediment water interface.

## Flux Calculations

To calculate the flux:

1) determine the initial nutrient concentration of the bottle at the time period by calculating the dilution due to the replacement water.

### R Code

#### 12 June

Calculation of the sediment nutrient flux in the unenriched samples from initiation to 12 June.  Since we do not have the nutrient data from 10 June, I am using the replacement water values as initial value.
     
     # positive numbers = an increase in water nutrient concentratio = a flux from the sediments
     NOx.flux.12Jun.C <-  nut$NOx[nut$BOD != "RW0" & nut$DATE == "12-Jun" & nut$NUTS == "0"] - nut$NOx[nut$BOD == "RW0" & nut$DATE == "10-Jun"]  
     NH3.flux.12Jun.C <-  nut$NH3[nut$BOD != "RW0" & nut$DATE == "12-Jun" & nut$NUTS == "0"] - nut$NH3[nut$BOD == "RW0" & nut$DATE == "10-Jun"]
     P.flux.12Jun.C <-  nut$P[nut$BOD != "RW0" & nut$DATE == "12-Jun" & nut$NUTS == "0"] - nut$P[nut$BOD == "RW0" & nut$DATE == "10-Jun"]
     CPOM.0 <- nut$CPOM[nut$BOD != "RW0" & nut$DATE == "12-Jun" & nut$NUTS == "0"]
     flux.12Jun.C <- data.frame(CPOM.0, NOx.flux.12Jun.C, NH3.flux.12Jun.C, P.flux.12Jun.C )
     names(flux.12Jun.C) <- c("CPOM", "NOx", "NH3", "P")
     
##### Output

~~~~

> flux.12Jun.C
  CPOM    NOx    NH3      P
1    C  0.034  0.009  0.001
2    0  5.381 -0.064  0.022
3    0  5.757  0.168  0.014
4    C  0.110  0.091  0.024
5    0  1.541 -0.063  0.026
6    0  6.857 -0.054 -0.004
7    C  0.067 -0.036  0.008
8    C -0.033 -0.029  0.016

~~~~

Calculation of the sediment nutrient flux in the enriched samples from initiation to 12 June.  Since we do not have the nutrient data from 10 June, I am using the replacement water values as initial value.
     
     # positive numbers = an increase in water nutrient concentratio = a flux from the sediments
     NOx.flux.12Jun.N <-  nut$NOx[nut$BOD != "RWN" & nut$DATE == "12-Jun" & nut$NUTS == "N"] - nut$NOx[nut$BOD == "RWN" & nut$DATE == "10-Jun"]  
     NH3.flux.12Jun.N <-  nut$NH3[nut$BOD != "RWN" & nut$DATE == "12-Jun" & nut$NUTS == "N"] - nut$NH3[nut$BOD == "RWN" & nut$DATE == "10-Jun"]
     P.flux.12Jun.N <-  nut$P[nut$BOD != "RWN" & nut$DATE == "12-Jun" & nut$NUTS == "N"] - nut$P[nut$BOD == "RWN" & nut$DATE == "10-Jun"]
     CPOM.N <- nut$CPOM[nut$BOD != "RWN" & nut$DATE == "12-Jun" & nut$NUTS == "N"]
     flux.12Jun.N <- data.frame(CPOM.N, NOx.flux.12Jun.N, NH3.flux.12Jun.N, P.flux.12Jun.N )
     names(flux.12Jun.N) <- c("CPOM", "NOx", "NH3", "P")

##### Output

~~~~

> flux.12Jun.N
  CPOM    NOx    NH3     P
1    0  6.902 -0.155 0.019
2    C  0.000 -0.043 0.002
3    0  1.428 -0.174 0.024
4    C -0.025 -0.122 0.007
5    C  0.098  0.003 0.014
6    0  6.854 -0.166 0.012
7    0  1.735 -0.171 0.030
8    C -0.090  0.283 0.061
> 

~~~~

#### 17 June

To calculate the flux for 17 June we need to calculate the initial nutrient concentrations due to the dilution of the overlying water with the replacement water.  At the conclusion of the sampling of the previous date a volume of water was removed from each of the bottles for sampling and this was then readded via the replacement water before the jar was put back into incubation.

So the inital nutrient concentration for 17 June is the concentration on 12 June diluted with the 12 June replacement water.

##### Import data with replacement water volumes

    sod.12Jun <- read.table("./data/cpom_flux_sod_12jun2014.csv", header = T, sep = ",")

##### Merge replacement volume data with Nutrient data
 
    flux.17Jun <- merge(nut[nut$DATE == "17-Jun"], sod.12Jun, by.x = BOD, by.y = bod)
