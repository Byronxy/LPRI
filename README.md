
<!-- README.md is generated from README.Rmd. Please edit that file -->

# LPRI

<!-- badges: start -->
<!-- badges: end -->

“LuProgRegu Index” (LPRI) is an algorithm to calculate an index to help
lung cancer patients’ prognostic stratification from regulons

![workflow.png](https://github.com/Richard-Li-lab-team/LPRI/blob/master/pic/workflow.png?raw=true)

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

    # install.packages("devtools")
    devtools::install_github("Richard-Li-lab-team/LPRI")

``` r
if (!require("GSVA")) BiocManager::install("GSVA")
#> Loading required package: GSVA
```

## Example

``` r
library(LPRI)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
```

### load data

``` r
# load data required for calculate the LPRI score
load(paste0(system.file("extdata", package = "LPRI"),"/sysdata.rda"))
```

``` r
# load gene expression profile and you can prepare you own
# here is the example data
load(paste0(system.file("extdata", package = "LPRI"),"/genes_expr.rda"))
genes_expr[1:5,1:5]
#>          GSM773540 GSM773541 GSM773542 GSM773543 GSM773544
#> HES4      6.653416  3.903760  7.282034  6.859125  6.872071
#> AGRN      9.589176  9.128973  9.196498  9.129542  8.162682
#> TNFRSF18  7.050105  6.572753  6.458297  6.721626  6.705704
#> TNFRSF4   3.989532  6.951755  3.014087  2.670102  5.517663
#> B3GALT6  11.005699 10.292961 10.702499 11.034827 10.480836
```

### Run LPRI with one line

``` r
Sample_risk <- runLPRI(genes_expr)
#> Estimating GSVA scores for 17 gene sets.
#> Estimating ECDFs with Gaussian kernels
#>   |                                                                              |                                                                      |   0%  |                                                                              |====                                                                  |   6%  |                                                                              |========                                                              |  12%  |                                                                              |============                                                          |  18%  |                                                                              |================                                                      |  24%  |                                                                              |=====================                                                 |  29%  |                                                                              |=========================                                             |  35%  |                                                                              |=============================                                         |  41%  |                                                                              |=================================                                     |  47%  |                                                                              |=====================================                                 |  53%  |                                                                              |=========================================                             |  59%  |                                                                              |=============================================                         |  65%  |                                                                              |=================================================                     |  71%  |                                                                              |======================================================                |  76%  |                                                                              |==========================================================            |  82%  |                                                                              |==============================================================        |  88%  |                                                                              |==================================================================    |  94%  |                                                                              |======================================================================| 100%
```

``` r
head(Sample_risk)
#>           Risk_subgroup     LPRI       CREB3       HOXC9      HDAC2       XBP1
#> GSM773540          High 0.842585 -0.03356979 -0.10717254 0.06598811 0.08407326
#> GSM773541          High 2.580867  0.19669976  0.06013602 0.42772266 0.34000403
#> GSM773542          High 2.728034  0.30574107 -0.32086922 0.34136444 0.34454039
#> GSM773543          High 2.826515  0.28676843 -0.06045523 0.31302579 0.30071139
#> GSM773544          High 2.045391  0.28791697 -0.13929613 0.22728829 0.29663632
#> GSM773545          High 1.229202  0.10160781  0.17080506 0.16388966 0.13756607
#>                PRDM16          HLF       PPARG        MAFF        SP6
#> GSM773540  0.57171297  0.276527524 -0.06492422 -0.05062570  0.3470341
#> GSM773541 -0.14624173 -0.234207315  0.67303760 -0.02290026 -0.3616213
#> GSM773542 -0.13816097  0.033455706  0.50275924 -0.02359293  0.2068804
#> GSM773543  0.22267371 -0.006837051 -0.22858743 -0.21025947  0.1623654
#> GSM773544  0.42919545  0.283416948  0.54718064  0.04403181  0.1752060
#> GSM773545 -0.05400268 -0.175578939  0.57609028  0.15665927 -0.1634231
#>                 MAFK       TEAD4     FOSL1       KLF16       DLX2      NPAS2
#> GSM773540 0.18275834  0.26300801 0.2297406  0.17387206 -0.5288176 0.52114949
#> GSM773541 0.16603099 -0.45088472 0.3702004  0.33142587  0.3931181 0.02501231
#> GSM773542 0.16978301  0.09088876 0.4287179  0.26240536 -0.5611053 0.34594259
#> GSM773543 0.18912735  0.46882738 0.2747302  0.10538252  0.1779930 0.83411467
#> GSM773544 0.26789747  0.36253634 0.3230945  0.11306148  0.5930327 0.02346127
#> GSM773545 0.07047889  0.12370004 0.1644147 -0.08482584 -0.3206728 0.23042737
#>                    E2F7        WT1
#> GSM773540 -0.0005412282 -0.2429986
#> GSM773541  0.4890692755 -0.3750415
#> GSM773542  0.1416913390 -0.2521748
#> GSM773543 -0.1227983358 -0.4518235
#> GSM773544 -0.4820723840 -0.1682996
#> GSM773545  0.1210554985 -0.5395216
```

## Citation

Please cite: Yi Xiong, Yihao Zhang et al., Integration of single-cell
regulon atlas and multi-omics data for prognostic stratification and
personalized treatment prediction in human lung adenocarcinoma
(Manuscript in submission)
