# Analysis of the SOD results from the CPOM Flux Experiment - Summer 2014

## Purpose

This code it to analyze the SOD data from the treatments with and without CPOM and/or nutrients

## Import data

    sod10 <- read.table("./data/sod_calculation_10jun2014.csv", header = T, sep = ",")
    sod12 <- read.table("./data/sod_calculation_12jun2014.csv", header = T, sep = ",")
    sod17 <- read.table("./data/sod_calculation_17jun2014.csv", header = T, sep = ",")
    botOM <- read.table("./data/CPOM_flux_bottleOM_initial.csv", header = T, sep = ",")

## Data Analysis

## 17 June 2014 Run

### Merge sediment OM calculation to SOD

    sod17 <- merge(sod17, botOM, by.x = "CPOM", by.y = "CPOM")

### Normalize flux to sediment OM and time

    mmol.h17 <- sod17$dDO / sod17$incubation.h
    mmol.h.OM17 <- mmol.h17 / sod17$tot.OM
    ## convert to umol to make easier to read
    umol.h.OM17 <- mmol.h.OM17 * 1000

### Summarize OM normalized Data

    summary(umol.h.OM17)

~~~~

> summary(umol.h.OM17)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.5506  0.7920  1.0170  1.0730  1.3170  1.7670 

~~~~

    stem(umol.h.OM17)

~~~~

  The decimal point is at the |

  0 | 67788899
  1 | 123344
  1 | 58

~~~~

### Comparison of OM normalized SOD by treatments

    anova(lm(umol.h.OM17 ~ CPOM * nutrient, data = sod17))
    hist(residuals(lm(umol.h.OM17 ~ CPOM * nutrient, data = sod17)))


#### Output

~~~~

Analysis of Variance Table

Response: umol.h.OM17
              Df  Sum Sq Mean Sq F value    Pr(>F)    
CPOM           1 1.35752 1.35752 62.4730 4.254e-06 ***
nutrient       1 0.11794 0.11794  5.4275   0.03809 *  
CPOM:nutrient  1 0.03282 0.03282  1.5102   0.24267    
Residuals     12 0.26076 0.02173

~~~~

    plot(umol.h.OM17 ~ CPOM, data = sod17, ylab = expression(paste(mu, "mol h"^{-1}, "g OM"^{-1})), ylim = c(0, 2), col = "light green")
    dev.copy(png, "./output/plots/CPOM_flux_OMflux_by_CPOM_17jun2014.png")
    dev.off()

![SOD by CPOM]("../output/plots/CPOM_flux_OMflux_by_CPOM_17jun2014.png")

_SOD by CPOM_

    plot(umol.h.OM17  ~ nutrient, data = sod17, ylab = expression(paste(mu, "mol h"^{-1}, "g OM"^{-1})), ylim = c(0, 2), col = "orange")
    dev.copy(png, "./output/plots/CPOM_flux_OMflux_by_nutrient_17jun2014.png")
    dev.off()

![SOD by Nutrient]("../output/plots/CPOM_flux_OMflux_by_nutrient_17jun2014.png")

_SOD by nutrient_

### Comparison of Area normalized SOD by treatments

### Summarize Area Normalized Data

    summary(sod17$SOD)

~~~~

    summary(sod17$SOD)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.6389  0.9190  1.1950  1.2640  1.5630  2.0980

~~~~

    stem(sod17$SOD)

~~~~

  The decimal point is at the |

  0 | 68999
  1 | 01134
  1 | 55678
  2 | 1

~~~~

### Comparison of the Area Normalized SOD by Treatment

    anova(lm(SOD ~ CPOM * nutrient, data = sod17))
    hist(residuals(lm(SOD ~ CPOM * nutrient, data = sod17)))


#### Output

~~~~

Analysis of Variance Table

Response: SOD 17jun2014
              Df  Sum Sq Mean Sq F value    Pr(>F)    
CPOM           1 2.03121 2.03121 67.3700 2.888e-06 ***
nutrient       1 0.16447 0.16447  5.4550   0.03769 *  
CPOM:nutrient  1 0.04719 0.04719  1.5653   0.23473    
Residuals     12 0.36180 0.03015                      


~~~~

    plot(SOD ~ CPOM, data = sod17, ylab = expression(paste("mmol m"^{-2},"h"^{-1})), ylim = c(0, 3 ), col = "light green")
    dev.copy(png, "./output/plots/CPOM_flux_Aflux_by_CPOM_17jun2014.png")
    dev.off()

![Area SOD by CPOM]("../output/plots/CPOM_flux_Aflux_by_CPOM_17jun2014.png")

_Area SOD by CPOM_

    plot(SOD ~ nutrient, data = sod17, ylab = expression(paste("mmol m"^{-2},"h"^{-1})), ylim = c(0, 3 ), col = "orange")
    dev.copy(png, "./output/plots/CPOM_flux_Aflux_by_Nutrient_17jun2014.png")
    dev.off()

![Area SOD by CPOM]("../output/plots/CPOM_flux_Aflux_by_nutrient_17jun2014.png")

_Area SOD by Nutrient_
