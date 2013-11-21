# Leaf Decomposition Experiment
## Fall 2013

### Introduction

This code is for the analysis of the loss of dry mass during decomposition during the leaf decomposition experiment.

The lab and field notes can be found in the `lab_notebook_entries` directory.

The data collection is not complete for this experiment so these data are preliminary.

### Code

#### Import Data

    leaf <- read.delim("./data/leaf_dry_mass_fall2013.txt", header = T, stringsAsFactors = F)

##### Data Structure and Metadata

~~~~

str(leaf)

'data.frame':	210 obs. of  6 variables:
 $ lake    : chr  "Campus Pond" "Campus Pond" "Campus Pond" "Campus Pond" ...
 $ sample  : int  2 8 15 33 48 9 22 35 43 67 ...
 $ date_col: chr  "22-Oct-13" "22-Oct-13" "22-Oct-13" "22-Oct-13" ...
 $ bag     : num  7.28 7.28 7.23 7.24 7.25 ...
 $ bag_leaf: num  11.5 11.8 11.6 11.8 11.8 ...
 $ days    : int  0 0 0 0 0 3 3 3 3 3 ...
 
~~~~

* lake = the name of the pond
* sample = the identifying number on the bag
* date_col = the day that the bag was removed from the pond
* bag = the mass of the empty paper bag (g)
* bag_leaf = the mass of the bag + leaves after 48+ of drying at 50 dC (g)
* days = the number of days the bag was in the lake

#### Calculate Variables

* leaf_mass = the mass of the dried leaves (g)

    leaf_mass <- leaf$bag_leaf- leaf$bag

#### Plot initial curves for each pond

##### Campus Pond

All ponds together

    par(las = 1)
    plot(log(leaf_mass) ~ days, data = leaf, subset = lake == "Campus Pond")
    points(log(leaf_mass) ~ days, data = leaf, subset = lake == "Daulton Pond", col = 3)
    points(log(leaf_mass) ~ days, data = leaf, subset = lake == "Lancer Park Pond", col = 2)
    dev.copy(png, "./output/plots/All_leaf_22days.png")
    dev.off()

![Leaf mass remaining in all of the ponds after 22 days](../output/plots/All_leaf_22days.png)

Campus Pond
   
    par(las = 1)
    plot(log(leaf_mass) ~ days, data = leaf, subset = lake == "Campus Pond")
    text(10, 1.5, "Campus Pond")
    dev.copy(png, "./output/plots/CP_leaf_22days.png")
    dev.off()

![Leaf mass remaining in Campus Pond after 22 days](../output/plots/CP_leaf_22days.png)

Daulton Pond

    par(las = 1)
    plot(log(leaf_mass) ~ days, data = leaf, subset = lake == "Daulton Pond")
    text(10, 1.5, "Daulton Pond")
    dev.copy(png, "./output/plots/DP_leaf_22days.png")
    dev.off()

![Leaf mass remaining in Daulton Pond after 22 days](../output/plots/DP_leaf_22days.png)

Lancer Park Pond

    par(las = 1)
    plot(log(leaf_mass) ~ days, data = leaf, subset = lake == "Lancer Park Pond")
    text(10, 1.5, "Lancer Park Pond")
    dev.copy(png, "./output/plots/LPP_leaf_15days.png")
    dev.off()

![Leaf mass remaining in Lancer Park Pond after 15 days](../output/plots/LPP_leaf_15days.png)
 
