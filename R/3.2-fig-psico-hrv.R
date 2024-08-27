
# Prepare workspace -------------------------------------------------------

## Load libraries
library(data.table)
library(ggplot2)

## Load dataset
data("ice_data")

## Load functions
source("R/_functions.R")

## Load models
m_bai_score <- readRDS(file = "docs/models/m_bai_score.RDS")
m_bdi_score <- readRDS(file = "docs/models/m_bdi_score.RDS")

# Plot --------------------------------------------------------------------

fig_a <- get_posterior(m_bai_score) |>
  as.data.table() |>
  melt(measure.vars = 1:7) |>
  ggplot(aes(value, variable)) +
  tidybayes::stat_halfeye(aes(fill = after_stat(abs(x) > .1)), show.legend = FALSE) +
  geom_vline(xintercept = c(-.1, .1), lwd = .5, alpha = .5) +
  labs(x = "Efecto Estandarizado", y = NULL,
       title = "Efecto de la ansiedad",
       subtitle = "Sobre la modulación autonómica cardíaca") +
  theme_classic() +
  scale_y_discrete(expand = c(0,0.2,0,0),
                   labels = c("RMSSD", "SDNN", "LF", "HF",
                              "PNS", "SNS", "Stress")) +
  ggsci::scale_fill_jama()

fig_b <- get_posterior(m_bdi_score) |>
  as.data.table() |>
  melt(measure.vars = 1:7) |>
  ggplot(aes(value, variable)) +
  tidybayes::stat_halfeye(aes(fill = after_stat(abs(x) > .1)), show.legend = FALSE) +
  geom_vline(xintercept = c(-.1, .1), lwd = .5, alpha = .5) +
  labs(x = "Efecto Estandarizado", y = NULL,
       title = "Efecto de la depresión",
       subtitle = "Sobre la modulación autonómica cardíaca") +
  theme_classic() +
  scale_y_discrete(expand = c(0,0.2,0,0),
                   labels = c("RMSSD", "SDNN", "LF", "HF",
                              "PNS", "SNS", "Stress")) +
  ggsci::scale_fill_jama()

fig_2 <- ggpubr::ggarrange(
  fig_a, fig_b,
  ncol = 2, align = "hv"
)

ggsave(filename = "docs/fig2.svg", device = "svg",
       width = 12, height = 6, scale = 2/3)
