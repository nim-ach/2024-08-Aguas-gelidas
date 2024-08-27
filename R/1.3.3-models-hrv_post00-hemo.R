# Prepare workspace -------------------------------------------------------

## Load libraries
library(data.table)

## Load data
data("ice")

## Influencia del control autonómico (basal, pre, post) sobre el control hemodinámico ----

### Presión basal ----

ice[, lm(bp_systolic ~ post_rmssd_3)] |> summary() # ns
ice[, lm(bp_systolic ~ post_sdnn_3)] |> summary() # ns
ice[, lm(bp_systolic ~ post_lf_2)] |> summary() # ns
ice[, lm(bp_systolic ~ post_hf_3)] |> summary() # ns
ice[, lm(bp_systolic ~ post_pns_3)] |> summary() # ns
ice[, lm(bp_systolic ~ post_sns_3)] |> summary() # ns
ice[, lm(bp_systolic ~ post_stress_index_3)] |> summary() # ns

ice[, lm(bp_diastolic ~ post_rmssd_3)] |> summary() # ns
ice[, lm(bp_diastolic ~ post_sdnn_3)] |> summary() # .
ice[, lm(bp_diastolic ~ post_lf_2)] |> summary() # ns
ice[, lm(bp_diastolic ~ post_hf_3)] |> summary() # ns
ice[, lm(bp_diastolic ~ post_pns_3)] |> summary() # ns
ice[, lm(bp_diastolic ~ post_sns_3)] |> summary() # ns
ice[, lm(bp_diastolic ~ post_stress_index_3)] |> summary() # *

### Presión pre ----

ice[, lm(bp_systolic_2 ~ post_rmssd_3)] |> summary() # ns
ice[, lm(bp_systolic_2 ~ post_sdnn_3)] |> summary() # ns
ice[, lm(bp_systolic_2 ~ post_lf_2)] |> summary() # ns
ice[, lm(bp_systolic_2 ~ post_hf_3)] |> summary() # ns
ice[, lm(bp_systolic_2 ~ post_pns_3)] |> summary() # ns
ice[, lm(bp_systolic_2 ~ post_sns_3)] |> summary() # ns
ice[, lm(bp_systolic_2 ~ post_stress_index_3)] |> summary() # ns

ice[, lm(bp_diastolic_2 ~ post_rmssd_3)] |> summary() # ns
ice[, lm(bp_diastolic_2 ~ post_sdnn_3)] |> summary() # ns
ice[, lm(bp_diastolic_2 ~ post_lf_2)] |> summary() # ns
ice[, lm(bp_diastolic_2 ~ post_hf_3)] |> summary() # ns
ice[, lm(bp_diastolic_2 ~ post_pns_3)] |> summary() # ns
ice[, lm(bp_diastolic_2 ~ post_sns_3)] |> summary() # ns
ice[, lm(bp_diastolic_2 ~ post_stress_index_3)] |> summary() # ns

### Presión post-0 ----

ice[, lm(bp_systolic_3 ~ post_rmssd_3)] |> summary() # ns
ice[, lm(bp_systolic_3 ~ post_sdnn_3)] |> summary() # ns
ice[, lm(bp_systolic_3 ~ post_lf_2)] |> summary() # ns
ice[, lm(bp_systolic_3 ~ post_hf_3)] |> summary() # ns
ice[, lm(bp_systolic_3 ~ post_pns_3)] |> summary() # ns
ice[, lm(bp_systolic_3 ~ post_sns_3)] |> summary() # ns
ice[, lm(bp_systolic_3 ~ post_stress_index_3)] |> summary() # ns

ice[, lm(bp_diastolic_3 ~ post_rmssd_3)] |> summary() # ns
ice[, lm(bp_diastolic_3 ~ post_sdnn_3)] |> summary() # ns
ice[, lm(bp_diastolic_3 ~ post_lf_2)] |> summary() # ns
ice[, lm(bp_diastolic_3 ~ post_hf_3)] |> summary() # ns
ice[, lm(bp_diastolic_3 ~ post_pns_3)] |> summary() # ns
ice[, lm(bp_diastolic_3 ~ post_sns_3)] |> summary() # ns
ice[, lm(bp_diastolic_3 ~ post_stress_index_3)] |> summary() # .

### Presión delta pre-post00 ----

ice[, lm(bp_systolic_delta_00 ~ post_rmssd_3)] |> summary() # ns
ice[, lm(bp_systolic_delta_00 ~ post_sdnn_3)] |> summary() # ns
ice[, lm(bp_systolic_delta_00 ~ post_lf_2)] |> summary() # ns
ice[, lm(bp_systolic_delta_00 ~ post_hf_3)] |> summary() # ns
ice[, lm(bp_systolic_delta_00 ~ post_pns_3)] |> summary() # ns
ice[, lm(bp_systolic_delta_00 ~ post_sns_3)] |> summary() # ns
ice[, lm(bp_systolic_delta_00 ~ post_stress_index_3)] |> summary() # ns

ice[, lm(bp_diastolic_delta_00 ~ post_rmssd_3)] |> summary() # ns
ice[, lm(bp_diastolic_delta_00 ~ post_sdnn_3)] |> summary() # ns
ice[, lm(bp_diastolic_delta_00 ~ post_lf_2)] |> summary() # ns
ice[, lm(bp_diastolic_delta_00 ~ post_hf_3)] |> summary() # ns
ice[, lm(bp_diastolic_delta_00 ~ post_pns_3)] |> summary() # ns
ice[, lm(bp_diastolic_delta_00 ~ post_sns_3)] |> summary() # ns
ice[, lm(bp_diastolic_delta_00 ~ post_stress_index_3)] |> summary() # ns

### Presión delta pre-post10 ----

ice[, lm(bp_systolic_delta_10 ~ post_rmssd_3)] |> summary() # ns
ice[, lm(bp_systolic_delta_10 ~ post_sdnn_3)] |> summary() # ns
ice[, lm(bp_systolic_delta_10 ~ post_lf_2)] |> summary() # ns
ice[, lm(bp_systolic_delta_10 ~ post_hf_3)] |> summary() # ns
ice[, lm(bp_systolic_delta_10 ~ post_pns_3)] |> summary() # ns
ice[, lm(bp_systolic_delta_10 ~ post_sns_3)] |> summary() # ns
ice[, lm(bp_systolic_delta_10 ~ post_stress_index_3)] |> summary() # ns

ice[, lm(bp_diastolic_delta_10 ~ post_rmssd_3)] |> summary() # ns
ice[, lm(bp_diastolic_delta_10 ~ post_sdnn_3)] |> summary() # ns
ice[, lm(bp_diastolic_delta_10 ~ post_lf_2)] |> summary() # ns
ice[, lm(bp_diastolic_delta_10 ~ post_hf_3)] |> summary() # ns
ice[, lm(bp_diastolic_delta_10 ~ post_pns_3)] |> summary() # ns
ice[, lm(bp_diastolic_delta_10 ~ post_sns_3)] |> summary() # ns
ice[, lm(bp_diastolic_delta_10 ~ post_stress_index_3)] |> summary() # ns

### Presión post-10 ----

ice[, lm(bp_systolic_4 ~ post_rmssd_3)] |> summary() # ns
ice[, lm(bp_systolic_4 ~ post_sdnn_3)] |> summary() # ns
ice[, lm(bp_systolic_4 ~ post_lf_2)] |> summary() # ns
ice[, lm(bp_systolic_4 ~ post_hf_3)] |> summary() # ns
ice[, lm(bp_systolic_4 ~ post_pns_3)] |> summary() # ns
ice[, lm(bp_systolic_4 ~ post_sns_3)] |> summary() # ns
ice[, lm(bp_systolic_4 ~ post_stress_index_3)] |> summary() # ns

ice[, lm(bp_diastolic_4 ~ post_rmssd_3)] |> summary() # ns
ice[, lm(bp_diastolic_4 ~ post_sdnn_3)] |> summary() # .
ice[, lm(bp_diastolic_4 ~ post_lf_2)] |> summary() # *
ice[, lm(bp_diastolic_4 ~ post_hf_3)] |> summary() # ns
ice[, lm(bp_diastolic_4 ~ post_pns_3)] |> summary() # ns
ice[, lm(bp_diastolic_4 ~ post_sns_3)] |> summary() # ns
ice[, lm(bp_diastolic_4 ~ post_stress_index_3)] |> summary() # *


