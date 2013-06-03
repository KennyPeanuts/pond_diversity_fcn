# Analysis of CPOM data for Wilcks Lake, Lancer Park Pond, Daulton Pond, and Woodland Court Pond

This analysis was conducted for the mid-summer PRISM research talks on 4 June 2013

## Import CPOM datasets

~~~~

# working directory = "/Volumes/NO NAME/working_files/current_research/pond_diversity_fcn/data_analysis"

# Import WL and LPP data from spring data collection
WL.LPP.CPOM <- read.delim("./data/WL_LPP_OM_sp13.txt", header = T, stringsAsFactors = F, sep = " ")

# Import DP data from summer data collection
DP.CPOM <- read.delim("./data/DP_CPOM_13May2013.txt", header = T, stringsAsFactors = F)

# Import WCP data from summer data collection
WCP.CPOM <- read.delim("./data/WCP_CPOM_14May2013.txt", header = T, stringsAsFactors = F)

# truncate and merge CPOM data from different lakes
# make data frame of only lake, samp, and CPOM with all lakes
DP.CPOM.trunk <- DP.CPOM[ , c(1, 2, 3, 5, 10)]
WCP.CPOM.trunk <- WCP.CPOM[ , c(1, 2, 3, 5, 10)]
WL.LPP.CPOM.trunk <- WL.LPP.CPOM[ , c(1, 12, 2, 4, 17)]
pond.CPOM <- rbind(WL.LPP.CPOM.trunk, DP.CPOM.trunk[-1, ], WCP.CPOM.trunk[-1, ])

~~~~

## Analysis of differences due to lake and site

~~~~

anova(lm(log10(CPOM) ~ as.factor(lake) * as.factor(samp), data = pond.CPOM))
plot(lm(log10(CPOM) ~ as.factor(lake) * as.factor(samp), data = pond.CPOM))

# without LPP
anova(lm(log10(CPOM) ~ as.factor(lake) * as.factor(samp), data = pond.CPOM, subset = lake != "LPP"))
plot(lm(log10(CPOM) ~ as.factor(lake) * as.factor(samp), data = pond.CPOM, subset = lake != "LPP"))

~~~~

### Plots of effects

~~~~

# not transformed
par(las = 1, mar = c(5, 5, 3, 3), cex.axis = 1.2, cex.lab = 1.5)
plot(CPOM/1000 ~ as.factor(lake), data = pond.CPOM, subset = samp == "open", ylim = c(0, 1.5), ylab = expression(paste("Leaf Litter Mass (kg m"^{-2}, ")")), xlab = "Lake", col = 8, axes = F)
plot(CPOM/1000 ~ as.factor(lake), data = pond.CPOM, subset = samp == "lit", add = T, col = 4, axes = F, ylab = " ", xlab = " ")
axis(2)
axis(1, c("Daulton", "Lancer Pk.", "Woodland Ct", "Wilck's"), at = c(1, 2, 3, 4))
box()
legend(3, 1.5, c("Littoral", "Open"), pch = 15, col = c(4, 8), cex = 2)

# not transformed w-o LPP
par(las = 1, mar = c(5, 5, 3, 3), cex.axis = 1.2, cex.lab = 1.5)
plot(CPOM/1000 ~ as.factor(lake), data = pond.CPOM, subset = samp == "open" & lake != "LPP", ylim = c(0, 0.3), ylab = expression(paste("CPOM Mass (kg m"^{-2}, ")")), xlab = "Lake", col = 8)
plot(CPOM/1000 ~ as.factor(lake), data = pond.CPOM, subset = samp == "lit" & lake != "LPP", add = T, col = 4, axes = F, ylab = " ", xlab = " ")

# ln trnasformed
par(las = 1, mar = c(5, 5, 3, 3), cex.axis = 1.5, cex.lab = 1.5)
plot(log(CPOM) ~ as.factor(lake), data = pond.CPOM, subset = samp == "open", ylim = c(0, 10), ylab = expression(paste("ln(CPOM Mass) (g m"^{-2}, ")")), xlab = "Lake", col = 8)
plot(log(CPOM) ~ as.factor(lake), data = pond.CPOM, subset = samp == "lit", add = T, col = 4, axes = F, ylab = " ", xlab = " ")

~~~~

## Analysis of differences in OM due to depth

~~~~~

plot(CPOM ~ depth, data = DP.CPOM, subset = samp == "lit", ylim = c(0, 2500), xlim = c(0, 5), pch = 16)
points(CPOM ~ depth, data = DP.CPOM, subset = samp == "open", pch = 1)
points(CPOM ~ depth, data = WCP.CPOM, subset = samp == "lit", pch = 16, col = 2)
points(CPOM ~ depth, data = WCP.CPOM, subset = samp == "open", pch = 1, col = 2)
points(CPOM ~ depth, data = WL.LPP.CPOM, subset = lake == "WL" & samp == "lit", pch = 16, col = 3)
points(CPOM ~ depth, data = WL.LPP.CPOM, subset = lake == "WL" & samp == "open", pch = 1, col = 3)
points(CPOM ~ depth, data = WL.LPP.CPOM, subset = lake == "LPP" & samp == "lit", pch = 16, col = 4)
points(CPOM ~ depth, data = WL.LPP.CPOM, subset = lake == "LPP" & samp == "open", pch = 1, col = 4)
legend(3, 2500, c("Daulton Lk", "Woodland Ct. Pond", "Wilck's Lk", "Lancer Pk. Pond"), pch = 16, col = c(1, 2, 3, 4))

plot(log(CPOM) ~ depth, data = DP.CPOM, subset = samp == "lit", ylim = c(0, 10), xlim = c(0, 5), pch = 16)
points(log(CPOM) ~ depth, data = DP.CPOM, subset = samp == "open", pch = 1)
points(log(CPOM) ~ depth, data = WCP.CPOM, subset = samp == "lit", pch = 16, col = 2)
points(log(CPOM) ~ depth, data = WCP.CPOM, subset = samp == "open", pch = 1, col = 2)
points(log(CPOM) ~ depth, data = WL.LPP.CPOM, subset = lake == "WL" & samp == "lit", pch = 16, col = 3)
points(log(CPOM) ~ depth, data = WL.LPP.CPOM, subset = lake == "WL" & samp == "open", pch = 1, col = 3)
points(log(CPOM) ~ depth, data = WL.LPP.CPOM, subset = lake == "LPP" & samp == "lit", pch = 16, col = 4)
points(log(CPOM) ~ depth, data = WL.LPP.CPOM, subset = lake == "LPP" & samp == "open", pch = 1, col = 4)
legend(3, 10, c("Daulton Lk", "Woodland Ct. Pond", "Wilck's Lk", "Lancer Pk. Pond"), pch = 16, col = c(1, 2, 3, 4))


#analysis of lake, depth, and site effect

anova(lm(log10(CPOM) ~ samp * log10(sa), data = pond.CPOM))


~~~~

## Annalysis of differences in CPOM within DP and WCP

~~~~

# plot as points not boxplot
# DP lit
par(las = 1)
par(mar = c(5, 5, 3, 3), cex.axis = 1.2, cex.lab = 1.5)
plot(0, 0, xlim = c(0, 4), ylim = c(0, 2.5), ylab = expression(paste("Leaf Litter Mass (kg m"^{-2}, ")")), xlab = "Littoral Sample Site w/in Daulton Lake", type = "n", axes = F)
points(CPOM/1000 ~ as.factor(site), data = DP.CPOM, subset = samp == "lit", col = 4, cex = 2, pch = 17)
axis(2)
axis(1, c("A", "B", "C"), at = c(1, 2, 3))
box()

# plot as points not boxplot
# WCP lit
par(las = 1)
par(mar = c(5, 5, 3, 3), cex.axis = 1.2, cex.lab = 1.5)
plot(0, 0, xlim = c(0, 4), ylim = c(0, 2.5), ylab = expression(paste("Leaf Litter Mass (kg m"^{-2}, ")")), xlab = "Littoral Sample Site w/in Woodland Ct. Pond", type = "n", axes = F)
points(CPOM/1000 ~ as.factor(site), data = WCP.CPOM, subset = samp == "lit", col = 4, cex = 2, pch = 17)
axis(2)
axis(1, c("A", "B", "C"), at = c(1, 2, 3))
box()

# plot as points not boxplot
# DP open
par(las = 1)
par(mar = c(5, 5, 3, 3), cex.axis = 1.2, cex.lab = 1.5)
plot(0, 0, xlim = c(0, 4), ylim = c(0, 30), ylab = expression(paste("Leaf Litter Mass (g m"^{-2}, ")")), xlab = "Littoral Sample Site w/in Daulton Lake", type = "n", axes = F)
points(CPOM ~ as.factor(site), data = DP.CPOM, subset = samp == "open", col = 4, cex = 2, pch = 17)
axis(2)
axis(1, c("A", "B", "C"), at = c(1, 2, 3))
box()

# plot as points not boxplot
# WCP open
par(las = 1)
par(mar = c(5, 5, 3, 3), cex.axis = 1.2, cex.lab = 1.5)
plot(0, 0, xlim = c(0, 4), ylim = c(0, 30), ylab = expression(paste("Leaf Litter Mass (g m"^{-2}, ")")), xlab = "Littoral Sample Site w/in Woodland Ct. Pond", type = "n", axes = F)
points(CPOM ~ as.factor(site), data = WCP.CPOM, subset = samp == "open", col = 4, cex = 2, pch = 17)
axis(2)
axis(1, c("A", "B", "C"), at = c(1, 2, 3))
box()


plot(CPOM/1000 ~ as.factor(site), data = DP.CPOM, subset = samp == "lit", ylim = c(0, 2.5), xlab = "Littoral Sample Site w/in Daulton Lake", ylab = expression(paste("Leaf Litter Mass (kg m"^{-2}, ")")), col = 4)

plot(CPOM ~ as.factor(site), data = DP.CPOM, subset = samp == "open", ylim = c(0, 30), xlab = "Open Sample Site w/in Daulton Lake", ylab = expression(paste("Leaf Litter Mass (g m"^{-2}, ")")), col = 4)

plot(CPOM/1000 ~ as.factor(site), data = WCP.CPOM, subset = samp == "lit", ylim = c(0, 2.5), xlab = "Littoral Sample Site w/in Woodland Ct. Pond", ylab = expression(paste("Leaf Litter Mass (kg m"^{-2}, ")")), col = 4)

plot(CPOM ~ as.factor(site), data = WCP.CPOM, subset = samp == "open", ylim = c(0, 30), xlab = "Open Sample Site w/in Woodland Ct. Pond", ylab = expression(paste("Leaf Litter Mass (g m"^{-2}, ")")), col = 4)

~~~~

## Rough Calculation of total CPOM mass in lakes

This is a very rough calculation of the total mass of CPOM in each of the ponds based on the SA of the pond and the density (g m^-2^) of CPOM in the pond.  I assumed that the littoral region made up 1% of the pond SA and the open was the remaining 99%.


~~~~

# DP

# calculation for littoral zone assuming littoral = 1% of total lake sa
DP.tot.lit.CPOM <- (DP.CPOM$sa * 0.01) * mean(DP.CPOM$CPOM[DP.CPOM$samp == "lit"])

# calculation for open zone assuming open = 99% of total lake sa
DP.tot.open.CPOM <- (DP.CPOM$sa * 0.99) * mean(DP.CPOM$CPOM[DP.CPOM$samp == "open"])

# lake total
DP.tot.CPOM <- DP.tot.lit.CPOM + DP.tot.open.CPOM

# WCP

# calculation for littoral zone assuming littoral = 1% of total lake sa
WCP.tot.lit.CPOM <- (WCP.CPOM$sa * 0.01) * mean(WCP.CPOM$CPOM[WCP.CPOM$samp == "lit"])

# calculation for open zone assuming open = 99% of total lake sa
WCP.tot.open.CPOM <- (WCP.CPOM$sa * 0.99) * mean(WCP.CPOM$CPOM[WCP.CPOM$samp == "open"])

# lake total
WCP.tot.CPOM <- WCP.tot.lit.CPOM + WCP.tot.open.CPOM

# WL

# calculation for littoral zone assuming littoral = 1% of total lake sa
WL.tot.lit.CPOM <- (WL.LPP.CPOM$sa[WL.LPP.CPOM$lake == "WL"] * 0.01) * mean(WL.LPP.CPOM$CPOM[WL.LPP.CPOM$samp == "lit" & WL.LPP.CPOM$lake == "WL"])

# calculation for open zone assuming open = 99% of total lake sa
WL.tot.open.CPOM <- (WL.LPP.CPOM$sa[WL.LPP.CPOM$lake == "WL"] * 0.99) * mean(WL.LPP.CPOM$CPOM[WL.LPP.CPOM$samp == "open" & WL.LPP.CPOM$lake == "WL"])

# lake total
WL.tot.CPOM <- WL.tot.lit.CPOM + WL.tot.open.CPOM

# LPP

# calculation for littoral zone assuming littoral = 1% of total lake sa
LPP.tot.lit.CPOM <- (WL.LPP.CPOM$sa[WL.LPP.CPOM$lake == "LPP"] * 0.01) * mean(WL.LPP.CPOM$CPOM[WL.LPP.CPOM$samp == "lit" & WL.LPP.CPOM$lake == "LPP"])

# calculation for open zone assuming open = 99% of total lake sa
LPP.tot.open.CPOM <- (WL.LPP.CPOM$sa[WL.LPP.CPOM$lake == "LPP"] * 0.99) * mean(WL.LPP.CPOM$CPOM[WL.LPP.CPOM$samp == "open" & WL.LPP.CPOM$lake == "LPP"])

# lake total
LPP.tot.CPOM <- LPP.tot.lit.CPOM + LPP.tot.open.CPOM

~~~~

