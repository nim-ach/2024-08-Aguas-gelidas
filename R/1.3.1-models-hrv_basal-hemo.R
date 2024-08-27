# Prepare workspace -------------------------------------------------------

## Load libraries
library(data.table)

## Load data
data("ice")

## Influencia del control autonómico (basal, pre, post) sobre el control hemodinámico ----

### Presión basal ----

ice[, lm(bp_systolic ~ basal_rmssd)] |> summary() # ns
ice[, lm(bp_systolic ~ basal_sdnn)] |> summary() # ns
ice[, lm(bp_systolic ~ basal_lf_2)] |> summary() # ns
ice[, lm(bp_systolic ~ basal_hf)] |> summary() # ns
ice[, lm(bp_systolic ~ basal_pns)] |> summary() # ns
ice[, lm(bp_systolic ~ basal_sns)] |> summary() # ns
ice[, lm(bp_systolic ~ basal_stress_index)] |> summary() # ns

ice[, lm(bp_diastolic ~ basal_rmssd)] |> summary() # .
ice[, lm(bp_diastolic ~ basal_sdnn)] |> summary() # .
ice[, lm(bp_diastolic ~ basal_lf_2)] |> summary() # ns
ice[, lm(bp_diastolic ~ basal_hf)] |> summary() # .
ice[, lm(bp_diastolic ~ basal_pns)] |> summary() # ns
ice[, lm(bp_diastolic ~ basal_sns)] |> summary() # .
ice[, lm(bp_diastolic ~ basal_stress_index)] |> summary() # .

### Presión pre ----

ice[, lm(bp_systolic_2 ~ basal_rmssd)] |> summary() # ns
ice[, lm(bp_systolic_2 ~ basal_sdnn)] |> summary() # ns
ice[, lm(bp_systolic_2 ~ basal_lf_2)] |> summary() # ns
ice[, lm(bp_systolic_2 ~ basal_hf)] |> summary() # ns
ice[, lm(bp_systolic_2 ~ basal_pns)] |> summary() # ns
ice[, lm(bp_systolic_2 ~ basal_sns)] |> summary() # ns
ice[, lm(bp_systolic_2 ~ basal_stress_index)] |> summary() # ns

ice[, lm(bp_diastolic_2 ~ basal_rmssd)] |> summary() # ns
ice[, lm(bp_diastolic_2 ~ basal_sdnn)] |> summary() # ns
ice[, lm(bp_diastolic_2 ~ basal_lf_2)] |> summary() # ns
ice[, lm(bp_diastolic_2 ~ basal_hf)] |> summary() # ns
ice[, lm(bp_diastolic_2 ~ basal_pns)] |> summary() # ns
ice[, lm(bp_diastolic_2 ~ basal_sns)] |> summary() # ns
ice[, lm(bp_diastolic_2 ~ basal_stress_index)] |> summary() # ns

### Presión post-0 ----

ice[, lm(bp_systolic_3 ~ basal_rmssd)] |> summary() # ns
ice[, lm(bp_systolic_3 ~ basal_sdnn)] |> summary() # .
ice[, lm(bp_systolic_3 ~ basal_lf_2)] |> summary() # ns
ice[, lm(bp_systolic_3 ~ basal_hf)] |> summary() # ns
ice[, lm(bp_systolic_3 ~ basal_pns)] |> summary() # ns
ice[, lm(bp_systolic_3 ~ basal_sns)] |> summary() # ns
ice[, lm(bp_systolic_3 ~ basal_stress_index)] |> summary() # ns

ice[, lm(bp_diastolic_3 ~ basal_rmssd)] |> summary() # ns
ice[, lm(bp_diastolic_3 ~ basal_sdnn)] |> summary() # ns
ice[, lm(bp_diastolic_3 ~ basal_lf_2)] |> summary() # ns
ice[, lm(bp_diastolic_3 ~ basal_hf)] |> summary() # ns
ice[, lm(bp_diastolic_3 ~ basal_pns)] |> summary() # ns
ice[, lm(bp_diastolic_3 ~ basal_sns)] |> summary() # ns
ice[, lm(bp_diastolic_3 ~ basal_stress_index)] |> summary() # ns

### Presión delta pre-post00 ----

ice[, lm(bp_systolic_delta_00 ~ basal_rmssd)] |> summary() # ns
ice[, lm(bp_systolic_delta_00 ~ basal_sdnn)] |> summary() # ns
ice[, lm(bp_systolic_delta_00 ~ basal_lf_2)] |> summary() # ns
ice[, lm(bp_systolic_delta_00 ~ basal_hf)] |> summary() # ns
ice[, lm(bp_systolic_delta_00 ~ basal_pns)] |> summary() # ns
ice[, lm(bp_systolic_delta_00 ~ basal_sns)] |> summary() # ns
ice[, lm(bp_systolic_delta_00 ~ basal_stress_index)] |> summary() # ns

ice[, lm(bp_diastolic_delta_00 ~ basal_rmssd)] |> summary() # ns
ice[, lm(bp_diastolic_delta_00 ~ basal_sdnn)] |> summary() # ns
ice[, lm(bp_diastolic_delta_00 ~ basal_lf_2)] |> summary() # ns
ice[, lm(bp_diastolic_delta_00 ~ basal_hf)] |> summary() # ns
ice[, lm(bp_diastolic_delta_00 ~ basal_pns)] |> summary() # ns
ice[, lm(bp_diastolic_delta_00 ~ basal_sns)] |> summary() # ns
ice[, lm(bp_diastolic_delta_00 ~ basal_stress_index)] |> summary() # ns

### Presión delta pre-post10 ----

ice[, lm(bp_systolic_delta_10 ~ basal_rmssd)] |> summary() # ns
ice[, lm(bp_systolic_delta_10 ~ basal_sdnn)] |> summary() # ns
ice[, lm(bp_systolic_delta_10 ~ basal_lf_2)] |> summary() # ns
ice[, lm(bp_systolic_delta_10 ~ basal_hf)] |> summary() # ns
ice[, lm(bp_systolic_delta_10 ~ basal_pns)] |> summary() # ns
ice[, lm(bp_systolic_delta_10 ~ basal_sns)] |> summary() # .
ice[, lm(bp_systolic_delta_10 ~ basal_stress_index)] |> summary() # .

ice[, lm(bp_diastolic_delta_10 ~ basal_rmssd)] |> summary() # ns
ice[, lm(bp_diastolic_delta_10 ~ basal_sdnn)] |> summary() # ns
ice[, lm(bp_diastolic_delta_10 ~ basal_lf_2)] |> summary() # ns
ice[, lm(bp_diastolic_delta_10 ~ basal_hf)] |> summary() # ns
ice[, lm(bp_diastolic_delta_10 ~ basal_pns)] |> summary() # ns
ice[, lm(bp_diastolic_delta_10 ~ basal_sns)] |> summary() # ns
ice[, lm(bp_diastolic_delta_10 ~ basal_stress_index)] |> summary() # ns

### Presión post-10 ----

ice[, lm(bp_systolic_4 ~ basal_rmssd)] |> summary() # ns
ice[, lm(bp_systolic_4 ~ basal_sdnn)] |> summary() # ns
ice[, lm(bp_systolic_4 ~ basal_lf_2)] |> summary() # ns
ice[, lm(bp_systolic_4 ~ basal_hf)] |> summary() # ns
ice[, lm(bp_systolic_4 ~ basal_pns)] |> summary() # .
ice[, lm(bp_systolic_4 ~ basal_sns)] |> summary() # ns
ice[, lm(bp_systolic_4 ~ basal_stress_index)] |> summary() # ns

ice[, lm(bp_diastolic_4 ~ basal_rmssd)] |> summary() # ns
ice[, lm(bp_diastolic_4 ~ basal_sdnn)] |> summary() # .
ice[, lm(bp_diastolic_4 ~ basal_lf_2)] |> summary() # ns
ice[, lm(bp_diastolic_4 ~ basal_hf)] |> summary() # ns
ice[, lm(bp_diastolic_4 ~ basal_pns)] |> summary() # ns
ice[, lm(bp_diastolic_4 ~ basal_sns)] |> summary() # ns
ice[, lm(bp_diastolic_4 ~ basal_stress_index)] |> summary() # ns


