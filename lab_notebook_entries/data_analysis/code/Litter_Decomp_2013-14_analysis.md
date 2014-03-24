# Data Analysis for the Litter Decomposition Experiment Winter 2013 - 2014

## Purpose

The experiment was to assess the loss of mass from leaves in 3 ponds in Farmville VA.

## Date

* Created 19 Feb 2014

* Modified 24 March 2014

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
    prop.rem.DP <- 1 - ((T0.DP - leaf$AFDM[leaf$lake == "Daulton Pond"]) / T0.DP)

    day.axis.DP <- leaf$days[leaf$lake == "Daulton Pond"] 

    plot(prop.rem.DP[prop.rem.DP > 0] * 100 ~ day.axis.DP[prop.rem.DP > 0], xlab = "Days in Pond", ylab = "Percent Mass Remaining", ylim = c(0, 100), pch = 16)
    dev.copy(png, "./output/plots/DP_decomp_mass_remain.png")
    dev.off()

![Percent leaf pack mass remining in Daulton Pond by days in the pond](../output/plots/DP_decomp_mass_remain.png)

_Percent leaf pack mass remining in Daulton Pond by days in the pond_

##### Calculation of mass loss constant

    DP.k <- lm(log(prop.rem.DP[prop.rem.DP > 0]) ~ day.axis.DP[prop.rem.DP > 0])

~~~~

    summary(DP.k)



Call:
lm(formula = log(prop.rem.DP[prop.rem.DP > 0]) ~ day.axis.DP[prop.rem.DP > 
    0])

Residuals:
      Min        1Q    Median        3Q       Max 
-0.410642 -0.082346  0.001307  0.084595  0.269229 

Coefficients:
                              Estimate Std. Error t value Pr(>|t|)    
(Intercept)                  -0.245917   0.043727  -5.624 2.92e-06 ***
day.axis.DP[prop.rem.DP > 0] -0.005564   0.001937  -2.872  0.00707 ** 

Residual standard error: 0.1624 on 33 degrees of freedom
  (35 observations deleted due to missingness)
Multiple R-squared:   0.2,	Adjusted R-squared: 0.1758 
F-statistic:  8.25 on 1 and 33 DF,  p-value: 0.00707 

~~~~

    plot(log(prop.rem.DP[prop.rem.DP > 0]) ~ day.axis.DP[prop.rem.DP > 0])
    abline(DP.k)
    dev.copy(png, "./output/plots/lnDP_decomp_mass_remain.png")
    dev.off()

![Percent leaf pack mass remining in Daulton Pond by days in the pond](../output/plots/lnDP_decomp_mass_remain.png)

_Natural log of proportion of leaf pack mass remining in Daulton Pond by days in the pond. Line is the best fit model._
    

#### Campus Pond

    T0.CP <- mean(leaf$AFDM[leaf$lake == "Campus Pond" & leaf$days == 0], na.rm = T)
    prop.rem.CP <- 1 - ((T0.DP - leaf$AFDM[leaf$lake == "Campus Pond"]) / T0.CP)

    day.axis.CP <- leaf$days[leaf$lake == "Campus Pond"] 

    plot(prop.rem.CP[prop.rem.CP > 0] * 100 ~ day.axis.CP[prop.rem.CP > 0], xlab = "Days in Pond", ylab = "Percent Mass Remaining", ylim = c(0, 100), pch = 16)
    dev.copy(png, "./output/plots/CP_decomp_mass_remain.png")
    dev.off()

![Percent leaf pack mass remining in Campus Pond by days in the pond](../output/plots/CP_decomp_mass_remain.png)

_Percent leaf pack mass remining in Campus Pond by days in the pond_

##### Calculation of mass loss constant

    CP.k <- lm(log(prop.rem.CP[prop.rem.CP > 0]) ~ day.axis.CP[prop.rem.CP > 0])

~~~~

    summary(CP.k)


Call:
lm(formula = log(prop.rem.CP[prop.rem.CP > 0]) ~ day.axis.CP[prop.rem.CP > 
    0])

Residuals:
     Min       1Q   Median       3Q      Max 
-0.35525 -0.10974 -0.02062  0.06692  1.01198 

Coefficients:
                              Estimate Std. Error t value Pr(>|t|)    
(Intercept)                  -0.228854   0.059056  -3.875 0.000479 ***
day.axis.CP[prop.rem.CP > 0] -0.003842   0.002051  -1.874 0.069864 .  

Residual standard error: 0.2402 on 33 degrees of freedom
  (35 observations deleted due to missingness)
Multiple R-squared: 0.09615,	Adjusted R-squared: 0.06876 
F-statistic:  3.51 on 1 and 33 DF,  p-value: 0.06986 

~~~~

    plot(log(prop.rem.CP[prop.rem.CP > 0]) ~ day.axis.CP[prop.rem.CP > 0])
    abline(CP.k)
    dev.copy(png, "./output/plots/lnCP_decomp_mass_remain.png")
    dev.off()

![Percent leaf pack mass remining in Campus Pond by days in the pond](../output/plots/lnCP_decomp_mass_remain.png)

_Natural log of proportion of leaf pack mass remining in Campus Pond by days in the pond. Line is the best fit model._


#### Lancer Park Pond

    T0.LPP <- mean(leaf$AFDM[leaf$lake == "Lancer Park Pond" & leaf$days == 0], na.rm = T)
    prop.rem.LPP <- 1 - ((T0.LPP - leaf$AFDM[leaf$lake == "Lancer Park Pond"]) / T0.LPP)

    day.axis.LPP <- leaf$days[leaf$lake == "Lancer Park Pond"]

    plot(prop.rem.LPP[prop.rem.LPP > 0] * 100 ~ day.axis.LPP[prop.rem.LPP > 0], xlab = "Days in Pond", ylab = "Percent Mass Remaining", ylim = c(0, 100), pch = 16)
    dev.copy(png, "./output/plots/LPP_decomp_mass_remain.png")
    dev.off()

![Percent leaf pack mass remining in Lancer Park Pond by days in the pond](../output/plots/LPP_decomp_mass_remain.png)

_Percent leaf pack mass remining in Lancer Park Pond by days in the pond_

##### Calculation of mass loss constant

    LPP.k <- lm(log(prop.rem.LPP[prop.rem.LPP > 0]) ~ day.axis.LPP[prop.rem.LPP > 0])

~~~~

    summary(LPP.k)



Call:
lm(formula = log(prop.rem.LPP[prop.rem.LPP > 0]) ~ day.axis.LPP[prop.rem.LPP > 
    0])

Residuals:
     Min       1Q   Median       3Q      Max 
-1.15079 -0.04926  0.01448  0.08023  0.57042 

Coefficients:
                                 Estimate Std. Error t value Pr(>|t|)    
(Intercept)                    -0.1899167  0.0494571  -3.840 0.000409 ***
day.axis.LPP[prop.rem.LPP > 0] -0.0020857  0.0008505  -2.452 0.018433 *  

Residual standard error: 0.2325 on 42 degrees of freedom
  (26 observations deleted due to missingness)
Multiple R-squared: 0.1253,	Adjusted R-squared: 0.1044 
F-statistic: 6.014 on 1 and 42 DF,  p-value: 0.01843 

~~~~

    plot(log(prop.rem.LPP[prop.rem.LPP > 0]) ~ day.axis.LPP[prop.rem.LPP > 0])
    abline(LPP.k)
    dev.copy(png, "./output/plots/lnLPP_decomp_mass_remain.png")
    dev.off()

![Percent leaf pack mass remining in Lancer Park Pond by days in the pond](../output/plots/lnLPP_decomp_mass_remain.png)

_Natural log of proportion of leaf pack mass remining in Lancer Park Pond by days in the pond. Line is the best fit model._

