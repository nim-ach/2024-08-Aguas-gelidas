
# Prepare workspace -------------------------------------------------------

## Load libraries
library(data.table)
library(skimr)
library(gtsummary)

## Load data
data("ice")

## Prepare dataset

## Variables to be used
vars <- list(
  basal = c("bp_systolic", "bp_diastolic",
            "basal_mean_rr", "basal_rmssd", "basal_sdnn", "basal_hf", "basal_lf_2", "basal_vlf",
            "basal_pns", "basal_sns","basal_stress_index", "t_basal_izquierdo", "t_basal_derecho"),
  pre = c("bp_systolic_2", "bp_diastolic_2",
          "pre_mean_rr_2", "pre_rmssd_2", "pre_sdnn_2", "pre_hf_2", "pre_lf", "pre_vlf_2",
          "pre_pns_2", "pre_sns_2", "pre_stress_index_2", "t_pre_izquierdo", "t_pre_derecho"),
  post00 = c("bp_systolic_3", "bp_diastolic_3",
          "post_mean_rr_3", "post_rmssd_3", "post_sdnn_3", "post_hf_3", "post_lf_2", "post_vlf_3",
          "post_pns_3", "post_sns_3", "post_stress_index_3", "t_post_izquierdo", "t_post_derecho"),
  post10 = c("bp_systolic_4", "bp_diastolic_4",
             "post_mean_rr_4", "post_rmssd_4", "post_sdnn_4", "post_hf_4", "post_lf_3", "post_vlf_4",
             "post_pns_4", "post_sns_4", "post_stress_index_4", "t_post_izquierdo_2", "t_post_derecho_2")
)

## Make data very long format
ice_list <- lapply(vars, function(x) {
  melt.data.table(
    data = ice,
    id.vars = c("id_personal"),
    measure.vars = x
  )
})

ice_long <- rbindlist(ice_list, idcol = "time")

## Clean variable names
ice_long[, variable := gsub("post_|pre_|basal_|_[1-4]", "", variable)]

## Expand the variables keeping the time in long format
ice_long_wide <- dcast(ice_long, time + id_personal ~ variable, value.var = "value")

## Make nice labels for Time
ice_long_wide[, time := factor(time, levels = c("basal", "pre", "post00", "post10"),
                       labels = c("Basal", "Pre", "Post-0'", "Post-10'"))]

data.table::setcolorder(
  x = ice_long_wide,
  neworder = c("time", "id_personal", "bp_diastolic", "bp_systolic",
               "t_derecho", "t_izquierdo", "mean_rr", "rmssd", "sdnn",
               "hf", "lf", "vlf", "pns", "sns", "stress_index")
)

gtsummary::theme_gtsummary_language("es")

var_labes <- list(
  bp_systolic ~ "Presión sistólica", bp_diastolic ~ "Presión diastólica",
  mean_rr ~ "Duración intervalo R-R", rmssd ~ "RMSSD", sdnn ~ "SDNN",
  pns ~ "Índice PNS", sns ~ "Índice SNS", stress_index ~ "Índice Stress",
  hf ~ "HF", lf ~ "LF", vlf ~ "VLF",
  t_derecho ~ "T° timpánica derecha", t_izquierdo ~ "T° timpánica izquierda"
)

tbl_basal <- tbl_summary(droplevels(ice_long_wide[time %in% c("Basal", "Pre")]),
                       by = time,
                       label = var_labes,
                       type = list(everything() ~ "continuous"),
                       missing = "no",
                       statistic = list(all_continuous() ~ "{mean} ± {sd}"),
                       digits = list(all_continuous() ~ 1),
                       include = !id_personal) |>
  add_difference(test = all_continuous() ~ "smd", include = all_continuous())

tbl_pre <- tbl_summary(droplevels(ice_long_wide[time %in% c("Pre", "Post-0'")]),
                       by = time,
                       label = var_labes,
                       type = list(everything() ~ "continuous"),
                       missing = "no",
                       statistic = list(all_continuous() ~ "{mean} ± {sd}"),
                       digits = list(all_continuous() ~ 1),
                       include = !id_personal) |>
  add_difference(test = all_continuous() ~ "smd", include = all_continuous())

tbl_post <- tbl_summary(droplevels(ice_long_wide[time %in% c("Post-0'", "Post-10'")]),
                       by = time,
                       label = var_labes,
                       type = list(everything() ~ "continuous"),
                       missing = "no",
                       statistic = list(all_continuous() ~ "{mean} ± {sd}"),
                       digits = list(all_continuous() ~ 1),
                       include = !id_personal) |>
  add_difference(test = all_continuous() ~ "smd", include = all_continuous())

tbl_2 <- tbl_merge(tbls = list(tbl_basal, tbl_pre, tbl_post),
          tab_spanner = c("**Basal vs Pre**",
                          "**Pre vs Post-0'**",
                          "**Post-0' vs Post-10'**"))

tbl_2

saveRDS(tbl_2, file = "docs/tbl_2.RDS")

