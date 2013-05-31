# CPOM Data on Daulton Pond 13 May 2013 Sampling

## Metadata

Collected by: Kenneth Fortino and Leanna Tacik

Collected on: 13 May 2013

Affiliation: Longwood University

Location: Daulton Pond, Farmville, VA.  The pond is N of Milnwood Rd, opposite Scott Dr.

Description: 

* Data represent the mass of CPOM fragments greater than 1mm for CPOM
mass calculations removed from Ekman samples that were washed through
250 &mu;m mesh.
* CPOM dried at 50^o^ C. 


Created: 30 May 2013

Modified:

31 May 2013,
KF, added dry mass of CPOM for Littoral B-1
KF, added surface area estimation to dataset

### Variables:

* lake = the abbreviated name of the lake
    * DP = Daulton Pond

* sa = surface area (m^2^): estimated by measuring L X W on google maps

* samp = the type of sample collected
    * open = away from shore
    * lit = littoral, approx 10 m from shore

* depth = the water depth at the sample location (m)

* repl = the replicate code

* dish.bag.mass = the initial mass of the weighing dish or paper bag (g)

* dish.bag.OM = the mass of the weighing dish or bag + the mass of the dried CPOM (g)

* CPOM.ekman = the mass of the CPOM in the ekman sample (g (0.0225 m)^-2^)

* CPOM = the mass of the CPOM normalized to a sq meter (g m^-2^)

## R Code

~~~~~~~~
# Generate Variable and Enter Data

lake <- rep("DP", 12)
sa <- rep(5766, 12)
samp <- c(rep("open", 6), rep("lit", 6))
site <- rep(c(rep("A", 2), rep("B", 2), rep("C", 2)), 2)
depth <- c(3.2, 3.2, 3.1, 3.1, 1.9, 1.9, 1.5, 1.5, 0.9, 0.9, 1.5, 1.5)
repl <- rep(c(1, 2), 6)
dish.bag.mass <- c(7.0536, 7.0629, 7.0574, 7.0600, 7.0584, 7.0614, 7.0620, 7.0642, 7.1773, 7.2978, 7.0605, 7.0561)
dish.bag.OM <- c(7.4395, 7.7112, 7.5408, 7.5414, 7.3178, 7.2328, 8.3886, 8.5745, 25.9545, 53.8663, 9.0551, 8.3004)
CPOM.ekman <- dish.bag.OM - dish.bag.mass
CPOM <- CPOM.ekman / 0.0225

# Create Data Frame for DP CPOM

DP.CPOM <- data.frame(lake, sa, samp, site, depth, repl, dish.bag.mass, dish.bag.OM, CPOM.ekman, CPOM, stringsAsFactors = F)

# Save data table

write.table(DP.CPOM, file = "./data/DP_CPOM_13May2013.txt", row.names = F, quote = F, sep = "\t")

## Output

