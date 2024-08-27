
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


# Body comp -> HRV --------------------------------------------------------

m_weight <- brm(
  formula = bf(mvbind(basal_rmssd, basal_sdnn,
                   basal_lf_2, basal_hf,
                   basal_pns, basal_sns,
                   basal_stress_index) ~ tanita_weight) +
    set_rescor(TRUE),
  data = ice_std, family = gaussian(), prior = priors,
  chains = .chains, warmup = .warmup, cores = .cores,
  iter = .iter, control = .control,
  file = "docs/models/m_weight.RDS")

m_fat_total <- brm(
  formula = bf(mvbind(basal_rmssd, basal_sdnn,
                   basal_lf_2, basal_hf,
                   basal_pns, basal_sns,
                   basal_stress_index) ~ fat_total) +
    set_rescor(TRUE),
  data = ice_std, family = gaussian(), prior = priors,
  chains = .chains, warmup = .warmup, cores = .cores,
  iter = .iter, control = .control,
  file = "docs/models/m_fat_total.RDS")

m_visceral_fat <- brm(
  formula = bf(mvbind(basal_rmssd, basal_sdnn,
                   basal_lf_2, basal_hf,
                   basal_pns, basal_sns,
                   basal_stress_index) ~ visceral_fat) +
    set_rescor(TRUE),
  data = ice_std, family = gaussian(), prior = priors,
  chains = .chains, warmup = .warmup, cores = .cores,
  iter = .iter, control = .control,
  file = "docs/models/m_visceral_fat.RDS")

m_muscle <- brm(
  formula = bf(mvbind(basal_rmssd, basal_sdnn,
                   basal_lf_2, basal_hf,
                   basal_pns, basal_sns,
                   basal_stress_index) ~ muscle_total) +
    set_rescor(TRUE),
  data = ice_std, family = gaussian(), prior = priors,
  chains = .chains, warmup = .warmup, cores = .cores,
  iter = .iter, control = .control,
  file = "docs/models/m_muscle.RDS")

