
# Prepare workspace -------------------------------------------------------

## Load libraries
library(data.table)

## Import dataset
data("ice")

sig_cor <- correlation::correlation(ice, method = "spearman", p_adjust = "none") |>
  dplyr::filter(p < 0.05)

sig_cor
