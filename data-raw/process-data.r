
# Prepare worspace --------------------------------------------------------

## Import libraries
library(data.table)

# Read Data
ice = fread(file = 'data-raw/raw-data.csv')

## Select variables to work with
vars <- c(
  ## Sociodemograficas
  "id_personal", "fecha_de_evaluaci_n", "edad", "sexo",
  ## Hemodinámicos
  "bp_systolic", "bp_diastolic", "fc", "fc_max", "bp_systolic_2", "bp_diastolic_2",
  "fc_2", "bp_systolic_3", "bp_diastolic_3", "fc_3", "bp_systolic_4",
  "bp_diastolic_4", "fc_4",
  ## HSPS
  "hsps_score",
  ## Ansiedad
  "bai_score", "bai_cat",
  ## Depresión
  "bdi_score", "bdi_cat",
  ## Bioimpedanciometría
  "body_water", "bone_mass", "visceral_fat", "metabolism", "tanita_age",
  "tanita_weight", "muscle_total", "talla", "fat_total",
  ## SPAQ
  "spaq_ssi", "spaq_severity", "spaq_seasonal_pattern", "spaq_sleep_hours_winter",
  "spaq_sleep_hours_spring", "spaq_sleep_hours_summer", "spaq_sleep_hours_fall",
  ## HRV - Basal
  "basal_fc_max", "basal_mean_rr", "basal_rmssd", "basal_pns",
  "basal_mean_hr", "basal_stress_index", "basal_sns", "basal_sdnn",
  "basal_vlf", "basal_lf_2", "basal_hf", "basal_hf_lf",
  ## HRV - pre inmersión
  "pre_fc_max_2", "pre_mean_rr_2", "pre_rmssd_2", "pre_pns_2",
  "pre_mean_hr_2", "pre_stress_index_2", "pre_sns_2", "pre_sdnn_2",
  "pre_vlf_2", "pre_lf", "pre_hf_2", "pre_hf_lf_2",
  ## HRV - post inmersión inmediato
  "post_fc_max_3", "post_mean_rr_3", "post_rmssd_3", "post_pns_3",
  "post_mean_hr_3", "post_stress_index_3", "post_sns_3", "post_sdnn_3",
  "post_vlf_3", "post_lf_2", "post_hf_3", "post_hf_lf_3",
  ## HRV - post inmersión tardio
  "post_fc_max_4", "post_mean_rr_4", "post_rmssd_4", "post_pns_4",
  "post_mean_hr_4", "post_stress_index_4", "post_sns_4", "post_sdnn_4",
  "post_vlf_4", "post_lf_3", "post_hf_4", "post_hf_lf_4",
  ## Temperatura timpánica
  "t_basal_izquierdo", "t_basal_derecho", "t_pre_izquierdo", "t_pre_derecho",
  "t_post_izquierdo", "t_post_derecho", "t_post_izquierdo_2", "t_post_derecho_2"
)

ice <- ice[, .SD, .SDcols = vars]

# Setting Factors(will create new variable for factors)
ice[, `:=`(
  spaq_seasonal_pattern = factor(spaq_seasonal_pattern,
                                 levels = 0:3,
                                 labels = c("Ausencia","Patrón invierno","Patrón Verano","Ambos")),
  spaq_ssi = factor(spaq_ssi,
                    levels = 0:3,
                    labels = c("No aplica","Puntaje promedio","Winter blues","SAD")),
  spaq_severity = factor(spaq_severity,
                         levels = 0:5,
                         labels = c("No es problema","Leve","Moderado","Importante","Severo","Grave")),
  bdi_cat = factor(bdi_cat,
                   levels = c("minima_depresion","depresion_leve","depresion_moderada","depresion_grave"),
                   labels = c("Minima Depresión","Depresión Leve","Depresión Moderada","Depresión Grave")),
  bai_cat = factor(bai_cat,
                   levels = c("MUY_BAJA","MODERADA","SEVERA"),
                   labels = c("Muy baja","Moderada","Severa")),
  sexo = factor(sexo,
                levels = c("male", "female"))
)]

## Creating variables
ice[, spaq_sleep_hours_mean := mean(c(spaq_sleep_hours_winter, spaq_sleep_hours_spring,
                                      spaq_sleep_hours_summer, spaq_sleep_hours_fall),
                                    na.rm = TRUE),
    by = id_personal]

ice[, bp_systolic_delta_00 := (bp_systolic_3 - bp_systolic)]
ice[, bp_systolic_delta_10 := (bp_systolic_4 - bp_systolic)]
ice[, bp_diastolic_delta_00 := (bp_diastolic_3 - bp_diastolic)]
ice[, bp_diastolic_delta_10 := (bp_diastolic_4 - bp_diastolic)]

## Setting variables to numeric
ice[, t_post_izquierdo := as.numeric(t_post_izquierdo)]

ice[, t_delta10_izquierdo := t_post_izquierdo_2 - t_pre_izquierdo]
ice[, t_delta00_izquierdo := t_post_izquierdo - t_pre_izquierdo]
ice[, t_delta10_derecho := t_post_derecho_2 - t_pre_derecho]
ice[, t_delta00_derecho := t_post_derecho - t_pre_derecho]



# Export data -------------------------------------------------------------

fwrite(ice, file = "data-raw/ice.csv")
save(ice, file = "data/ice.RData")
