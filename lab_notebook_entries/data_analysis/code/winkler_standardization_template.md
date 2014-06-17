# Calculation of standardization for Winkler Titration

## Date of Run 

INSERT DATE HERE

## Metadata

### Collected by:

AG, KP

### Created on:

### Modified:

### Affiliation:

Longwood University

### Description: 

The code for the calculation of the standardization variables for the winkler titrations.

## R Code

### Data entry

    stds <- c(STD1, STD2, STD3)
    blank.first <- c(BLK1, BLK2, BLK3)
    blank.second <- c(BLK1, BLK2, BLK3)
    Vstd <- volume of KIO3
    MnCl.vol <- MnCl volume used
    NaI.vol <- NaI volume used
    Nstd <- normality of KIO3
    E <- 5598

### Calculations

    Rstd <- mean(stds)
    Rblk <- mean(blank.first - blank.second)
    Vreg <- sum(MnCl.vol, NaI.vol)

## Output

    std <- data.frame(Rstd, Rblk, Vstd, Nstd, E, Vreg)

    write.table <- (std, "./data/winkler_standardization_data.txt", quote = F, row.names = F, sep = "\t")


