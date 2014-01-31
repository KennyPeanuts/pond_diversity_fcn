# Dataset of the CPOM and sediment LOI data from summer 2013
## for data file pond_OM

## Metadata

Collected by: Kenneth Fortino and Leanna Tacik

Collected on: Spring 2013

Location: Wilkes Lake, Woodland Court Pond, Daulton Pond, and Lancer Park Pond. Farmville Va

Description:

This dataset aggregates all of the information on the CPOM, CPOM AFDM, sediment LOI and other environmental variables from the summer pond OM survey.

Created:

30 Jan 2014

## Variables

* Lake = the name of the lake sampled (DL = Daulton Pond, WC = Woodland Court Pond, LPP = Lancer Park Pond, WL = Wilkes Lake)

* Sample = the location of the ekman sample (Littoral = approx 20 m from shore, Open = in the middle of the pond)

* Site = a designator for a unique location in the pond

* Rep = the ID of the replicate ekman samples taken at each Site

* Z = the depth of the water at the sample site (m)

* cruc.mass = the mass of the empty crucible for the sediment LOI determination (g)

* cruc.sed = the mass of the crucible + dry sediment for the sediment LOI determination (g)

* cruc.ash = the mass of the crucible + sediment after > 4 h at 550 dC for sediment LOI determination (g)

* dish.bag.mass = the mass of the empty petri dish or paper bag used for the CPOM mass determination (g)

* dish.bag.OM = the mass of the petri dish or paper bag + dry CPOM (g)

* CPOM.ekman = the mass of the CPOM in the ekman sample (g (0.0225 m)^-2)

* CPOM = the mass of the CPOM normalized to a sq meter (g m^-2)

* sa = the surface are of the lake determined by L X W from google maps (m^2)

* Date = the julian day of the sampling

* Year = the year of the sampling


## R Code

    pond.OM <- read.delim("./data/Ponddata.txt", header = T, stringsAsFactors = F)
                    
These data were already entered and I am just renaming the file.

## Make data file

    write.table(pond.OM, file = "./data/pond_OM_sp2013.txt", row.names = F, quote = F, sep = "\t")

## Output

~~~~

> pond.OM
   Lake   Sample Site Rep   Z cruc.mass cruc.sed cruc.ash dish.bag.mass
1    DL     Open    A   1 3.2   13.0660  13.1649  13.0731        7.0536
2    DL     Open    A   2 3.2   12.2416  12.4910  12.2588        7.0629
3    DL     Open    B   1 3.1   12.9962  13.1823  13.0386        7.0574
4    DL     Open    B   2 3.1   11.9882  12.1356  12.0140        7.0600
5    DL     Open    C   1 1.9   13.1347  13.2448  13.1881        7.0584
6    DL     Open    C   2 1.9   12.6360  12.7421  12.6380        7.0614
7    DL Littoral    A   1 1.5   13.0650  13.2283  13.0901        7.0620
8    DL Littoral    A   2 1.5   12.2414  12.4277  12.2943        7.0642
9    DL Littoral    B   1 0.9   12.9946  13.1946  13.0231        7.1773
10   DL Littoral    B   2 0.9   11.9891  12.4502  12.2124        7.2978
11   DL Littoral    C   1 1.5   12.1974  12.3038  12.2051        7.0605
12   DL Littoral    C   2 1.5   12.5996  12.6816  12.6050        7.0561
13   WC     Open    A   1 2.2   11.6670  11.7528  11.6693        7.0451
14   WC     Open    A   2 2.2   12.9362  12.9702  12.9381        7.0563
15   WC     Open    B   1 1.6   11.8881  11.9901  11.8998        7.0587
16   WC     Open    B   2 1.6   11.7819  11.9025  11.7901        7.0636
17   WC     Open    C   1 1.4   13.1344  13.2419  13.1725        7.0699
18   WC     Open    C   2 1.4   12.6367  12.8079  12.7170        7.0640
19   WC Littoral    A   1 1.3   13.0674  13.1416  13.0769        7.0589
20   WC Littoral    A   2 1.3   12.2409  12.3338  12.2506        7.0539
21   WC Littoral    B   1 0.6   12.9977  13.1435  13.0369        6.0573
22   WC Littoral    B   2 0.6   11.9883  13.1653  12.0411        6.0575
23   WC Littoral    C   1 1.2   12.1974  12.4681  12.2671        7.0568
24   WC Littoral    C   2 1.2   12.5997  12.8950  12.6718        7.3348
25  LPP Littoral    A   1 1.1   13.1324  14.2906  13.2501        7.0334
26  LPP Littoral    A   2 1.1   12.6352  13.7191  12.7528        6.9891
27  LPP Littoral    A   3 1.1   13.0656  13.9510  13.1516        7.1693
28  LPP     Open    A   1 1.0   12.2414  12.8805  12.2902        7.1048
29  LPP     Open    A   2 1.0   12.9957  13.8358  13.0794        7.0473
30  LPP     Open    A   3 1.0   11.9881  12.4456  12.0254        7.1103
31   WL Littoral    A   1 1.9   12.1975  12.4594  12.2302        1.9434
32   WL Littoral    A   2 1.9   12.5992  12.9492  12.6538        1.8294
33   WL Littoral    A   3 1.9   11.6667  11.9706  11.7319        1.8443
34   WL     Open    A   2 2.0   12.9352  13.1875  13.0307        1.8084
35   WL     Open    A   3 2.0   11.8886  12.1512  11.9597        1.7482
36   WL     Open    B   1 1.9   11.7819  12.0806  11.9202        1.7412
37   WL     Open    B   2 1.9   13.1348  13.2421  13.1487        1.8689
38   WL     Open    B   3 1.9   12.6358  12.8822  12.7164        1.7231
   dish.bag.OM CPOM.ekman        CPOM     sa Date Year
1       7.4395    0.38590   17.151110   5766  133 2013
2       7.7112    0.64830   28.813330   5766  133 2013
3       7.5408    0.48340   21.484444   5766  133 2013
4       7.5414    0.48140   21.395556   5766  133 2013
5       7.3178    0.25940   11.528889   5766  133 2013
6       7.2328    0.17140    7.617778   5766  133 2013
7       8.3886    1.32660   58.960000   5766  133 2013
8       8.5745    1.51030   67.124444   5766  133 2013
9      25.9545   18.77720  834.542222   5766  133 2013
10     53.8663   46.56850 2069.711111   5766  133 2013
11      9.0551    1.99460   88.648889   5766  133 2013
12      8.3004    1.24430   55.302222   5766  133 2013
13      7.2934    0.24830   11.035560   3230  134 2013
14      7.1318    0.07550    3.355556   3230  134 2013
15      7.7317    0.67300   29.911111   3230  134 2013
16      7.2219    0.15830    7.035556   3230  134 2013
17      7.2741    0.20420    9.075556   3230  134 2013
18      7.4561    0.39210   17.426667   3230  134 2013
19      7.3095    0.25060   11.137778   3230  134 2013
20      8.1344    1.08050   48.022220   3230  134 2013
21      8.2084    1.15110   51.160000   3230  134 2013
22      8.5733    1.51580   67.368889   3230  134 2013
23     12.9911    5.93430  263.746667   3230  134 2013
24     25.2328   17.89800  795.466667   3230  134 2013
25     36.5694   29.53600 1312.711110   1395   79 2013
26     12.7007    5.71160  253.848889   1395   79 2013
27     23.0556   15.88630  706.057778   1395   79 2013
28     12.3407    5.23590  232.706667   1395   79 2013
29      9.0054    1.95810   87.026667   1395   79 2013
30      8.4776    1.36730   60.768889   1395   79 2013
31      2.4342    0.49080   21.813333 194760   51 2013
32      2.4063    0.57690   25.640000 194760   51 2013
33      2.5529    0.70860   31.493333 194760   51 2013
34      2.2040    0.39560   17.582222 194760   51 2013
35      2.0725    0.03243   14.413333 194760   51 2013
36      2.0543    0.31310    7.195556 194760   58 2013
37      2.0235    0.15460    6.871111 194760   58 2013
38      3.3596    1.63650   72.733333 194760   58 2013

~~~~
