#Analysis of the correlation between CPOM mass and Bugs in WL and LPP

##Introduction

Running an analysis of the density of macroinvertebrates by CPOM mass.

##Data Import

###Importing the bug data set

    Bugs<- read.delim("./data/WL_LPP_bugs_sp13.txt", header=T, sep=" ")
    
###Importing CPOM data set

    CPOM<-read.delim("./data/WL_LPP_OM_sp13.txt", header=T, sep=" ")
    
##Analysis

###Plot of CPOM against Bug density

Plot of Bugs in WL

    par(mar=c(5,10,5,10))
    plot(Bugs$bugs[Bugs$lake =="WL"] ~ CPOM$CPOM[CPOM$lake == "WL"], xlab= expression(paste("CPOM Mass (g m"^{-2},")")), ylab= expression(paste("Macroinvertebrates (n m"^{-2},")")), pch= 16, ylim= c(0,10000))

Plot of Bugs in LPP

    par(mar=c(5,10,5,10))
    plot(Bugs$bugs[Bugs$lake =="LPP"] ~ CPOM$CPOM[CPOM$lake == "LPP"], xlab= expression(paste("CPOM Mass (g m"^{-2},")")), ylab= expression(paste("Macroinvertebrates (n m"^{-2},")")), pch= 16, ylim= c(0,10000))
    