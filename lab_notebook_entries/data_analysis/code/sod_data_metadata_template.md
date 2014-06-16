# CPOM Flux Experiment Sediment Oxygen Demand Data

## INSERT SAMPLING DATE

## Metadata

Collected by: 

Collected on: 

Affiliation: Longwood University

Description: 

These data were collected to measure sediment oxygen demand in the CPOM Flux Experiment. 100 ml of sediments from Lancer Park Pond were incubated with or without 20 tulip poplar leaf disks and with or without nutrient (NO3, NH4, and PO4) additions in 300 ml BOD bottles. To measure SOD, the DO concentration was measured at T0 and then the bottles were sealed without air and the DO concentration was measured at TF.  DO was measured using Winkler Titrations.

Created: 

Modified:

### Variables:

* bod = the identifying number of the BOD bottle
* vial = the identifying number of the 10 ml vial used to collect water
* treat = the code identifying the treatments
    * C0 = CPOM + ambient nutrients
    * CN = CPOM + elevated nutrients
    * 00 = no CPOM + ambient nutrients
    * 0N = no CPOM + elevated nutrients
* temp = the incubation temperature (K)
* pressure = the atmospheric pressure (atm)
* time0 = the time that the bottle was sealed
* RmeasT0 = sample titration buret reading at time 0 (ml)
* Rblk = difference between 1st and 2nd blank titration buret readings (ml)
* Rstd = standardization titration buret reading (ml)
* Vstd = volume of KIO3 standard (ml)
* Vb = sample volume (ml)
* Vreg = volume of sample displaced by reagents (ml)
* Nstd = normality of KIO3 standard (eq/L)
* E = 5,598 ml O2 / equivalent 
* DOreg = oxygen added with reagents (ml) = 0.018 ml/L O2 per 1 ml of MnCl
* timeF = the time that the BOD bottle was sampled after the incubation.
* RmeasTF = the sample titration buret reading at time F (ml)
* A = the area of the sediments in the BOD bottle (m2)
* Sampvol = the total volume of sample removed from the BOD bottle (L)
* Replconc = the concentration of oxygen in the replacement water (mmol/L)
* Replvol = the volume of water added back in to the BOD bottle before it is sealed (L)
* BODwatervol = the total volume of water in the BOD bottle (L)

## Output File Name

    cpom_flux_sod_date.txt
