# Leaf Decomposition Experiment
## Fall 2013

### Introduction

This code is for the analysis of the loss of dry mass during decomposition during the leaf decomposition experiment.

The lab and field notes can be found in the `lab_notebood_entries` directory.

The data collection is not complete for this experiment so these data are preliminary.

### Code

#### Import Data

    leaf <- read.delim("./data/leaf_dry_mass_fall2013.txt", header = T, stringsAsFactors = F)

##### Data Structure and Metadata

~~~~

str(leaf)

str(leaf)
'data.frame':	211 obs. of  7 variables:
 $ lake                 : chr  "Campus Pond" "Campus Pond" "Campus Pond" "Campus Pond" ...
 $ sample               : int  1 2 3 4 5 6 7 8 9 10 ...
 $ date_collected       : chr  "" "10/22/2013" "" "" ...
 $ bag_weight_dry       : num  NA 7.28 NA NA NA ...
 $ bag_weight_collection: num  NA 11.5 NA NA NA ...
 $ calculated_difference: num  0 4.27 0 0 0 ...
 $ proportion_loss      : num  1 0.146 1 1 1 ...

~~~~

* lake = the name of the pond
* sample = the identifying number on the bag
* date_collected = the day that the bag was removed from the pond
* bag_weight_dry = the mass of the empty paper bag (g)
* bag_weight_collection = the mass of the bag + leaves after 48+ of drying at 50 dC (g)
* calculated_difference = the change in mass of the leaves from the previous date (g) [not sure of the formula]
* proportion_loss = the proportion of mass change [not sure of the formula]

#### Data Cleaning and Manipulations

I am removing the two calculated variables

    leaf <- leaf[ ,-c(6, 7)]

##### Output

~~~~

str(leaf)
'data.frame':	211 obs. of  5 variables:
 $ lake                 : chr  "Campus Pond" "Campus Pond" "Campus Pond" "Campus Pond" ...
 $ sample               : int  1 2 3 4 5 6 7 8 9 10 ...
 $ date_collected       : chr  "" "10/22/2013" "" "" ...
 $ bag_weight_dry       : num  NA 7.28 NA NA NA ...
 $ bag_weight_collection: num  NA 11.5 NA NA NA ...

~~~~

#### Calculate Variables

* `leaf_mass` = the mass of the dried leaves

    leaf_mass <- leaf$bag_weight_collection - leaf$bag_weight_dry

* `days_incubated` = the number of days the leaves were in the pond

    calc.days.incubated <- function(x){
      for (i in leaf$date_collected) {
        if (date_collected == ""){
          days_incubated <- c(days_incubated, NA)
        } else (date_collected == "10/22/2013"){
          days_incubated <- c(days_incubated, 0)
        } else (date_collected == "10/25/2013"){
          days_incubated <- c(days_incubated, 3)
        } else (date_collected == "10/29/2013"){
          days_incubated <- c(days_incubated, 7)
        }
      }
    }
        

