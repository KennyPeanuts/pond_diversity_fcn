# EtOH Preservation Experiment Analysis

## Experimental Description

Analysis of the data from the experiment testing EtOH preservation of OM

Sediment was collected from Wilcks Lake on 11 June 2013 using an Ekman

All samples were washed through 250 um mesh in the field and CPOM was separated from the FPOM using a 1 mm sieve

Control samp were not preserved and washed the same day, Treatment samp was preserved and washed a week later

## Data Analysis

working directory:"C:/Users/Leanna/Dropbox/pond_bgc"

### Import data
    etoh <- read.delim("./data/EtOH_Exp_Summer2013.txt", header= T)

### Data Cleanup 
    # treatment A & B were same sample in field but we are removing it from the data because B is a duplicate of A
    etoh <- etoh[-11,]

### Calculate variables
    CPOM.ek <- etoh$dish.CPOM - etoh$dish.mass
    ash.cruc <- etoh$cruc.ash -etoh$cruc.mass
    CPOM.cruc <- etoh$cruc.sed - etoh$cruc.mass
    CPOM <- CPOM.ek/ 0.0225
    OM.cruc <- CPOM.cruc - ash.cruc
    OM.prop <- OM.cruc/ CPOM.cruc
    AFDM <- CPOM* OM.prop

### Variable Descriptions

* CPOM.ek = mass of dry CPOM (g) in Ekman
* ash.cruc = mass of ash (g) in cruc
* CPOM.cruc = mass of CPOM(g) in cruc
* CPOM = mass of CPOM (g/m^2)
* OM.cruc = mass of OM in cruc (g) = CPOM.cruc - ash.cruc
* OM.prop = proportion of OM in CPOM = OM.cruc/ CPOM.cruc
* AFDM = mass of OM (g/m^2) = CPOM * OM.prop

### Analysis of the Effec of the EtOH treatment
~~~~

    plot(AFDM ~ Type, data = etoh)
    anova(lm(AFDM ~ Type, data = etoh))

Analysis of Variance Table

Response: AFDM
          Df Sum Sq Mean Sq F value Pr(>F)
Type       1      2     2.4   1e-04 0.9922
Residuals 16 384508 24031.8   

sd(AFDM[etoh$Type == "Control"])
sd(AFDM[etoh$Type == "Treatment"])

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
plot(0,0, type ="n", ylim = c(0, 500), xlim = c(1, 9), axes = F, ylab = expression(paste("CPOM AFDM (g m"^{-1}, ")")), xlab = "Location within the Lake")
points(AFDM[etoh$Type == "Control"], col = 1)
points(AFDM[etoh$Type == "Treatment"], pch = 16)
axis(1, c("North Shore", "South Shore"), at = c(1, 9))
axis(2)
legend(2, 450, c("Control", "Preserved"), pch = c(1, 16))

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
