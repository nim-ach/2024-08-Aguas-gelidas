
# Prepare workspace -------------------------------------------------------

## Load libraries
library(data.table)
library(correlation)
library(dplyr)

## Import dataset
data("ice_data")

sig_cor <- correlation::correlation(ice_data, method = "spearman", p_adjust = "none") |>
  dplyr::filter(p < 0.05)

sig_cor
# Correlation Matrix (spearman-method)

#> Parameter1         |         Parameter2 |   rho |         95% CI |       S |         p
#> --------------------------------------------------------------------------------------
#> edad               |        basal_rmssd | -0.68 | [-0.89, -0.24] |  941.36 | 0.005**
#> edad               |         basal_sdnn | -0.66 | [-0.88, -0.20] |  927.31 | 0.008**
#> edad               | basal_stress_index |  0.65 | [ 0.19,  0.87] |  197.70 | 0.009**
#> edad               |           basal_hf | -0.66 | [-0.88, -0.21] |  930.32 | 0.007**
#> edad               |         basal_lf_2 | -0.56 | [-0.84, -0.05] |  875.13 | 0.029*
#> bp_systolic        |       bp_diastolic |  0.60 | [ 0.17,  0.84] |  386.30 | 0.008**
#> bp_systolic        |      tanita_weight |  0.63 | [ 0.22,  0.85] |  359.69 | 0.005**
#> bp_systolic        |              talla |  0.62 | [ 0.20,  0.85] |  367.07 | 0.006**
#> bp_systolic        |       muscle_total |  0.68 | [ 0.30,  0.88] |  306.66 | 0.002**
#> bp_systolic        |          bone_mass |  0.69 | [ 0.32,  0.88] |  300.27 | 0.002**
#> bp_diastolic       |       visceral_fat |  0.68 | [ 0.29,  0.87] |  313.62 | 0.002**
#> bai_score          |          bdi_score |  0.71 | [ 0.35,  0.89] |  282.03 | < .001***
#> bdi_score          |          fat_total |  0.55 | [ 0.09,  0.81] |  437.49 | 0.018*
#> bdi_score          |         body_water | -0.56 | [-0.82, -0.11] | 1512.64 | 0.015*
#> tanita_weight      |              talla |  0.84 | [ 0.61,  0.94] |  151.16 | < .001***
#> tanita_weight      |       muscle_total |  0.90 | [ 0.75,  0.96] |   94.00 | < .001***
#> tanita_weight      |          bone_mass |  0.90 | [ 0.73,  0.96] |  101.21 | < .001***
#> tanita_weight      |         basal_lf_2 | -0.57 | [-0.84, -0.07] |  882.00 | 0.025*
#> talla              |       muscle_total |  0.96 | [ 0.89,  0.99] |   38.04 | < .001***
#> talla              |          bone_mass |  0.96 | [ 0.90,  0.99] |   37.11 | < .001***
#> fat_total          |         body_water | -0.96 | [-0.99, -0.90] | 1902.00 | < .001***
#> muscle_total       |          bone_mass |  1.00 | [ 0.99,  1.00] |    2.00 | < .001***
#> muscle_total       |         basal_lf_2 | -0.52 | [-0.82,  0.00] |  852.00 | 0.046*
#> visceral_fat       |        basal_rmssd | -0.63 | [-0.87, -0.16] |  914.99 | 0.011*
#> visceral_fat       |          basal_sns |  0.55 | [ 0.04,  0.84] |  250.15 | 0.032*
#> visceral_fat       |          basal_pns | -0.55 | [-0.84, -0.04] |  869.85 | 0.032*
#> visceral_fat       |           basal_hf | -0.64 | [-0.87, -0.18] |  921.14 | 0.009**
#> basal_mean_rr      |      basal_mean_hr | -1.00 | [-1.00, -1.00] | 1119.50 | < .001***
#> basal_mean_rr      |          basal_sns | -0.86 | [-0.95, -0.61] | 1042.00 | < .001***
#> basal_mean_rr      |          basal_pns |  0.90 | [ 0.71,  0.97] |   56.00 | < .001***
#> basal_mean_hr      |          basal_sns |  0.86 | [ 0.61,  0.95] |   78.57 | < .001***
#> basal_mean_hr      |          basal_pns | -0.90 | [-0.97, -0.71] | 1063.45 | < .001***
#> basal_rmssd        |         basal_sdnn |  0.95 | [ 0.86,  0.99] |   26.00 | < .001***
#> basal_rmssd        |          basal_sns | -0.71 | [-0.90, -0.29] |  956.00 | 0.003**
#> basal_rmssd        |          basal_pns |  0.65 | [ 0.18,  0.87] |  198.00 | 0.009**
#> basal_rmssd        | basal_stress_index | -0.95 | [-0.98, -0.85] | 1092.00 | < .001***
#> basal_rmssd        |           basal_hf |  0.94 | [ 0.82,  0.98] |   34.00 | < .001***
#> basal_rmssd        |         basal_lf_2 |  0.89 | [ 0.69,  0.97] |   60.00 | < .001***
#> basal_rmssd        |          basal_vlf |  0.57 | [ 0.07,  0.84] |  238.00 | 0.025*
#> basal_sdnn         |          basal_sns | -0.66 | [-0.88, -0.21] |  930.00 | 0.007**
#> basal_sdnn         |          basal_pns |  0.55 | [ 0.03,  0.83] |  254.00 | 0.035*
#> basal_sdnn         | basal_stress_index | -0.97 | [-0.99, -0.91] | 1104.00 | < .001***
#> basal_sdnn         |           basal_hf |  0.91 | [ 0.73,  0.97] |   52.00 | < .001***
#> basal_sdnn         |         basal_lf_2 |  0.96 | [ 0.88,  0.99] |   22.00 | < .001***
#> basal_sdnn         |          basal_vlf |  0.59 | [ 0.09,  0.85] |  230.00 | 0.021*
#> basal_sns          |          basal_pns | -0.95 | [-0.99, -0.86] | 1094.00 | < .001***
#> basal_sns          | basal_stress_index |  0.70 | [ 0.28,  0.90] |  166.00 | 0.003**
#> basal_sns          |           basal_hf | -0.58 | [-0.85, -0.08] |  886.00 | 0.023*
#> basal_sns          |         basal_lf_2 | -0.57 | [-0.84, -0.06] |  878.00 | 0.027*
#> basal_pns          | basal_stress_index | -0.59 | [-0.85, -0.09] |  888.00 | 0.022*
#> basal_stress_index |           basal_hf | -0.89 | [-0.96, -0.67] | 1056.00 | < .001***
#> basal_stress_index |         basal_lf_2 | -0.95 | [-0.98, -0.85] | 1092.00 | < .001***
#> basal_stress_index |          basal_vlf | -0.60 | [-0.85, -0.10] |  894.00 | 0.019*
#> basal_hf           |         basal_lf_2 |  0.87 | [ 0.65,  0.96] |   70.00 | < .001***
#> basal_hf           |          basal_vlf |  0.57 | [ 0.07,  0.84] |  238.00 | 0.025*
#> basal_lf_2         |          basal_vlf |  0.55 | [ 0.04,  0.84] |  250.00 | 0.032*
#>
#> p-value adjustment method: none
#> Observations: 15-18
