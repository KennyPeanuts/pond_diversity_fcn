# Metadata and code cleaning for spec scans from the CPOM Flux Experiment


## Data Import

     bod1 <- read.table("./data/spec_scans/bod1_10jun.csv", header = T, sep = ",")
     bod2 <- read.table("./data/spec_scans/bod2_10jun.csv", header = T, sep = ",")
     bod3 <- read.table("./data/spec_scans/bod3_10jun.csv", header = T, sep = ",")
     bod4 <- read.table("./data/spec_scans/bod4_10jun.csv", header = T, sep = ",")
     bod5 <- read.table("./data/spec_scans/bod5_10jun.csv", header = T, sep = ",")
     bod6 <- read.table("./data/spec_scans/bod6_10jun.csv", header = T, sep = ",")
     bod7 <- read.table("./data/spec_scans/bod7_10jun.csv", header = T, sep = ",")
     bod8 <- read.table("./data/spec_scans/bod8_10jun.csv", header = T, sep = ",")
     bod9 <- read.table("./data/spec_scans/bod9_10jun.csv", header = T, sep = ",")
     bod10 <- read.table("./data/spec_scans/bod10_10jun.csv", header = T, sep = ",")
     bod11 <- read.table("./data/spec_scans/bod11_10jun.csv", header = T, sep = ",")
     bod12 <- read.table("./data/spec_scans/bod12_10jun.csv", header = T, sep = ",")
     bod13 <- read.table("./data/spec_scans/bod13_10jun.csv", header = T, sep = ",")
     bod14 <- read.table("./data/spec_scans/bod14_10jun.csv", header = T, sep = ",")
     bod15 <- read.table("./data/spec_scans/bod15_10jun.csv", header = T, sep = ",")
     bod16 <- read.table("./data/spec_scans/bod16_10jun.csv", header = T, sep = ",")
     bod17 <- read.table("./data/spec_scans/bod17_10jun.csv", header = T, sep = ",")
     bod18 <- read.table("./data/spec_scans/bod18_10jun.csv", header = T, sep = ",")

## Combine all BOD bottles into 1 file

     spec.all <- rbind(bod1, bod2, bod3, bod4, bod5, bod6, bod7, bod8, bod9, bod10, bod11, bod12, bod13, bod14, bod15, bod16, bod17, bod18)

     ## Create Labels for bod bottles
     bod <- rep(1:18, 651)
     bod <- sort(bod)

     ## Create new data.frame with bod lables and only abs and wavelength columns
     spec.trunk <- spec.all[, 1:2]
     spec <- data.frame(bod, spec.trunk)
     names(spec) <- c("bod", "wl", "abs")
