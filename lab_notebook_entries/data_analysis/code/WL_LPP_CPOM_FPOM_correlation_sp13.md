# Analysis of the correlation between CPOM mass and %OM in WL and LPP

## Data

    om <- read.delim("./data/WL_LPP_OM_sp13.txt", header = T, stringsAsFactors = F, sep = " ")

## Analysis

Correlation of CPOM mass and percent OM in the sediments from WL and LPP

    summary(lm(perc.OM ~ CPOM, data = om))

### Output

~~~~


Call:
lm(formula = perc.OM ~ CPOM, data = om)

Residuals:
    Min      1Q  Median      3Q     Max 
-7.1851 -0.6028  1.1266  1.8397  2.6665 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 8.677455   1.044454   8.308 8.44e-06 ***
CPOM        0.006116   0.002358   2.594   0.0268 *  
---

Residual standard error: 3.087 on 10 degrees of freedom
Multiple R-squared: 0.4022,	Adjusted R-squared: 0.3424 
F-statistic: 6.728 on 1 and 10 DF,  p-value: 0.02677 

~~~~

## Plot of relationship between perc. OM and CPOM

    plot(perc.OM ~ CPOM, data =  om)
    
## Analysis with log transformation

    summary(lm(log(perc.OM) ~ log(CPOM), data = om))

### Output

~~~~


Call:
lm(formula = log(perc.OM) ~ log(CPOM), data = om)

Residuals:
    Min      1Q  Median      3Q     Max 
-1.1493 -0.2175  0.1039  0.3448  0.4380 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)  
(Intercept)  1.04351    0.38580   2.705   0.0221 *
log(CPOM)    0.27123    0.08575   3.163   0.0101 *
---

Residual standard error: 0.4672 on 10 degrees of freedom
Multiple R-squared: 0.5001,	Adjusted R-squared: 0.4501 
F-statistic: 10.01 on 1 and 10 DF,  p-value: 0.01011 

~~~~

## Plot of transformed data

    par(las = 1, cex = 1.5)
    plot(log(perc.OM) ~ log(CPOM), data = om, ylim = c(0, 3), xlim = c(0, 10), ylab = "Percent Sediment Organic Matter", xlab = expression(paste("CPOM Mass (g m"^{-2}, ")")), cex.lab = 1, cex.axis = 1, pch = 16)
    dev.copy(jpeg, file = "./output/WL_LPP_perc.OM_CPOM_cor_sp13.jpg")
    dev.off()
