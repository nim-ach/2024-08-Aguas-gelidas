# Prepare workspace -------------------------------------------------------

## Load libraries
library(data.table)

## Load data
data("ice")

## Influencia del control autonómico (basal, pre, post) sobre el control hemodinámico ----

### Presión basal ----

ice[, lm(bp_systolic ~ pre_rmssd_2)] |> summary() # ns
ice[, lm(bp_systolic ~ pre_sdnn_2)] |> summary() # ns
ice[, lm(bp_systolic ~ pre_lf)] |> summary() # ns
ice[, lm(bp_systolic ~ pre_hf_2)] |> summary() # ns
ice[, lm(bp_systolic ~ pre_pns_2)] |> summary() # ns
ice[, lm(bp_systolic ~ pre_sns_2)] |> summary() # ns
ice[, lm(bp_systolic ~ pre_stress_index_2)] |> summary() # .

ice[, lm(bp_diastolic ~ pre_rmssd_2)] |> summary() # ns
ice[, lm(bp_diastolic ~ pre_sdnn_2)] |> summary() # ns
ice[, lm(bp_diastolic ~ pre_lf)] |> summary() # ns
ice[, lm(bp_diastolic ~ pre_hf_2)] |> summary() # ns
ice[, lm(bp_diastolic ~ pre_pns_2)] |> summary() # ns
ice[, lm(bp_diastolic ~ pre_sns_2)] |> summary() # ns
ice[, lm(bp_diastolic ~ pre_stress_index_2)] |> summary() # .

### Presión pre ----

ice[, lm(bp_systolic_2 ~ pre_rmssd_2)] |> summary() # ns
ice[, lm(bp_systolic_2 ~ pre_sdnn_2)] |> summary() # ns
ice[, lm(bp_systolic_2 ~ pre_lf)] |> summary() # ns
ice[, lm(bp_systolic_2 ~ pre_hf_2)] |> summary() # ns
ice[, lm(bp_systolic_2 ~ pre_pns_2)] |> summary() # ns
ice[, lm(bp_systolic_2 ~ pre_sns_2)] |> summary() # ns
ice[, lm(bp_systolic_2 ~ pre_stress_index_2)] |> summary() # ns

ice[, lm(bp_diastolic_2 ~ pre_rmssd_2)] |> summary() # ns
ice[, lm(bp_diastolic_2 ~ pre_sdnn_2)] |> summary() # ns
ice[, lm(bp_diastolic_2 ~ pre_lf)] |> summary() # ns
ice[, lm(bp_diastolic_2 ~ pre_hf_2)] |> summary() # ns
ice[, lm(bp_diastolic_2 ~ pre_pns_2)] |> summary() # ns
ice[, lm(bp_diastolic_2 ~ pre_sns_2)] |> summary() # ns
ice[, lm(bp_diastolic_2 ~ pre_stress_index_2)] |> summary() # ns

### Presión post-0 ----

ice[, lm(bp_systolic_3 ~ pre_rmssd_2)] |> summary() # ns
ice[, lm(bp_systolic_3 ~ pre_sdnn_2)] |> summary() # ns
ice[, lm(bp_systolic_3 ~ pre_lf)] |> summary() # ns
ice[, lm(bp_systolic_3 ~ pre_hf_2)] |> summary() # ns
ice[, lm(bp_systolic_3 ~ pre_pns_2)] |> summary() # ns
ice[, lm(bp_systolic_3 ~ pre_sns_2)] |> summary() # ns
ice[, lm(bp_systolic_3 ~ pre_stress_index_2)] |> summary() # ns

ice[, lm(bp_diastolic_3 ~ pre_rmssd_2)] |> summary() # ns
ice[, lm(bp_diastolic_3 ~ pre_sdnn_2)] |> summary() # ns
ice[, lm(bp_diastolic_3 ~ pre_lf)] |> summary() # ns
ice[, lm(bp_diastolic_3 ~ pre_hf_2)] |> summary() # ns
ice[, lm(bp_diastolic_3 ~ pre_pns_2)] |> summary() # ns
ice[, lm(bp_diastolic_3 ~ pre_sns_2)] |> summary() # ns
ice[, lm(bp_diastolic_3 ~ pre_stress_index_2)] |> summary() # ns

### Presión delta pre-post00 ----

ice[, lm(bp_systolic_delta_00 ~ pre_rmssd_2)] |> summary() # ns
ice[, lm(bp_systolic_delta_00 ~ pre_sdnn_2)] |> summary() # ns
ice[, lm(bp_systolic_delta_00 ~ pre_lf)] |> summary() # ns
ice[, lm(bp_systolic_delta_00 ~ pre_hf_2)] |> summary() # ns
ice[, lm(bp_systolic_delta_00 ~ pre_pns_2)] |> summary() # ns
ice[, lm(bp_systolic_delta_00 ~ pre_sns_2)] |> summary() # ns
ice[, lm(bp_systolic_delta_00 ~ pre_stress_index_2)] |> summary() # ns

ice[, lm(bp_diastolic_delta_00 ~ pre_rmssd_2)] |> summary() # ns
ice[, lm(bp_diastolic_delta_00 ~ pre_sdnn_2)] |> summary() # ns
ice[, lm(bp_diastolic_delta_00 ~ pre_lf)] |> summary() # ns
ice[, lm(bp_diastolic_delta_00 ~ pre_hf_2)] |> summary() # ns
ice[, lm(bp_diastolic_delta_00 ~ pre_pns_2)] |> summary() # ns
ice[, lm(bp_diastolic_delta_00 ~ pre_sns_2)] |> summary() # ns
ice[, lm(bp_diastolic_delta_00 ~ pre_stress_index_2)] |> summary() # ns

### Presión delta pre-post10 ----

ice[, lm(bp_systolic_delta_10 ~ pre_rmssd_2)] |> summary() # ns
ice[, lm(bp_systolic_delta_10 ~ pre_sdnn_2)] |> summary() # ns
ice[, lm(bp_systolic_delta_10 ~ pre_lf)] |> summary() # ns
ice[, lm(bp_systolic_delta_10 ~ pre_hf_2)] |> summary() # ns
ice[, lm(bp_systolic_delta_10 ~ pre_pns_2)] |> summary() # ns
ice[, lm(bp_systolic_delta_10 ~ pre_sns_2)] |> summary() # ns
ice[, lm(bp_systolic_delta_10 ~ pre_stress_index_2)] |> summary() # ns

ice[, lm(bp_diastolic_delta_10 ~ pre_rmssd_2)] |> summary() # ns
ice[, lm(bp_diastolic_delta_10 ~ pre_sdnn_2)] |> summary() # ns
ice[, lm(bp_diastolic_delta_10 ~ pre_lf)] |> summary() # ns
ice[, lm(bp_diastolic_delta_10 ~ pre_hf_2)] |> summary() # ns
ice[, lm(bp_diastolic_delta_10 ~ pre_pns_2)] |> summary() # ns
ice[, lm(bp_diastolic_delta_10 ~ pre_sns_2)] |> summary() # ns
ice[, lm(bp_diastolic_delta_10 ~ pre_stress_index_2)] |> summary() # ns

### Presión post-10 ----

ice[, lm(bp_systolic_4 ~ pre_rmssd_2)] |> summary() # ns
ice[, lm(bp_systolic_4 ~ pre_sdnn_2)] |> summary() # ns
ice[, lm(bp_systolic_4 ~ pre_lf)] |> summary() # ns
ice[, lm(bp_systolic_4 ~ pre_hf_2)] |> summary() # ns
ice[, lm(bp_systolic_4 ~ pre_pns_2)] |> summary() # ns
ice[, lm(bp_systolic_4 ~ pre_sns_2)] |> summary() # ns
ice[, lm(bp_systolic_4 ~ pre_stress_index_2)] |> summary() # ns

ice[, lm(bp_diastolic_4 ~ pre_rmssd_2)] |> summary() # *
ice[, lm(bp_diastolic_4 ~ pre_sdnn_2)] |> summary() # .
ice[, lm(bp_diastolic_4 ~ pre_lf)] |> summary() # *
ice[, lm(bp_diastolic_4 ~ pre_hf_2)] |> summary() # .
ice[, lm(bp_diastolic_4 ~ pre_pns_2)] |> summary() # ns
ice[, lm(bp_diastolic_4 ~ pre_sns_2)] |> summary() # ns
ice[, lm(bp_diastolic_4 ~ pre_stress_index_2)] |> summary() # .


