
# Prepare workspace -------------------------------------------------------

## Load libraries
library(data.table)

## Load data
data("ice")

## Mayor ansiedad y depresión se asocia a peor modulación autonómica ----

### Ansiedad ----

ice[, lm(basal_rmssd ~ bai_score)] |> summary() # .
ice[, lm(basal_sdnn ~ bai_score)] |> summary() # *
ice[, lm(basal_lf_2 ~ bai_score)] |> summary() # ns
ice[, lm(basal_hf ~ bai_score)] |> summary() # ns
ice[, lm(basal_pns ~ bai_score)] |> summary() # *
ice[, lm(basal_sns ~ bai_score)] |> summary() # ***

ice[, lm(pre_rmssd_2 ~ bai_score)] |> summary() # ns
ice[, lm(pre_sdnn_2 ~ bai_score)] |> summary() # ns
ice[, lm(pre_lf ~ bai_score)] |> summary() # ns
ice[, lm(pre_hf_2 ~ bai_score)] |> summary() # ns
ice[, lm(pre_pns_2 ~ bai_score)] |> summary() # ns
ice[, lm(pre_sns_2 ~ bai_score)] |> summary() # ns

ice[, lm(post_rmssd_3 ~ bai_score)] |> summary() # ns
ice[, lm(post_sdnn_3 ~ bai_score)] |> summary() # ns
ice[, lm(post_lf_2 ~ bai_score)] |> summary() # ns
ice[, lm(post_hf_3 ~ bai_score)] |> summary() # ns
ice[, lm(post_pns_3 ~ bai_score)] |> summary() # ns
ice[, lm(post_sns_3 ~ bai_score)] |> summary() # ns

ice[, lm(post_rmssd_4 ~ bai_score)] |> summary() # .
ice[, lm(post_sdnn_4 ~ bai_score)] |> summary() # .
ice[, lm(post_lf_3 ~ bai_score)] |> summary() # ns
ice[, lm(post_hf_4 ~ bai_score)] |> summary() # ns
ice[, lm(post_pns_4 ~ bai_score)] |> summary() # ns
ice[, lm(post_sns_4 ~ bai_score)] |> summary() # ns

### Depresión ----

ice[, lm(basal_rmssd ~ bdi_score)] |> summary() # ns
ice[, lm(basal_sdnn ~ bdi_score)] |> summary() # ns
ice[, lm(basal_lf_2 ~ bdi_score)] |> summary() # ns
ice[, lm(basal_hf ~ bdi_score)] |> summary() # ns
ice[, lm(basal_pns ~ bdi_score)] |> summary() # .
ice[, lm(basal_sns ~ bdi_score)] |> summary() # *

ice[, lm(pre_rmssd_2 ~ bdi_score)] |> summary() # ns
ice[, lm(pre_sdnn_2 ~ bdi_score)] |> summary() # ns
ice[, lm(pre_lf ~ bdi_score)] |> summary() # ns
ice[, lm(pre_hf_2 ~ bdi_score)] |> summary() # ns
ice[, lm(pre_pns_2 ~ bdi_score)] |> summary() # ns
ice[, lm(pre_sns_2 ~ bdi_score)] |> summary() # ns

ice[, lm(post_rmssd_3 ~ bdi_score)] |> summary() # ns
ice[, lm(post_sdnn_3 ~ bdi_score)] |> summary() # ns
ice[, lm(post_lf_2 ~ bdi_score)] |> summary() # ns
ice[, lm(post_hf_3 ~ bdi_score)] |> summary() # ns
ice[, lm(post_pns_3 ~ bdi_score)] |> summary() # ns
ice[, lm(post_sns_3 ~ bdi_score)] |> summary() # ns

ice[, lm(post_rmssd_4 ~ bdi_score)] |> summary() # ns
ice[, lm(post_sdnn_4 ~ bdi_score)] |> summary() # ns
ice[, lm(post_lf_3 ~ bdi_score)] |> summary() # ns
ice[, lm(post_hf_4 ~ bdi_score)] |> summary() # ns
ice[, lm(post_pns_4 ~ bdi_score)] |> summary() # ns
ice[, lm(post_sns_4 ~ bdi_score)] |> summary() # ns
