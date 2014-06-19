# Data for the calculation of the DO of the replacement water in the CPOM Flux experiment

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

The code for the calculation of the DO in the replacement water in the CPOM Flux Experiment

## R Code

### Data entry

    Nutrient <- c("no", "yes")
    date <- c("y-m-d", "y-m-d")
    vial <- c(17, 34)
    Rmeas <- c(volume of titrant)
    
## Output

    repl <- data.frame(Nutrient, date, vial, Rmeas)

    write.table <- (std, "./data/repl_water_DATE.csv", quote = F, row.names = F, sep = ",")


