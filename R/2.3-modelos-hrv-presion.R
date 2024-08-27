
# Prepare workspace -------------------------------------------------------

## Load libraries
library(data.table)
library(brms)
library(datawizard)

## Load data
data("ice_data")

ice_std <- standardize(ice_data)

## Priors
priors <- prior(normal(0, 3), class = b)

## Hyperparameters
.chains = 5; .warmup = 2000; .cores = 5; .seed = 1234;
.iter = 4000; .control = list(adapt_delta = .99, max_treedepth = 50)

# HRV -> Presión ----------------------------------------------------------

m_sdnn <- brm(
  formula = bf(mvbind(bp_systolic, bp_diastolic) ~ basal_sdnn) +
    set_rescor(TRUE),
  data = ice_std, family = gaussian(), prior = priors,
  chains = .chains, warmup = .warmup, cores = .cores,
  iter = .iter, control = .control,
  file = "docs/models/m_sdnn.RDS")

m_rmssd <- brm(
  formula = bf(mvbind(bp_systolic, bp_diastolic) ~ basal_rmssd) +
    set_rescor(TRUE),
  data = ice_std, family = gaussian(), prior = priors,
  chains = .chains, warmup = .warmup, cores = .cores,
  iter = .iter, control = .control,
  file = "docs/models/m_rmssd.RDS")

m_hf <- brm(
  formula = bf(mvbind(bp_systolic, bp_diastolic) ~ basal_hf) +
    set_rescor(TRUE),
  data = ice_std, family = gaussian(), prior = priors,
  chains = .chains, warmup = .warmup, cores = .cores,
  iter = .iter, control = .control,
  file = "docs/models/m_hf.RDS")

m_lf <- brm(
  formula = bf(mvbind(bp_systolic, bp_diastolic) ~ basal_lf_2) +
    set_rescor(TRUE),
  data = ice_std, family = gaussian(), prior = priors,
  chains = .chains, warmup = .warmup, cores = .cores,
  iter = .iter, control = .control,
  file = "docs/models/m_lf.RDS")

m_pns <- brm(
  formula = bf(mvbind(bp_systolic, bp_diastolic) ~ basal_pns) +
    set_rescor(TRUE),
  data = ice_std, family = gaussian(), prior = priors,
  chains = .chains, warmup = .warmup, cores = .cores,
  iter = .iter, control = .control,
  file = "docs/models/m_pns.RDS")

m_sns <- brm(
  formula = bf(mvbind(bp_systolic, bp_diastolic) ~ basal_sns) +
    set_rescor(TRUE),
  data = ice_std, family = gaussian(), prior = priors,
  chains = .chains, warmup = .warmup, cores = .cores,
  iter = .iter, control = .control,
  file = "docs/models/m_sns.RDS")

m_stress <- brm(
  formula = bf(mvbind(bp_systolic, bp_diastolic) ~ basal_stress_index) +
    set_rescor(TRUE),
  data = ice_std, family = gaussian(), prior = priors,
  chains = .chains, warmup = .warmup, cores = .cores,
  iter = .iter, control = .control,
  file = "docs/models/m_stress.RDS")


