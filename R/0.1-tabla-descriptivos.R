
# Prepare workspace -------------------------------------------------------

## Load libraries
library(data.table)
library(skimr)
library(gtsummary)

## Load data
data("ice_data")

# Tabla 1 - Descriptivos --------------------------------------------------

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

tbl_1

saveRDS(tbl_1, file = "docs/tbl_1.RDS")

