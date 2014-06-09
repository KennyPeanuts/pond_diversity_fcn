# Lab Notes for CPOM Flux Experiment Nutrient Addition Calculations

## Date

* created:  9 June 2014

* modified: 

## Author

KF

## Purpose

These calculations are to determine the amount of stock nutrient solution that we need to add to the replacement water for the nutrient added treatments of the CPOM Flux Experiment.

The pond water showed below detection nutrient concentrations for NO3, NH4 and orthophosphate using the Hach tests but these have quite high detection limits.  The detection limits for NO3, NH4, and orthophosphate are: `8.8`, `0.2`, and `0.2` mg/L, respectively.

During my discussion with Vlad Gulis at JASM, he suggested that DIN concentrations greater than `300 ug/L` and SRP concentrations greater than `30 ug/L` would be saturating to the fungal response in streams. 

Given this, I am setting the target concentrations to these levels.


## Calculations

### DIN

    (Vt / Ct) = (Vs / Cs)

* Vt = the volume of the treatment bottle (L)
* Ct = the target concentration of the treatment bottle (g/L)
* Vs = the volume of the stock added to the treatment (L)
* Cs = the concentration of the stock solution (g/L)

To calculate the concentration of stock needed this gets rearranged to:

    Cs = (CtVt)/Vt

So to get a target solution of 300 ug/L, which equals 300 ug/L * 1 g/1000000 ug = 0.0003 g/L DIN we would need:

    Cs = (0.0003 * 1) / 0.001 = 0.3 g/L DIN

The molecular weight of NH4NO3 = 80.052 g/mol

The molecular weight of N = 14 g/mol

Since NH4NO3 has 2 N, the N weighs 28 g/mol

Thus the N is `35%` of the mass of the NH4NO3

    28 / 80.052 = 0.35 

So to get 0.3 g/L, we need to dissolve `0.857 g` NH4NO3 into 1 L of di water

    0.35x = 0.3 --> x = 0.3/0.35 = 0.857


