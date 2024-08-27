
# Prepare workspace -------------------------------------------------------

## Load libraries
library(data.table)

## Load data
data("ice")


## Peor composición corporal se asocia a peor modulación autonómica ----

### Peso corporal ----

ice[, lm(basal_rmssd ~ tanita_weight)] |> summary() # .
ice[, lm(basal_sdnn ~ tanita_weight)] |> summary() # *
ice[, lm(basal_lf_2 ~ tanita_weight)] |> summary() # *
ice[, lm(basal_hf ~ tanita_weight)] |> summary() # ns
ice[, lm(basal_pns ~ tanita_weight)] |> summary() # ns
ice[, lm(basal_sns ~ tanita_weight)] |> summary() # *

ice[, lm(pre_rmssd_2 ~ tanita_weight)] |> summary() # ns
ice[, lm(pre_sdnn_2 ~ tanita_weight)] |> summary() # ns
ice[, lm(pre_lf ~ tanita_weight)] |> summary() # ns
ice[, lm(pre_hf_2 ~ tanita_weight)] |> summary() # ns
ice[, lm(pre_pns_2 ~ tanita_weight)] |> summary() # ns
ice[, lm(pre_sns_2 ~ tanita_weight)] |> summary() # ns

ice[, lm(post_rmssd_3 ~ tanita_weight)] |> summary() # .
ice[, lm(post_sdnn_3 ~ tanita_weight)] |> summary() # .
ice[, lm(post_lf_2 ~ tanita_weight)] |> summary() # ns
ice[, lm(post_hf_3 ~ tanita_weight)] |> summary() # ns
ice[, lm(post_pns_3 ~ tanita_weight)] |> summary() # ns
ice[, lm(post_sns_3 ~ tanita_weight)] |> summary() # ns

ice[, lm(post_rmssd_4 ~ tanita_weight)] |> summary() # *
ice[, lm(post_sdnn_4 ~ tanita_weight)] |> summary() # .
ice[, lm(post_lf_3 ~ tanita_weight)] |> summary() # ns
ice[, lm(post_hf_4 ~ tanita_weight)] |> summary() # .
ice[, lm(post_pns_4 ~ tanita_weight)] |> summary() # ns
ice[, lm(post_sns_4 ~ tanita_weight)] |> summary() # ns

### Grasa corporal ----

ice[, lm(basal_rmssd ~ fat_total)] |> summary() # ns
ice[, lm(basal_sdnn ~ fat_total)] |> summary() # ns
ice[, lm(basal_lf_2 ~ fat_total)] |> summary() # ns
ice[, lm(basal_hf ~ fat_total)] |> summary() # ns
ice[, lm(basal_pns ~ fat_total)] |> summary() # ns
ice[, lm(basal_sns ~ fat_total)] |> summary() # ns

ice[, lm(pre_rmssd_2 ~ fat_total)] |> summary() # ns
ice[, lm(pre_sdnn_2 ~ fat_total)] |> summary() # ns
ice[, lm(pre_lf ~ fat_total)] |> summary() # ns
ice[, lm(pre_hf_2 ~ fat_total)] |> summary() # ns
ice[, lm(pre_pns_2 ~ fat_total)] |> summary() # ns
ice[, lm(pre_sns_2 ~ fat_total)] |> summary() # ns

ice[, lm(post_rmssd_3 ~ fat_total)] |> summary() # ns
ice[, lm(post_sdnn_3 ~ fat_total)] |> summary() # ns
ice[, lm(post_lf_2 ~ fat_total)] |> summary() # ns
ice[, lm(post_hf_3 ~ fat_total)] |> summary() # ns
ice[, lm(post_pns_3 ~ fat_total)] |> summary() # ns
ice[, lm(post_sns_3 ~ fat_total)] |> summary() # ns

ice[, lm(post_rmssd_4 ~ fat_total)] |> summary() # ns
ice[, lm(post_sdnn_4 ~ fat_total)] |> summary() # ns
ice[, lm(post_lf_3 ~ fat_total)] |> summary() # ns
ice[, lm(post_hf_4 ~ fat_total)] |> summary() # ns
ice[, lm(post_pns_4 ~ fat_total)] |> summary() # ns
ice[, lm(post_sns_4 ~ fat_total)] |> summary() # ns

### Grasa visceral ----

ice[, lm(basal_rmssd ~ visceral_fat)] |> summary() # *
ice[, lm(basal_sdnn ~ visceral_fat)] |> summary() # *
ice[, lm(basal_lf_2 ~ visceral_fat)] |> summary() # ns
ice[, lm(basal_hf ~ visceral_fat)] |> summary() # .
ice[, lm(basal_pns ~ visceral_fat)] |> summary() # ns
ice[, lm(basal_sns ~ visceral_fat)] |> summary() # *

ice[, lm(pre_rmssd_2 ~ visceral_fat)] |> summary() # .
ice[, lm(pre_sdnn_2 ~ visceral_fat)] |> summary() # ns
ice[, lm(pre_lf ~ visceral_fat)] |> summary() # ns
ice[, lm(pre_hf_2 ~ visceral_fat)] |> summary() # ns
ice[, lm(pre_pns_2 ~ visceral_fat)] |> summary() # ns
ice[, lm(pre_sns_2 ~ visceral_fat)] |> summary() # ns

ice[, lm(post_rmssd_3 ~ visceral_fat)] |> summary() # ns
ice[, lm(post_sdnn_3 ~ visceral_fat)] |> summary() # ns
ice[, lm(post_lf_2 ~ visceral_fat)] |> summary() # ns
ice[, lm(post_hf_3 ~ visceral_fat)] |> summary() # ns
ice[, lm(post_pns_3 ~ visceral_fat)] |> summary() # ns
ice[, lm(post_sns_3 ~ visceral_fat)] |> summary() # ns

ice[, lm(post_rmssd_4 ~ visceral_fat)] |> summary() # ns
ice[, lm(post_sdnn_4 ~ visceral_fat)] |> summary() # ns
ice[, lm(post_lf_3 ~ visceral_fat)] |> summary() # ns
ice[, lm(post_hf_4 ~ visceral_fat)] |> summary() # ns
ice[, lm(post_pns_4 ~ visceral_fat)] |> summary() # ns
ice[, lm(post_sns_4 ~ visceral_fat)] |> summary() # ns
