# EtOH Preservation Experiment Analysis

Analysis of the data from the experiment testing EtOH preservation of OM

Sediment was collected from Wilcks Lake on 11 June 2013 using an Ekman

All samples were washed through 250 um mesh in the field and CPOM was separated from the FPOM using a 1 mm sieve

Control samp were not preserved and washed the same day, Treatment samp was preserved and washed a week later

~~~~R

#working directory:"C:/Users/Leanna/Dropbox/pond_bgc"

#import data
etoh <- read.delim("./data/EtOH_Exp_Summer2013.txt", header= T)

#treatment A & B were same sample in field but we are removing it from the data because B is a duplicate of A
etoh <- etoh[-11,]

#calc variables
CPOM.ek <- etoh$dish.CPOM - etoh$dish.mass
ash.cruc <- etoh$cruc.ash -etoh$cruc.mass
CPOM.cruc <- etoh$cruc.sed - etoh$cruc.mass
CPOM <- CPOM.ek/ 0.0225
OM.cruc <- CPOM.cruc - ash.cruc
OM.prop <- OM.cruc/ CPOM.cruc
AFDM <- CPOM* OM.prop

#Var Names
##CPOM.ek = mass of dry CPOM (g) in Ekman
##ash.cruc = mass of ash (g) in cruc
##CPOM.cruc = mass of CPOM(g) in cruc
##CPOM = mass of CPOM (g/m^2)
##OM.cruc = mass of OM in cruc (g) = CPOM.cruc - ash.cruc
##OM.prop = proportion of OM in CPOM = OM.cruc/ CPOM.cruc
##AFDM = mass of OM (g/m^2) = CPOM* OM.prop

#Analysis 
## Effect of Treatment
plot(AFDM ~ Type, data = etoh)
anova(lm(AFDM ~ Type, data = etoh))
sd(AFDM[etoh$Type == "Control"])
sd(AFDM[etoh$Type == "Treatment"])

## Create Site Variable
Site<- rep(c("Lit","Open", "Lit", rep("Open",4), rep ("Lit",2)),2)
# Effect of Site
plot(AFDM ~ as.factor(Site))
#Effect of Treatment only in open sites
plot(AFDM ~ Type, data = etoh, subset= Site =="Open")
anova(lm(AFDM ~ Type, data =etoh, subset = Site == "Open"))
# Plot of Treatment effect by location
plot(0,0, type ="n", ylim = c(0, 500), xlim = c(1, 10))
points(AFDM[etoh$Type == "Control"], col = 1)
points(AFDM[etoh$Type == "Treatment"], pch = 16)

## Effect of Location
plot(log10(AFDM) ~ Location, data =etoh)
anova(lm(log10(AFDM)~Location, data= etoh))

~~~~
