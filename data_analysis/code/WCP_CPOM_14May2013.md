# CPOM Data on Woodland Court Pond 14 May 2013 Sampling

## Metadata

Collected by: Kenneth Fortino and Leanna Tacik

Collected on: 14 May 2013

Affiliation: Longwood University

Location: Woodland Court Pond, Farmville, VA.  The pond is N of Milnwood Rd, N of Woodland Ct adjacent to the condo parking lot.

Description: 

* Data represent the mass of CPOM fragments greater than 1mm for CPOM
mass calculations removed from Ekman samples that were washed through
250 &mu;m mesh.
* CPOM dried at 50^o^ C. 


Created: 30 May 2013

Modified:

31 May 2013
KF, added missing dry mass for Littoral samples A-2 : C-2
KF, added surface area estimate to data set
KF, corrected metadat definition of lake name

### Variables:

* lake = the abbreviated name of the lake
    * WCP = Woodland Court Pond

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

lake <- rep("WCP", 12)
sa <- rep(3230, 12)
samp <- c(rep("open", 6), rep("lit", 6))
site <- rep(c(rep("A", 2), rep("B", 2), rep("C", 2)), 2)
depth <- c(2.2, 2.2, 1.6, 1.6, 1.4, 1.4, 1.3, 1.3, 0.6, 0.6, 1.2, 1.2)
repl <- rep(c(1, 2), 6)
dish.bag.mass <- c(7.0451, 7.0563, 7.0587, 7.0636, 7.0699, 7.0640, 7.0589, 7.0539, 7.0573, 7.0575, 7.0568, 7.3348)
dish.bag.OM <- c(7.2934, 7.1318, 7.7317, 7.2219, 7.2741, 7.4561, 7.3095, 8.1344, 8.2084, 8.5733, 12.9911, 25.2328)
CPOM.ekman <- dish.bag.OM - dish.bag.mass
CPOM <- CPOM.ekman / 0.0225

# Create Data Frame for WCP CPOM
WCP.CPOM <- data.frame(lake, sa, samp, site, depth, repl, dish.bag.mass, dish.bag.OM, CPOM.ekman, CPOM, stringsAsFactors = F)

# Save data table
write.table(WCP.CPOM, file = "./data/WCP_CPOM_14May2013.txt", row.names = F, quote = F, sep = "\t")

## Output


