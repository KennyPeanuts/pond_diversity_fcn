# EtOH Preservation Experiment Analysis

## Experimental Description

Analysis of the data from the experiment testing EtOH preservation of OM

Sediment was collected from Wilcks Lake on 11 June 2013 using an Ekman

All samples were washed through 250 um mesh in the field and CPOM was separated from the FPOM using a 1 mm sieve

Control samp were not preserved and washed the same day, Treatment samp was preserved and washed a week later

### Field Notes

The field notes can be found at:

  <http://blogs.longwood.edu/fortinolabnotebook/2013/06/18/ethanol-preservation-exp-11-june-2013/>

## Data Analysis

working directory:"C:/Users/Leanna/Dropbox/pond_bgc"

### Import data
    etoh <- read.delim("./data/EtOH_Exp_Summer2013.txt", header= T)

Note that the "D" site is before the "C" site  in the original text file because this is how the samples were collected in the field

### Data Cleanup

Treatment A & B were same sample in field but we are removing it from the data because B is a duplicate of A

Sample A was too big to fit into only 1 bottle after washing so both the A and B bottles were used and no B sample was collected

    etoh <- etoh[-11,]

~~~~

        Type Location Cruc.num cruc.mass cruc.sed cruc.ash dish.mass dish.CPOM
1    Control        A        7   12.1979  12.9508  12.7003    7.0668   28.2017
2    Control        D        9   11.6669  11.9796  11.7661    7.0657    7.7719
3    Control        C        8   12.5994  12.9378  12.7400    7.0565    7.8598
4    Control        E       10   12.9352  13.0506  12.9584    7.0530    7.2084
5    Control        F       11   11.8885  11.9812  11.9030    7.0646    7.1873
6    Control        G       12   11.7807  11.9033  11.8004    7.0593    7.2171
7    Control        H        1   13.1501  13.3757  13.2073    7.0661    7.3486
8    Control        I        2   12.6365  12.8724  12.7046    7.0604    8.2233
9    Control        J        3   13.0669  13.9546  13.5390    7.0585   28.7722
10 Treatment        A        1   13.1347  14.1249  13.5840    7.0596   22.1489
12 Treatment        D        4   12.2420  13.2084  12.9562    7.0612    8.5417
13 Treatment        C        3   13.0637  13.4586  13.2424    7.0553    7.4857
14 Treatment        E        5   12.5980  13.0891  12.9940    7.0619    7.1967
15 Treatment        F        6   11.9896  12.1199  12.0058    7.0651    7.2291
16 Treatment        G        7   12.1990  12.2221  12.2030    7.0608    7.1302
17 Treatment        H        8   12.5993  12.7240  12.6135    7.0463    7.5194
18 Treatment        I        9   11.6679  12.1624  11.8390    7.0563   11.6227
19 Treatment        J       10   12.9346  14.1867  13.8499    7.0586   32.7218

~~~~

### Calculate variables
    CPOM.ek <- etoh$dish.CPOM - etoh$dish.mass
    ash.cruc <- etoh$cruc.ash -etoh$cruc.mass
    CPOM.cruc <- etoh$cruc.sed - etoh$cruc.mass
    CPOM <- CPOM.ek/ 0.0225
    OM.cruc <- CPOM.cruc - ash.cruc
    OM.prop <- OM.cruc/ CPOM.cruc
    AFDM <- CPOM* OM.prop

### Variable Descriptions

* Type = the treatment applied to the sample
    * Control was returned to the lab in water and washed the same day
    * Treatment was preserved in 70% ethanol and washed a week later
* Location is the location of the sample between the N and S shore.  Sample A was collected approx 10m from the N shore and the samples progressed approx equidistantly between the N and S shore (but note the switching of D and C and the lack of B described above).
* Cruc.num = the number of the crucible used
* cruc.mass = the mass of the empty crucible (g)
* cruc.sed = the mass of the ground dried CPOM + the crucible (g)
* cruc.ash = the mass of the ash + crucible following ashing at 550d C for 3+ h (g)
* dish.mass = the mass of the drying dish for the CPOM (g)
* dish.CPOM = the mass of the dried CPOM + the dish (g)
* CPOM.ek = mass of dry CPOM (g) in Ekman
* ash.cruc = mass of ash (g) in cruc
* CPOM.cruc = mass of CPOM(g) in cruc
* CPOM = mass of CPOM (g/m^2)
* OM.cruc = mass of OM in cruc (g) = CPOM.cruc - ash.cruc
* OM.prop = proportion of OM in CPOM = OM.cruc/ CPOM.cruc
* AFDM = mass of OM (g/m^2) = CPOM * OM.prop

### Analysis of the Effec of the EtOH treatment

~~~~

# Untransformed Data
par(las = 1, mar = c(6, 6, 4, 4))
plot(AFDM ~ Type, data = etoh, axes = F, xlab = "Preservation Method", ylab = expression(paste("CPOM AFDM (g m"^{-1}, ")")), col = "light blue", lwd = 2, cex.lab = 1.5)
axis(1, c("None", "Ethanol"), at = c(1, 2), cex.axis = 1.5, lwt = 4)
axis(2, cex.axis = 1.5)


# ANOVA of AFDM by EtOH treatment
anova(lm(AFDM ~ Type, data = etoh))

Analysis of Variance Table

Response: AFDM
          Df Sum Sq Mean Sq F value Pr(>F)
Type       1      2     2.4   1e-04 0.9922
Residuals 16 384508 24031.8   

# SD of untransformed data
sd(AFDM[etoh$Type == "Control"])
[1] 165.9691
sd(AFDM[etoh$Type == "Treatment"])
[1] 143.2404

~~~~

Although the variance is similar the data is very highly skewed due to the littoral samples so I am re-running the analysis with log10 transformation

~~~~

# Log10 transformed Data
par(las = 1, mar = c(6, 6, 4, 4))
plot(log10(AFDM) ~ Type, data = etoh, axes = F, xlab = "Preservation Method", ylab = expression(paste("log CPOM AFDM (g m"^{-1}, ")")), col = "light blue", lwd = 2, cex.lab = 1.5)
axis(1, c("None", "Ethanol"), at = c(1, 2), cex.axis = 1.5, lwt = 4)
axis(2, cex.axis = 1.5)


# ANOVA of AFDM by EtOH treatment
anova(lm(log10(AFDM) ~ Type, data = etoh))

Analysis of Variance Table

Response: log10(AFDM)
          Df Sum Sq Mean Sq F value Pr(>F)
Type       1  0.016 0.01603   0.024 0.8789
Residuals 16 10.697 0.66854

# SD of untransformed data
sd(log(AFDM)[etoh$Type == "Control"])
[1] 1.701535
sd(log(AFDM)[etoh$Type == "Treatment"])
[1] 2.047879
 
~~~~

### Analysis of the effect of Site
~~~~

## Create Site Variable
    Site<- rep(c("Lit","Open", "Lit", rep("Open",4), rep ("Lit",2)),2)

## Plot of the Site Effec
plot(AFDM ~ as.factor(Site))

~~~~

There is much more variability in the littoral sites, so this may be swamping the effect of the treatment.  We re-ran the ANOVA on only the open sites

~~~~

#Effect of Treatment only in open sites
plot(AFDM ~ Type, data = etoh, subset= Site =="Open")
anova(lm(AFDM ~ Type, data =etoh, subset = Site == "Open"))

Analysis of Variance Table

Response: AFDM
          Df Sum Sq Mean Sq F value Pr(>F)
Type       1   4.97   4.967  0.1046 0.7547
Residuals  8 379.99  47.499           

~~~~

### Analysis of the Effect of Location within the Lake

~~~~

# Plot of Treatment effect by location
par(las = 1, mar = c(6, 6, 4, 4))
plot(0,0, type ="n", ylim = c(0, 500), xlim = c(1, 9), axes = F, ylab = expression(paste("CPOM AFDM (g m"^{-1}, ")")), xlab = "Location within the Lake", cex.lab = 1.5)
points(AFDM[etoh$Type == "Control"], col = 1, cex = 1.5)
points(AFDM[etoh$Type == "Treatment"], pch = 16, cex = 1.5)
axis(1, c("North Shore", "South Shore"), at = c(1, 9))
axis(2)
legend(2, 450, c("Control", "Preserved"), pch = c(1, 16), cex = 1.5)

## Effect of Location
anova(lm(log10(AFDM)~Location, data= etoh))

Analysis of Variance Table

Response: log10(AFDM)
          Df  Sum Sq Mean Sq F value    Pr(>F)    
Location   8 10.1413 1.26766  19.968 7.307e-05 ***
Residuals  9  0.5714 0.06348                      
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

~~~~
