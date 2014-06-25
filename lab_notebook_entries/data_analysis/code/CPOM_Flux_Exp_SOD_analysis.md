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

    mmol.h <- sod17$dDO / sod17$incubation.h
    mmol.h.OM <- mmol.h / sod17$tot.OM
    ## convert to umol to make easier to read
    umol.h.OM <- mmol.h.OM * 1000

### Summarize OM normalized Data

    summary(umol.h.OM)

~~~~

> summary(umol.h.OM)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.5506  0.7920  1.0170  1.0730  1.3170  1.7670 

~~~~

    stem(umol.h.OM)

~~~~

  The decimal point is at the |

  0 | 67788899
  1 | 123344
  1 | 58

~~~~

### Comparison of OM normalized SOD by treatments

    anova(lm(umol.h.OM ~ CPOM * nutrient, data = sod17))
    hist(residuals(lm(umol.h.OM ~ CPOM * nutrient, data = sod17)))


#### Output

~~~~

Analysis of Variance Table

Response: umol.h.OM
              Df  Sum Sq Mean Sq F value    Pr(>F)    
CPOM           1 1.35752 1.35752 62.4730 4.254e-06 ***
nutrient       1 0.11794 0.11794  5.4275   0.03809 *  
CPOM:nutrient  1 0.03282 0.03282  1.5102   0.24267    
Residuals     12 0.26076 0.02173

~~~~

    plot(umol.h.OM ~ CPOM, data = sod17, ylab = expression(paste(mu, "mol h"^{-1}, "g OM"^{-1})), ylim = c(0, 2), col = "light green")
    dev.copy(png, "./output/plots/CPOM_flux_OMflux_by_CPOM.png")
    dev.off()

![]("../output/plots/CPOM_flux_OMflux_by_CPOM.png")

_SOD by CPOM_

    plot(umol.h.OM  ~ nutrient, data = sod17, ylab = expression(paste(mu, "mol h"^{-1}, "g OM"^{-1})), ylim = c(0, 2), col = "orange")
    dev.copy(png, "./output/plots/CPOM_flux_OMflux_by_nutrient.png")
    dev.off()

![]("../output/plots/CPOM_flux_OMflux_by_nutrient.png")

_SOD by nutrient_

### Comparison of Area normalized SOD by treatments

