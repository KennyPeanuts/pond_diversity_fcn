# Data Analysis for the Litter Decomposition Experiment Winter 2013 - 2014

## Purpose

The experiment was to assess the loss of mass from leaves in 3 ponds in Farmville VA.

## Date

* Created 19 Feb 2014

* Modified 23 March 2014

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

In all of the calculations I remove any observations where the proportion of mass remaining is < 0.  It is not clear where the errors are occuring to produce there impossible values. 

#### Daulton Pond

    T0.DP <- mean(leaf$AFDM[leaf$lake == "Daulton Pond" & leaf$days == 0], na.rm = T)
    prop.rem.DP <- 1 - ((T0.DP - leaf$AFDM[leaf$lake == "Daulton Pond"]) / leaf$AFDM[leaf$lake == "Daulton Pond"])


    day.axis.DP <- leaf$days[leaf$lake == "Daulton Pond"] #create vector for x axis so I can deletet obs 17 and 25

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
-0.605737 -0.182842  0.004216  0.155271  0.402051 

Coefficients:
                           Estimate Std. Error t value Pr(>|t|)    
(Intercept)               -0.379269   0.073907  -5.132 1.47e-05 ***
day.axis[prop.rem.DP > 0] -0.009252   0.003244  -2.852  0.00767 ** 

Residual standard error: 0.2715 on 31 degrees of freedom
  (35 observations deleted due to missingness)
Multiple R-squared: 0.2078,	Adjusted R-squared: 0.1823 
F-statistic: 8.133 on 1 and 31 DF,  p-value: 0.007668 

~~~~

    plot(log(prop.rem.DP[prop.rem.DP > 0]) ~ day.axis.DP[prop.rem.DP > 0])
    abline(DP.k)
    dev.copy(png, "./output/plots/lnDP_decomp_mass_remain.png")
    dev.off()

![Percent leaf pack mass remining in Daulton Pond by days in the pond](../output/plots/lnDP_decomp_mass_remain.png)

_Natural log of proportion of leaf pack mass remining in Daulton Pond by days in the pond. Line is the best fit model._
    

#### Campus Pond

    T0.CP <- mean(leaf$AFDM[leaf$lake == "Campus Pond" & leaf$days == 0], na.rm = T)
    prop.rem.CP <- 1 - ((T0.DP - leaf$AFDM[leaf$lake == "Campus Pond"]) / leaf$AFDM[leaf$lake == "Campus Pond"])

    day.axis.CP <- leaf$days[leaf$lake == "Campus Pond"] #create vector for x axis so I can delete negative proportions

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
-2.09547 -0.14371  0.08088  0.25339  1.26342 

Coefficients:
                              Estimate Std. Error t value Pr(>|t|)  
(Intercept)                  -0.353964   0.133364  -2.654   0.0124 *
day.axis.CP[prop.rem.CP > 0] -0.009716   0.005104  -1.904   0.0663 .

Residual standard error: 0.5343 on 31 degrees of freedom
  (35 observations deleted due to missingness)
Multiple R-squared: 0.1047,	Adjusted R-squared: 0.07578 
F-statistic: 3.624 on 1 and 31 DF,  p-value: 0.06628 

~~~~

    plot(log(prop.rem.CP[prop.rem.CP > 0]) ~ day.axis.CP[prop.rem.CP > 0])
    abline(CP.k)
    dev.copy(png, "./output/plots/lnCP_decomp_mass_remain.png")
    dev.off()

![Percent leaf pack mass remining in Campus Pond by days in the pond](../output/plots/lnCP_decomp_mass_remain.png)

_Natural log of proportion of leaf pack mass remining in Campus Pond by days in the pond. Line is the best fit model._


#### Lancer Park Pond

    T0.LPP <- mean(leaf$AFDM[leaf$lake == "Lancer Park Pond" & leaf$days == 0], na.rm = T)
    prop.rem.LPP <- 1 - ((T0.DP - leaf$AFDM[leaf$lake == "Lancer Park Pond"]) / leaf$AFDM[leaf$lake == "Lancer Park Pond"])

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
-2.13038 -0.06648  0.05756  0.21872  0.87174 

Coefficients:
                                Estimate Std. Error t value Pr(>|t|)    
(Intercept)                    -0.246801   0.121423  -2.033 0.048607 *  
day.axis.LPP[prop.rem.LPP > 0] -0.007903   0.002074  -3.811 0.000457 ***

Residual standard error: 0.5669 on 41 degrees of freedom
  (26 observations deleted due to missingness)
Multiple R-squared: 0.2615,	Adjusted R-squared: 0.2435 
F-statistic: 14.52 on 1 and 41 DF,  p-value: 0.0004568 

~~~~

    plot(log(prop.rem.LPP[prop.rem.LPP > 0]) ~ day.axis.LPP[prop.rem.LPP > 0])
    abline(LPP.k)
    dev.copy(png, "./output/plots/lnLPP_decomp_mass_remain.png")
    dev.off()

![Percent leaf pack mass remining in Lancer Park Pond by days in the pond](../output/plots/lnLPP_decomp_mass_remain.png)

_Natural log of proportion of leaf pack mass remining in Lancer Park Pond by days in the pond. Line is the best fit model._

