
# Prepare workspace -------------------------------------------------------

## Load libraries
library(data.table)
library(skimr)
library(gtsummary)

## Load data
data("ice_data")


# Descriptives ------------------------------------------------------------

skim(ice_data)

#> ── Data Summary ────────────────────────
#>                            Values
#> Name                       ice_data
#> Number of rows             18
#> Number of columns          26
#> Key                        NULL
#> _______________________
#> Column type frequency:
#>   factor                   3
#>   numeric                  23
#> ________________________
#> Group variables            None
#>
#> ── Variable type: factor ────────────────────────────────────────────────────────────────────────────────────
#>   skim_variable n_missing complete_rate ordered n_unique top_counts
#> 1 sexo                  0         1     FALSE          2 fem: 10, mal: 8
#> 2 bai_cat               3         0.833 FALSE          2 Muy: 14, Mod: 1, Sev: 0
#> 3 bdi_cat               0         1     FALSE          2 Min: 16, Dep: 2, Dep: 0, Dep: 0
#>
#> ── Variable type: numeric ───────────────────────────────────────────────────────────────────────────────────
#>    skim_variable      n_missing complete_rate     mean       sd     p0    p25     p50      p75    p100 hist
#>  1 edad                       0         1       39.1      9.04   29     32.2    36.5    43.5     60    ▇▃▃▂▁
#>  2 bp_systolic                0         1      125.      16.7   100    112.    122.    135      158    ▅▇▂▃▃
#>  3 bp_diastolic               0         1       77.8     10.1    62     69.5    77.5    84       96    ▇▇▆▇▆
#>  4 hsps_score                 0         1       74.4     15.8    42     67      71      87.8    106    ▁▇▇▇▁
#>  5 bai_score                  0         1        4.61     6.01    0      1.25    2.5     5.5     22    ▇▂▁▁▁
#>  6 bdi_score                  0         1        5.89     5.65    1      2       3.5     8.75    19    ▇▂▂▁▂
#>  7 body_water                 0         1       57.6      6.06   47.3   53.3    58.4    61.2     67.3  ▅▅▆▇▅
#>  8 bone_mass                  0         1        2.95     0.662   2.1    2.32    2.9     3.45     4.1  ▇▃▅▁▅
#>  9 visceral_fat               0         1        6.38     5.45    2      4       4.5     6       22.8  ▇▁▁▁▁
#> 10 tanita_weight              0         1       75.8     17.1    55.4   60.7    74.7    83.4    114.   ▇▇▇▁▂
#> 11 muscle_total               0         1       56.0     13.4    38.2   43.7    54.2    66.4     79.6  ▇▃▅▂▃
#> 12 talla                      0         1      169.      10.7   150    163     170.    176.     190    ▆▆▇▅▃
#> 13 fat_total                  0         1       22.4      8.92    9.4   16.4    20.4    29.8     36.9  ▃▇▃▂▅
#> 14 basal_mean_rr              3         0.833  911.     124.    637    837     892     991     1093    ▂▃▇▆▅
#> 15 basal_rmssd                3         0.833   38.7     17.6     9.2   27.6    37.1    46.6     77.4  ▃▇▇▂▃
#> 16 basal_pns                  3         0.833   -0.166    0.920  -2.24  -0.66   -0.31    0.465    1.6  ▁▂▇▅▂
#> 17 basal_mean_hr              3         0.833   67.1     10.1    55     60.5    67      71.5     94    ▇▅▅▁▁
#> 18 basal_stress_index         3         0.833   11.0      6.59    5.7    7.45    9      11       31.3  ▇▂▁▁▁
#> 19 basal_sns                  3         0.833    0.369    1.56   -1.18  -0.6     0.19    0.465    5.35 ▇▇▁▁▁
#> 20 basal_sdnn                 3         0.833   47.0     19.7    12.1   34.1    48.4    58.8     78.2  ▅▂▇▆▃
#> 21 basal_vlf                  3         0.833  139.     145.      9     50.5   112     166.     573    ▇▅▁▁▁
#> 22 basal_lf_2                 3         0.833 1695.    1435.     82    668.   1175    2300     5016    ▇▅▂▂▁
#> 23 basal_hf                   3         0.833  644.     577.     33    274.    556     749     2449    ▇▇▁▁▁


# tablas ------------------------------------------------------------------

gtsummary::theme_gtsummary_language("es")

var_labes <- list(
  edad ~ "Edad", bp_systolic ~ "Presión sistólica",
  bp_diastolic ~ "Presión diastólica", bai_score ~ "Puntaje BAI",
  bai_cat ~ "Categoría BAI", bdi_score ~ "Puntaje BDI",
  bdi_cat ~ "Categía BDI", body_water ~ "Agua corporal",
  bone_mass ~ "Masa ósea", visceral_fat ~ "Grasa visceral",
  tanita_weight ~ "Peso corporal", muscle_total ~ "Masa muscular",
  talla ~ "Estatura", fat_total ~ "Grasa corporal",
  basal_mean_rr ~ "Duración intervalo R-R", basal_rmssd ~ "RMSSD",
  basal_pns ~ "Índice PNS", basal_mean_hr ~ "FC media",
  basal_stress_index ~ "Índice Stress", basal_sns ~ "Índice SNS",
  basal_sdnn ~ "SDNN", basal_vlf ~ "VLF", basal_lf_2 ~ "LF",
  basal_hf ~ "HF"
)

tbl_data <- copy(ice_data)
tbl_data[, sexo := `levels<-`(sexo, c("Hombre", "Mujer"))]

tbl_overall <- tbl_summary(tbl_data[, -1L],
                           label = var_labes,
                           type = list(everything() ~ "continuous",
                                       bai_cat ~ "categorical",
                                       bdi_cat ~ "categorical"),
                           missing = "no",
                           statistic = list(all_continuous() ~ "{mean} ± {sd}"),
                           digits = list(all_continuous() ~ 1))
tbl_sex <- tbl_summary(tbl_data,
                       by = sexo,
                       label = var_labes,
                       type = list(everything() ~ "continuous",
                                   bai_cat ~ "categorical", bdi_cat ~ "categorical"),
                       missing = "no",
                       statistic = list(all_continuous() ~ "{mean} ± {sd}"),
                       digits = list(all_continuous() ~ 1)) |>
  add_difference(test = all_continuous() ~ "smd", include = all_continuous())

tbl_1 <- tbl_merge(tbls = list(tbl_overall, tbl_sex),
                   tab_spanner = c("**Global**", "**Sexo**"))

saveRDS(tbl_1, file = "docs/tbl_1.RDS")
