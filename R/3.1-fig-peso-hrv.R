
# Prepare workspace -------------------------------------------------------

## Load libraries
library(data.table)
library(ggplot2)

## Load dataset
data("ice_data")

## Load functions
source("R/_functions.R")

## Load models
m_muscle <- readRDS(file = "docs/models/m_muscle.RDS")
m_fat_total <- readRDS(file = "docs/models/m_fat_total.RDS")
m_visceral_fat <- readRDS(file = "docs/models/m_visceral_fat.RDS")
m_weight <- readRDS(file = "docs/models/m_weight.RDS")

# Plot --------------------------------------------------------------------

fig_a <- get_posterior(m_muscle) |>
  as.data.table() |>
  melt(measure.vars = 1:7) |>
  ggplot(aes(value, variable)) +
  tidybayes::stat_halfeye(aes(fill = after_stat(abs(x) > .1)), show.legend = FALSE) +
  geom_vline(xintercept = c(-.1, .1), lwd = .5, alpha = .5) +
  labs(x = "Efecto Estandarizado", y = NULL,
       title = "Efecto de la masa muscular",
       subtitle = "Sobre la modulación autonómica cardíaca") +
  theme_classic() +
  scale_y_discrete(expand = c(0,0.2,0,0),
                   labels = c("RMSSD", "SDNN", "LF", "HF",
                              "PNS", "SNS", "Stress")) +
  ggsci::scale_fill_jama()

fig_b <- get_posterior(m_weight) |>
  as.data.table() |>
  melt(measure.vars = 1:7) |>
  ggplot(aes(value, variable)) +
  tidybayes::stat_halfeye(aes(fill = after_stat(abs(x) > .1)), show.legend = FALSE) +
  geom_vline(xintercept = c(-.1, .1), lwd = .5, alpha = .5) +
  labs(x = "Efecto Estandarizado", y = NULL,
       title = "Efecto del peso corporal",
       subtitle = "Sobre la modulación autonómica cardíaca") +
  theme_classic() +
  scale_y_discrete(expand = c(0,0.2,0,0),
                   labels = c("RMSSD", "SDNN", "LF", "HF",
                              "PNS", "SNS", "Stress")) +
  ggsci::scale_fill_jama()

fig_c <- get_posterior(m_fat_total) |>
  as.data.table() |>
  melt(measure.vars = 1:7) |>
  ggplot(aes(value, variable)) +
  tidybayes::stat_halfeye(aes(fill = after_stat(abs(x) > .1)), show.legend = FALSE) +
  geom_vline(xintercept = c(-.1, .1), lwd = .5, alpha = .5) +
  labs(x = "Efecto Estandarizado", y = NULL,
       title = "Efecto de la grasa corporal",
       subtitle = "Sobre la modulación autonómica cardíaca") +
  theme_classic() +
  scale_y_discrete(expand = c(0,0.2,0,0),
                   labels = c("RMSSD", "SDNN", "LF", "HF",
                              "PNS", "SNS", "Stress")) +
  ggsci::scale_fill_jama()

fig_d <- get_posterior(m_visceral_fat) |>
  as.data.table() |>
  melt(measure.vars = 1:7) |>
  ggplot(aes(value, variable)) +
  tidybayes::stat_halfeye(aes(fill = after_stat(abs(x) > .1)), show.legend = FALSE) +
  geom_vline(xintercept = c(-.1, .1), lwd = .5, alpha = .5) +
  labs(x = "Efecto Estandarizado", y = NULL,
       title = "Efecto de la grasa visceral",
       subtitle = "Sobre la modulación autonómica cardíaca") +
  theme_classic() +
  scale_y_discrete(expand = c(0,0.2,0,0),
                   labels = c("RMSSD", "SDNN", "LF", "HF",
                              "PNS", "SNS", "Stress")) +
  ggsci::scale_fill_jama()

fig_1 <- ggpubr::ggarrange(
  fig_a, fig_b, fig_c, fig_d,
  ncol = 2, nrow = 2, align = "hv"
)

ggsave(filename = "docs/fig1.svg", device = "svg",
       width = 12, height = 12, scale = 2/3)
