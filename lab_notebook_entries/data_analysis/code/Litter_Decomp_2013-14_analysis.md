# Data Analysis for the Litter Decomposition Experiment Winter 2013 - 2014

## Purpose

The experiment was to assess the loss of mass from leaves in 3 ponds in Farmville VA.

## Date

* Created 19 Feb 2014

* Modified 11 March 2014

## Author

KF

## Variable Descriptions

* T0.DP = the mean AFDM of the leaf packs that were placed in Daulton Pond and then immediately removed (g)

* T0.CP = the mean AFDM of the leaf packs that were placed in Campus Pond and then immediately removed (g)

* T0.LPP = the mean AFDM of the leaf packs that were placed in Lancer Park Pond and then immediately removed (g)

* prop.rem.DP = the proportion of the initial mass of leaves (T0.DP) remaining in a leaf pack sample on a sample day in Daulton Pond.

* prop.rem.CP = the proportion of the initial mass of leaves (T0.DP) remaining in a leaf pack sample on a sample day in Campus Pond.

* prop.rem.LPP = the proportion of the initial mass of leaves (T0.DP) remaining in a leaf pack sample on a sample day in Lancer Park Pond.


## Code

### Import Data

    leaf <- read.delim("./data/leaf_decomp_calc_2013-14.txt", header = T, stringsAsFactors = F)

### Calculate Percent Mass Remaining

#### Daulton Pond

    T0.DP <- mean(leaf$AFDM[leaf$lake == "Daulton Pond" & leaf$days == 0], na.rm = T)
    prop.rem.DP <- 1 - ((T0.DP - leaf$AFDM[leaf$lake == "Daulton Pond"]) / leaf$AFDM[leaf$lake == "Daulton Pond"])

    plot(prop.rem.DP * 100 ~ leaf$days[leaf$lake == "Daulton Pond"], xlab = "Days in Pond", ylab = "Percent Mass Remaining", ylim = c(0, 100), pch = 16)
    dev.copy(png, "./output/plots/DP_decomp_mass_remain.png")
    dev.off()

![Percent leaf pack mass remining in Daulton Pond by days in the pond](../output/plots/DP_decomp_mass_remain.png)

_Percent leaf pack mass remining in Daulton Pond by days in the pond_

##### Calculation of mass loss constant

    DP.k <- lm(log(prop.rem.DP) ~ leaf$days[leaf$lake == "Daulton Pond"])

~~~~

> summary(DP.k)

Call:
lm(formula = log(prop.rem.DP) ~ leaf$days[leaf$lake == "Daulton Pond"])

Residuals:
     Min       1Q   Median       3Q      Max 
-0.42334 -0.15440 -0.00571  0.19606  0.36659 

Coefficients:
                                        Estimate Std. Error t value Pr(>|t|)
(Intercept)                            -0.197292   0.072425  -2.724   0.0127
leaf$days[leaf$lake == "Daulton Pond"] -0.033544   0.005973  -5.615 1.42e-05

Residual standard error: 0.2242 on 21 degrees of freedom
  (47 observations deleted due to missingness)
Multiple R-squared: 0.6003,	Adjusted R-squared: 0.5812 
F-statistic: 31.53 on 1 and 21 DF,  p-value: 1.424e-05 

~~~~

    plot(log(prop.rem.DP) ~ leaf$days[leaf$lake == "Daulton Pond"])
    abline(DP.k)
    dev.copy(png, "./output/plots/lnDP_decomp_mass_remain.png")
    dev.off()

![Percent leaf pack mass remining in Daulton Pond by days in the pond](../output/plots/lnDP_decomp_mass_remain.png)

_Natural log of proportion of leaf pack mass remining in Daulton Pond by days in the pond. Line is the best fit model._
    

#### Campus Pond

    T0.CP <- mean(leaf$AFDM[leaf$lake == "Campus Pond" & leaf$days == 0], na.rm = T)
    prop.rem.CP <- 1 - ((T0.DP - leaf$AFDM[leaf$lake == "Campus Pond"]) / leaf$AFDM[leaf$lake == "Campus Pond"])

    plot(prop.rem.CP * 100 ~ leaf$days[leaf$lake == "Campus Pond"], xlab = "Days in Pond", ylab = "Percent Mass Remaining", ylim = c(0, 100), pch = 16)
    dev.copy(png, "./output/plots/CP_decomp_mass_remain.png")
    dev.off()

![Percent leaf pack mass remining in Campus Pond by days in the pond](../output/plots/CP_decomp_mass_remain.png)

_Percent leaf pack mass remining in Campus Pond by days in the pond_

##### Calculation of mass loss constant

    CP.k <- lm(log(prop.rem.CP) ~ leaf$days[leaf$lake == "Campus Pond"])

~~~~

> summary(CP.k)

Call:
lm(formula = log(prop.rem.CP) ~ leaf$days[leaf$lake == "Campus Pond"])

Residuals:
     Min       1Q   Median       3Q      Max 
-0.57474 -0.08791  0.03646  0.12960  0.42787 

Coefficients:
                                       Estimate Std. Error t value Pr(>|t|)    
(Intercept)                           -0.167309   0.069605  -2.404   0.0251 *  
leaf$days[leaf$lake == "Campus Pond"] -0.029761   0.006048  -4.921 6.38e-05 ***

Residual standard error: 0.2229 on 22 degrees of freedom
  (46 observations deleted due to missingness)
Multiple R-squared: 0.524,	Adjusted R-squared: 0.5023 
F-statistic: 24.22 on 1 and 22 DF,  p-value: 6.382e-05 


~~~~

    plot(log(prop.rem.CP) ~ leaf$days[leaf$lake == "Campus Pond"])
    abline(CP.k)
    dev.copy(png, "./output/plots/lnCP_decomp_mass_remain.png")
    dev.off()

![Percent leaf pack mass remining in Campus Pond by days in the pond](../output/plots/lnCP_decomp_mass_remain.png)

_Natural log of proportion of leaf pack mass remining in Campus Pond by days in the pond. Line is the best fit model._


#### Lancer Park Pond

    T0.LPP <- mean(leaf$AFDM[leaf$lake == "Lancer Park Pond" & leaf$days == 0], na.rm = T)
    prop.rem.LPP <- 1 - ((T0.DP - leaf$AFDM[leaf$lake == "Lancer Park Pond"]) / leaf$AFDM[leaf$lake == "Lancer Park Pond"])

    plot(prop.rem.LPP * 100 ~ leaf$days[leaf$lake == "Lancer Park Pond"], xlab = "Days in Pond", ylab = "Percent Mass Remaining", ylim = c(0, 100), pch = 16)
    dev.copy(png, "./output/plots/LPP_decomp_mass_remain.png")
    dev.off()

![Percent leaf pack mass remining in Lancer Park Pond by days in the pond](../output/plots/LPP_decomp_mass_remain.png)

_Percent leaf pack mass remining in Lancer Park Pond by days in the pond_

##### Calculation of mass loss constant

    LPP.k <- lm(log(prop.rem.LPP) ~ leaf$days[leaf$lake == "Lancer Park Pond"])

~~~~

> summary(LPP.k)

Call:
lm(formula = log(prop.rem.LPP) ~ leaf$days[leaf$lake == "Lancer Park Pond"])

Residuals:
     Min       1Q   Median       3Q      Max 
-0.28626 -0.08019  0.02326  0.08676  0.33995 

Coefficients:
                                            Estimate Std. Error t value
(Intercept)                                -0.134832   0.054903  -2.456
leaf$days[leaf$lake == "Lancer Park Pond"] -0.025415   0.006973  -3.645

Residual standard error: 0.1645 on 12 degrees of freedom
  (56 observations deleted due to missingness)
Multiple R-squared: 0.5254,	Adjusted R-squared: 0.4859 
F-statistic: 13.29 on 1 and 12 DF,  p-value: 0.003358 


~~~~

    plot(log(prop.rem.LPP) ~ leaf$days[leaf$lake == "Lancer Park Pond"])
    abline(LPP.k)
    dev.copy(png, "./output/plots/lnLPP_decomp_mass_remain.png")
    dev.off()

![Percent leaf pack mass remining in Lancer Park Pond by days in the pond](../output/plots/lnLPP_decomp_mass_remain.png)

_Natural log of proportion of leaf pack mass remining in Lancer Park Pond by days in the pond. Line is the best fit model._
