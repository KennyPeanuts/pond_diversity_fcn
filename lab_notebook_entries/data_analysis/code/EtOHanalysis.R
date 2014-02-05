#EtOH Analysis
#Analysis from the data testing EtOH preservation of OM 
#Sed collected from Wilck's Lake on 11 June 2013
#Control samp were not preserved and washed the same day, Treatment samp was preserved and washed a week later

#working directory:"C:/Users/Leanna/Dropbox/pond_bgc"

#import data
etoh <- read.delim("./data/EtOH.txt", header= T)

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


#Analysis of EtOH Exp
##28 Jan 2014


##Data Import
    EtOH<- read.delim("./data/EtOH_Exp.txt", header= T)

#Calculations copied from above
#treatment A & B were same sample in field but we are removing it from the data because B is a duplicate of A
EtOH <- EtOH[-11,]

#calc variables
CPOM.ek <- EtOH$dish.CPOM - EtOH$dish.mass
ash.cruc <- EtOH$cruc.ash -EtOH$cruc.mass
CPOM.cruc <- EtOH$cruc.sed - EtOH$cruc.mass
CPOM <- CPOM.ek/ 0.0225
OM.cruc <- CPOM.cruc - ash.cruc
OM.prop <- OM.cruc/ CPOM.cruc
AFDM <- CPOM* OM.prop

#Test of Treatment effect

    EtOH.effect<- lm(AFDM~ Type*Season, data= EtOH)
    anova(EtOH.effect)
    logEtOH.effect<- lm(log10(AFDM[-21])~ Type[-21]*Season[-21], data= EtOH)
    anova(logEtOH.effect)
# Plot of Treatment effect 
plot(0,0, type ="n", ylim = c(0, 500), xlim = c(1, 10))
points(AFDM[EtOH$Type == "Control"], col = 1)
points(AFDM[EtOH$Type == "Treatment"], pch = 16)

## Effect of Season
plot(log10(AFDM) ~ Season, data = EtOH)

##plot of treatment effect
  plot(AFDM ~ Type, data= EtOH)

#plot of treatment effect by season
   plot(AFDM[-21] ~ Type[-21], data= EtOH, subset= Season == "Fall")
   plot(AFDM ~ Type, data= EtOH, subset= Season == "Summer")

##plot by site
   plot(AFDM[-21] ~ Location[-21], data= EtOH, subset= Season =="Fall")


  