
# Prepare workspace -------------------------------------------------------

## Load libraries
library(data.table)

## Load full dataset
data("ice")

## Select variables used in analysis
vars <- c(
  "sexo", "edad", "bp_systolic", "bp_diastolic",
  "bai_score", "bdi_score", "bai_cat", "bdi_cat",
  "tanita_weight", "talla", "fat_total", "muscle_total",
  "bone_mass", "body_water", "visceral_fat",
  "basal_mean_rr", "basal_mean_hr",
  "basal_rmssd", "basal_sdnn",
  "basal_sns", "basal_pns", "basal_stress_index",
  "basal_hf", "basal_lf_2", "basal_vlf"
)

ice_data <- ice[, .SD, .SDcols = vars]

fwrite(ice_data, file = "data-raw/paper-data.csv")
save(ice_data, file = "data/ice_data.RData")
