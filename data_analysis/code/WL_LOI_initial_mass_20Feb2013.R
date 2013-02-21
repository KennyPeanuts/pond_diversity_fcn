##########################################################################################
#
# Initial Mass Data for Wilkes Lake LOI
# Kenneth Fortino
# Longwood University
# created 21 Feb 2013
# modified -
# data represent the inital mass of scinitlation vials that will be filled with sediment for LOI calculations
#
##########################################################################################

lake <- rep("WL", 9)
site <- c(rep("littoral", 3), rep("open", 3), rep("deep", 3))
depth <- c(rep(1.9, 3), rep(2.0, 3), rep(NA, 3))
repl <- rep(c("A", "B", "C"), 3)
init.mass <- c(13.1875, 13.2355, 13.3609, 13.2247, 13.2464, 13.3428, 13.2874, 13.2378, 13.4083)
WL.LOI.20Feb2013 <- data.frame(lake, site, depth, repl, init.mass, stringsAsFactors = F)
write.table(WL.LOI.20Feb2013, "./data/WL_LOI_20Feb2013.txt", quote=F, row.names=F)
