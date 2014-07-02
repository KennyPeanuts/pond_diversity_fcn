# Analysis of the spec scan results from the CPOM Flux Experiment - Summer 2014

## Purpose

This code it to analyze the spec scan data from the treatments with and without CPOM and/or nutrients

## Import data

    spec10 <- read.table("./data/cpom_flux_spec_10jun2014.csv", header = T, sep = ",")
    spec12 <- read.table("./data/cpom_flux_spec_12jun2014.csv", header = T, sep = ",")
    spec17 <- read.table("./data/cpom_flux_spec_17jun2014.csv", header = T, sep = ",")
    spec24 <- read.table("./data/cpom_flux_spec_24jun2014.csv", header = T, sep = ",")
   # spec01 <- read.table("./data/cpom_flux_spec_01jul2014.csv", header = T, sep = ",")
    sod10 <- read.table("./data/cpom_flux_sod_10jun2014.csv", header = T, sep = ",") # imported to get treatment assignments to bod IDs
## Combine dates

    spec.all <- rbind(spec10, spec12, spec17, spec24)
    ## make date list
    day <- c(rep("2014-06-10", length(spec10$bod)), rep("2014-06-12", length(spec12$bod)), rep("2014-06-17", length(spec17$bod)), rep("2014-06-24", length(spec24$bod)))
    spec.tot <- data.frame(day, spec.all)

### Merge with treatments

    treat <- sod10[, c(1, 4, 5)]
    spec <- merge(treat, spec.tot, by.x = "bod", by.y = "bod")

## Data Analysis

### Calculate 254:365

    ratio254.abs <- spec$abs[spec$wl == 254] / spec$abs[spec$wl == 365]
    bod254 <- spec$bod[spec$wl == 254]
    CPOM254 <- spec$CPOM[spec$wl == 254]
    Nutrient254 <- spec$Nutrient[spec$wl == 254]
    day254 <- spec$day[spec$wl == 254]
    ratio254 <- data.frame(bod254, day254, CPOM254, Nutrient254, ratio254.abs)
    names(ratio254) <- c("bod", "day", "CPOM", "nutrient", "ratio254")

    elapsed10 <- as.numeric(difftime(ratio254$day[ratio254$day == "2014-06-10"], ratio254$day[ratio254$day == "2014-06-10"], units = "days"))
    elapsed12 <- as.numeric(difftime(ratio254$day[ratio254$day == "2014-06-12"], ratio254$day[ratio254$day == "2014-06-10"], units = "days"))
    elapsed17 <- as.numeric(difftime(ratio254$day[ratio254$day == "2014-06-17"], ratio254$day[ratio254$day == "2014-06-10"], units = "days"))
    elapsed24 <- as.numeric(difftime(ratio254$day[ratio254$day == "2014-06-24"], ratio254$day[ratio254$day == "2014-06-10"], units = "days"))
    elapsed.d <- c(elapsed10, elapsed12, elapsed17, elapsed24)

## Graphical Analysis

    plot(ratio254 ~ day, data = ratio254, subset = CPOM == "yes", ylim = c(0, 20), main = "CPOM", col = 8)
    dev.copy(png, "./output/plots/cpom_flux_ratio254_by_day_CPOM.png")

![ratio254 by day with CPOM](../output/plots/cpom_flux_ratio254_by_day_CPOM.png)

_ratio254 by day with CPOM_

    plot(ratio254 ~ day, data = ratio254, subset = CPOM == "no", ylim = c(0, 20), main = "NO-CPOM", col = 8)
    dev.copy(png, "./output/plots/cpom_flux_ratio254_by_day_noCPOM.png")

![ratio254 by day with CPOM](../output/plots/cpom_flux_ratio254_by_day_noCPOM.png)

_ratio254 by day with no CPOM_
    
    interaction.plot(ratio254$day, ratio254$CPOM, ratio254$ratio254, fun = "mean", xlab = "day", ylab = "ratio of absorbance at 254 to 365 nm", trace.label = "CPOM")
    dev.copy(png, "./output/plots/cpom_flux_ratio254_by_day_interaction.png")

![ratio254 by day with CPOM](../output/plots/cpom_flux_ratio254_by_day_interaction.png)

_ratio254 by day interaction_
