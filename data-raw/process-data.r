
# Prepare worspace --------------------------------------------------------

## Import libraries
library(data.table)

# Read Data
ice = fread(file = 'data-raw/raw-data.csv')

## Select variables to work with
vars <- c(
  ## Sociodemograficas
  "id_personal", "fecha_de_evaluaci_n", "edad",
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
  "post_vlf_4", "post_lf_3", "post_hf_4", "post_hf_lf_4"
)

ice <- ice[, .SD, .SDcols = vars]

# Setting Factors(will create new variable for factors)
ice$spaq_seasonal_pattern <- factor(ice$spaq_seasonal_pattern,levels=c("0","1","2","3"))
ice$spaq_ssi <- factor(ice$spaq_ssi,levels=c("0","1","2","3"))
ice$spaq_severity <- factor(ice$spaq_severity,levels=c("0","1","2","3","4","5"))
ice$bdi_cat <- factor(ice$bdi_cat,levels=c("minima_depresion","depresion_leve","depresion_moderada","depresion_grave"))
ice$bai_cat <- factor(ice$bai_cat,levels=c("MUY_BAJA","MODERADA","SEVERA"))

levels(ice$spaq_seasonal_pattern) <- c("Ausencia","Patrón invierno","Patrón Verano","Ambos")
levels(ice$spaq_ssi) <- c("No aplica","Puntaje promedio","Winter blues","SAD")
levels(ice$spaq_severity) <- c("No es problema","Leve","Moderado","Importante","Severo","Grave")
levels(ice$bdi_cat) <- c("Minima Depresión","Depresión Leve","Depresión Moderada","Depresión Grave")
levels(ice$bai_cat) <- c("Muy baja","Moderada","Severa")

# Export data -------------------------------------------------------------

fwrite(ice, file = "data-raw/ice.csv")
save(ice, file = "data/ice.RData")
