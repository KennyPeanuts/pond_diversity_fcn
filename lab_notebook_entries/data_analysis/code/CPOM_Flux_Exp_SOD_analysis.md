# Analysis of the SOD results from the CPOM Flux Experiment - Summer 2014

## Purpose

This code it to analyze the SOD data from the treatments with and without CPOM and/or nutrients

## Import data

    sod10 <- read.table("./data/sod_calculation_10jun2014.csv", header = T, sep = ",")
    sod12 <- read.table("./data/sod_calculation_12jun2014.csv", header = T, sep = ",")
    sod17 <- read.table("./data/sod_calculation_17jun2014.csv", header = T, sep = ",")
    botOM <- read.table("./data/CPOM_flux_bottleOM_initial.csv", header = T, sep = ",")

## Data Analysis

## 10 June 2014 Run

### Merge sediment OM calculation to SOD

    sod10 <- merge(sod10, botOM, by.x = "CPOM", by.y = "CPOM")

### Normalize flux to sediment OM and time

    mmol.h10 <- sod10$dDO / sod10$incubation.h
    mmol.h.OM10 <- mmol.h10 / sod10$tot.OM
    ## convert to umol to make easier to read
    umol.h.OM10 <- mmol.h.OM10 * 1000

### Summarize OM normalized Data

    summary(umol.h.OM10)

~~~~

    summary(umol.h.OM10)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.3146  0.4674  0.5990  0.5849  0.6820  0.8830

~~~~

    stem(umol.h.OM10)

~~~~

The decimal point is 1 digit(s) to the left of the |

  2 | 16
  4 | 577946
  6 | 4578938
  8 | 8

~~~~

### Comparison of OM normalized SOD by treatments

    anova(lm(umol.h.OM10 ~ CPOM * nutrient, data = sod10))
    hist(residuals(lm(umol.h.OM10 ~ CPOM * nutrient, data = sod10)))


#### Output

~~~~

Analysis of Variance Table

Response: umol.h.OM10
              Df   Sum Sq  Mean Sq F value   Pr(>F)   
CPOM           1 0.125545 0.125545 10.4335 0.007218 **
nutrient       1 0.083208 0.083208  6.9151 0.021990 * 
CPOM:nutrient  1 0.007725 0.007725  0.6420 0.438580   
Residuals     12 0.144394 0.012033                    

~~~~

    plot(umol.h.OM10 ~ CPOM, data = sod10, ylab = expression(paste(mu, "mol h"^{-1}, "g OM"^{-1})), ylim = c(0, 2), col = "light green")
    dev.copy(png, "./output/plots/CPOM_flux_OMflux_by_CPOM_10jun2014.png")
    dev.off()

![SOD by CPOM]("../output/plots/CPOM_flux_OMflux_by_CPOM_10jun2014.png")

_SOD by CPOM_

    plot(umol.h.OM10  ~ nutrient, data = sod10, ylab = expression(paste(mu, "mol h"^{-1}, "g OM"^{-1})), ylim = c(0, 2), col = "orange")
    dev.copy(png, "./output/plots/CPOM_flux_OMflux_by_nutrient_10jun2014.png")
    dev.off()

![SOD by Nutrient]("../output/plots/CPOM_flux_OMflux_by_nutrient_10jun2014.png")

_SOD by nutrient_

### Comparison of Area normalized SOD by treatments

### Summarize Area Normalized Data

    summary(sod10$SOD)

~~~~

 Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.3650  0.5424  0.7057  0.6878  0.8097  1.0480

~~~~

    stem(sod10$SOD)

~~~~

The decimal point is 1 digit(s) to the left of the |

   2 | 7
   4 | 22447
   6 | 4656
   8 | 01260
  10 | 5

~~~~

### Comparison of the Area Normalized SOD by Treatment

    anova(lm(SOD ~ CPOM * nutrient, data = sod10))
    hist(residuals(lm(SOD ~ CPOM * nutrient, data = sod10)))


#### Output

~~~~

Analysis of Variance Table

Response: SOD
              Df   Sum Sq  Mean Sq F value   Pr(>F)   
CPOM           1 0.200051 0.200051 12.1137 0.004542 **
nutrient       1 0.113854 0.113854  6.8942 0.022152 * 
CPOM:nutrient  1 0.009861 0.009861  0.5971 0.454638   
Residuals     12 0.198174 0.016515                    


~~~~

    plot(SOD ~ CPOM, data = sod10, ylab = expression(paste("mmol m"^{-2},"h"^{-1})), ylim = c(0, 3 ), col = "light green")
    dev.copy(png, "./output/plots/CPOM_flux_Aflux_by_CPOM_10jun2014.png")
    dev.off()

![Area SOD by CPOM]("../output/plots/CPOM_flux_Aflux_by_CPOM_10jun2014.png")

_Area SOD by CPOM_

    plot(SOD ~ nutrient, data = sod10, ylab = expression(paste("mmol m"^{-2},"h"^{-1})), ylim = c(0, 3 ), col = "orange")
    dev.copy(png, "./output/plots/CPOM_flux_Aflux_by_Nutrient_10jun2014.png")
    dev.off()

![Area SOD by CPOM]("../output/plots/CPOM_flux_Aflux_by_nutrient_10jun2014.png")

_Area SOD by Nutrient_


################################################################################

## 12 June 2014 Run

### Merge sediment OM calculation to SOD

    sod12 <- merge(sod12, botOM, by.x = "CPOM", by.y = "CPOM")

### Normalize flux to sediment OM and time

    mmol.h12 <- sod12$dDO / sod12$incubation.h
    mmol.h.OM12 <- mmol.h12 / sod12$tot.OM
    ## convert to umol to make easier to read
    umol.h.OM12 <- mmol.h.OM12 * 1000

### Summarize OM normalized Data

    summary(umol.h.OM12)

~~~~

    summary(umol.h.OM12)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NAs 
 0.5834  0.9614  1.2040  1.1510  1.4020  1.6280  1.0000

~~~~

    stem(umol.h.OM12)

~~~~

The decimal point is at the |

  0 | 6699
  1 | 00122344
  1 | 566

~~~~

### Comparison of OM normalized SOD by treatments

    anova(lm(umol.h.OM12 ~ CPOM * nutrient, data = sod12))
    hist(residuals(lm(umol.h.OM12 ~ CPOM * nutrient, data = sod12)))


#### Output

~~~~

Analysis of Variance Table

Response: umol.h.OM12
              Df  Sum Sq  Mean Sq F value Pr(>F)
CPOM           1 0.24784 0.247841  2.5907 0.1358
nutrient       1 0.20361 0.203610  2.1283 0.1726
CPOM:nutrient  1 0.01282 0.012824  0.1340 0.7212
Residuals     11 1.05234 0.095667               

~~~~

    plot(umol.h.OM12 ~ CPOM, data = sod12, ylab = expression(paste(mu, "mol h"^{-1}, "g OM"^{-1})), ylim = c(0, 2), col = "light green")
    dev.copy(png, "./output/plots/CPOM_flux_OMflux_by_CPOM_12jun2014.png")
    dev.off()

![SOD by CPOM]("../output/plots/CPOM_flux_OMflux_by_CPOM_12jun2014.png")

_SOD by CPOM_

    plot(umol.h.OM12  ~ nutrient, data = sod12, ylab = expression(paste(mu, "mol h"^{-1}, "g OM"^{-1})), ylim = c(0, 2), col = "orange")
    dev.copy(png, "./output/plots/CPOM_flux_OMflux_by_nutrient_12jun2014.png")
    dev.off()

![SOD by Nutrient]("../output/plots/CPOM_flux_OMflux_by_nutrient_12jun2014.png")

_SOD by nutrient_

### Comparison of Area normalized SOD by treatments

### Summarize Area Normalized Data

    summary(sod12$SOD)

~~~~

    summary(sod12$SOD)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NAs 
  0.677   1.116   1.430   1.354   1.664   1.895   1.000

~~~~

    stem(sod12$SOD)

~~~~

The decimal point is at the |

  0 | 77
  1 | 0122244
  1 | 567899

~~~~

### Comparison of the Area Normalized SOD by Treatment

    anova(lm(SOD ~ CPOM * nutrient, data = sod12))
    hist(residuals(lm(SOD ~ CPOM * nutrient, data = sod12)))


#### Output

~~~~

Analysis of Variance Table

Response: SOD
              Df  Sum Sq Mean Sq F value Pr(>F)
CPOM           1 0.41415 0.41415  3.1307 0.1045
nutrient       1 0.27944 0.27944  2.1124 0.1740
CPOM:nutrient  1 0.01607 0.01607  0.1215 0.7340
Residuals     11 1.45513 0.13228               


~~~~

    plot(SOD ~ CPOM, data = sod12, ylab = expression(paste("mmol m"^{-2},"h"^{-1})), ylim = c(0, 3 ), col = "light green")
    dev.copy(png, "./output/plots/CPOM_flux_Aflux_by_CPOM_12jun2014.png")
    dev.off()

![Area SOD by CPOM]("../output/plots/CPOM_flux_Aflux_by_CPOM_12jun2014.png")

_Area SOD by CPOM_

    plot(SOD ~ nutrient, data = sod12, ylab = expression(paste("mmol m"^{-2},"h"^{-1})), ylim = c(0, 3 ), col = "orange")
    dev.copy(png, "./output/plots/CPOM_flux_Aflux_by_Nutrient_12jun2014.png")
    dev.off()

![Area SOD by CPOM]("../output/plots/CPOM_flux_Aflux_by_nutrient_12jun2014.png")

_Area SOD by Nutrient_

################################################################################

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

################################################################################

## Combine All Dates

### Average OM normalized SOD

    sum.OMflux <- umol.h.OM10 + umol.h.OM12 + umol.h.OM17
    mean.OMflux <- sum.OMflux / 3

### Summarize Mean OM Normalized Data

### Compare mean OM normalized SOD by treatment

    anova(lm(mean.OMflux ~ CPOM * nutrient, data = sod17))
    hist(residuals(lm(SOD ~ CPOM * nutrient, data = sod17)))


#### Output

~~~~

Analysis of Variance Table

Response: mean.OMflux
              Df  Sum Sq Mean Sq F value    Pr(>F)    
CPOM           1 0.42536 0.42536 27.5738 0.0002721 ***
nutrient       1 0.10421 0.10421  6.7552 0.0247344 *  
CPOM:nutrient  1 0.00005 0.00005  0.0034 0.9547883    
Residuals     11 0.16969 0.01543                      

~~~~

    plot(mean.OMflux ~ CPOM, data = sod17, ylab = expression(paste("mmol m"^{-2},"h"^{-1})), ylim = c(0, 3 ), col = "light green")
    dev.copy(png, "./output/plots/CPOM_flux_OMflux_by_CPOM_all.png")
    dev.off()

![OM SOD by CPOM]("../output/plots/CPOM_flux_OMflux_by_CPOM_all.png")

_OM SOD by CPOM_

    plot(mean.OMflux ~ nutrient, data = sod17, ylab = expression(paste("mmol m"^{-2},"h"^{-1})), ylim = c(0, 3 ), col = "orange")
    dev.copy(png, "./output/plots/CPOM_flux_OMflux_by_Nutrient_all.png")
    dev.off()

![OM SOD by CPOM]("../output/plots/CPOM_flux_OMflux_by_nutrient_all.png")

_OM SOD by Nutrient_


### Average OM normalized SOD

    sum.Aflux <- sod10$SOD + sod12$SOD + sod17$SOD
    mean.Aflux <- sum.Aflux / 3

### Summarize Mean OM Normalized Data


### Compare mean Area normalized SOD by treatment

    anova(lm(mean.Aflux ~ CPOM * nutrient, data = sod17))
    hist(residuals(lm(SOD ~ CPOM * nutrient, data = sod17)))


#### Output

~~~~

Analysis of Variance Table

Response: mean.Aflux
              Df  Sum Sq Mean Sq F value    Pr(>F)    
CPOM           1 0.66253 0.66253 31.0570 0.0001669 ***
nutrient       1 0.14376 0.14376  6.7391 0.0248715 *  
CPOM:nutrient  1 0.00002 0.00002  0.0008 0.9779204    
Residuals     11 0.23466 0.02133                      
~~~~

    plot(mean.Aflux ~ CPOM, data = sod17, ylab = expression(paste("mmol m"^{-2},"h"^{-1})), ylim = c(0, 3 ), col = "light green")
    dev.copy(png, "./output/plots/CPOM_flux_Aflux_by_CPOM_all.png")
    dev.off()

![Area SOD by CPOM]("../output/plots/CPOM_flux_Aflux_by_CPOM_all.png")

_Area SOD by CPOM_

    plot(mean.OMflux ~ nutrient, data = sod17, ylab = expression(paste("mmol m"^{-2},"h"^{-1})), ylim = c(0, 3 ), col = "orange")
    dev.copy(png, "./output/plots/CPOM_flux_Aflux_by_Nutrient_all.png")
    dev.off()

![Area SOD by CPOM]("../output/plots/CPOMn_flux_Aflux_by_nutrient_all.png")

_Area SOD by Nutrient_

### Areal SOD by Time

    boxplot(sod10$SOD[sod10$CPOM == "yes"], sod12$SOD[sod10$CPOM == "yes"], sod17$SOD[sod10$CPOM == "yes"], ylim = c(0, 3), col = "light green")
    boxplot(sod10$SOD[sod10$CPOM == "no"], sod12$SOD[sod10$CPOM == "no"], sod17$SOD[sod10$CPOM == "no"], add = T, col = 8)
