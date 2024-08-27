
# Prepare workspace -------------------------------------------------------

## Load libraries
library(data.table)

## Load dataset
source("R/_functions.R")

## Find saved models
files <- list.files(path = "docs/models", pattern = "^m_", full.names = TRUE)
names(files) <- gsub("\\.RDS", "", list.files(path = "docs/models", pattern = "^m_"))

## Read models
models <- lapply(files, readRDS)

## Summary models
results <- lapply(models, summary_model)

## Merge results in a single data.table
results <- rbindlist(results, idcol = "model")

## Transform BF from logodds to Odds
results[, BF := round(exp(log_BF), 3)][]

## Save results table
saveRDS(results, file = "docs/models/results.RDS")
