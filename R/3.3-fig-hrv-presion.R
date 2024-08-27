
# Prepare workspace -------------------------------------------------------

## Load libraries
library(data.table)
library(ggplot2)

## Load dataset
data("ice_data")

## Load functions
source("R/_functions.R")

## Load models
m_stress <- readRDS(file = "docs/models/m_stress.RDS")
m_sns <- readRDS(file = "docs/models/m_sns.RDS")
m_pns <- readRDS(file = "docs/models/m_pns.RDS")
m_lf <- readRDS(file = "docs/models/m_lf.RDS")
m_hf <- readRDS(file = "docs/models/m_hf.RDS")
m_sdnn <- readRDS(file = "docs/models/m_sdnn.RDS")
m_rmssd <- readRDS(file = "docs/models/m_rmssd.RDS")

# Plot --------------------------------------------------------------------

fig_a <- get_posterior(m_rmssd) |>
  as.data.table() |>
  melt(measure.vars = 1:2) |>
  ggplot(aes(value, variable)) +
  tidybayes::stat_halfeye(aes(fill = after_stat(abs(x) > .1)), show.legend = FALSE) +
  geom_vline(xintercept = c(-.1, .1), lwd = .5, alpha = .5) +
  labs(x = "Efecto Estandarizado", y = NULL,
       title = "Efecto del RMSSD",
       subtitle = "Sobre el control hemodinámico") +
  theme_classic() +
  scale_y_discrete(expand = c(0,0.2,0,0),
                   labels = c("PAS", "PAD")) +
  ggsci::scale_fill_jama()

fig_b <- get_posterior(m_sdnn) |>
  as.data.table() |>
  melt(measure.vars = 1:2) |>
  ggplot(aes(value, variable)) +
  tidybayes::stat_halfeye(aes(fill = after_stat(abs(x) > .1)), show.legend = FALSE) +
  geom_vline(xintercept = c(-.1, .1), lwd = .5, alpha = .5) +
  labs(x = "Efecto Estandarizado", y = NULL,
       title = "Efecto del SDNN",
       subtitle = "Sobre el control hemodinámico") +
  theme_classic() +
  scale_y_discrete(expand = c(0,0.2,0,0),
                   labels = c("PAS", "PAD")) +
  ggsci::scale_fill_jama()

fig_c <- get_posterior(m_hf) |>
  as.data.table() |>
  melt(measure.vars = 1:2) |>
  ggplot(aes(value, variable)) +
  tidybayes::stat_halfeye(aes(fill = after_stat(abs(x) > .1)), show.legend = FALSE) +
  geom_vline(xintercept = c(-.1, .1), lwd = .5, alpha = .5) +
  labs(x = "Efecto Estandarizado", y = NULL,
       title = "Efecto del HF",
       subtitle = "Sobre el control hemodinámico") +
  theme_classic() +
  scale_y_discrete(expand = c(0,0.2,0,0),
                   labels = c("PAS", "PAD")) +
  ggsci::scale_fill_jama()

fig_d <- get_posterior(m_lf) |>
  as.data.table() |>
  melt(measure.vars = 1:2) |>
  ggplot(aes(value, variable)) +
  tidybayes::stat_halfeye(aes(fill = after_stat(abs(x) > .1)), show.legend = FALSE) +
  geom_vline(xintercept = c(-.1, .1), lwd = .5, alpha = .5) +
  labs(x = "Efecto Estandarizado", y = NULL,
       title = "Efecto del LF",
       subtitle = "Sobre el control hemodinámico") +
  theme_classic() +
  scale_y_discrete(expand = c(0,0.2,0,0),
                   labels = c("PAS", "PAD")) +
  ggsci::scale_fill_jama()

fig_e <- get_posterior(m_pns) |>
  as.data.table() |>
  melt(measure.vars = 1:2) |>
  ggplot(aes(value, variable)) +
  tidybayes::stat_halfeye(aes(fill = after_stat(abs(x) > .1)), show.legend = FALSE) +
  geom_vline(xintercept = c(-.1, .1), lwd = .5, alpha = .5) +
  labs(x = "Efecto Estandarizado", y = NULL,
       title = "Efecto del índice PNS",
       subtitle = "Sobre el control hemodinámico") +
  theme_classic() +
  scale_y_discrete(expand = c(0,0.2,0,0),
                   labels = c("PAS", "PAD")) +
  ggsci::scale_fill_jama()

fig_f <- get_posterior(m_sns) |>
  as.data.table() |>
  melt(measure.vars = 1:2) |>
  ggplot(aes(value, variable)) +
  tidybayes::stat_halfeye(aes(fill = after_stat(abs(x) > .1)), show.legend = FALSE) +
  geom_vline(xintercept = c(-.1, .1), lwd = .5, alpha = .5) +
  labs(x = "Efecto Estandarizado", y = NULL,
       title = "Efecto del índice SNS",
       subtitle = "Sobre el control hemodinámico") +
  theme_classic() +
  scale_y_discrete(expand = c(0,0.2,0,0),
                   labels = c("PAS", "PAD")) +
  ggsci::scale_fill_jama()

fig_g <- get_posterior(m_stress) |>
  as.data.table() |>
  melt(measure.vars = 1:2) |>
  ggplot(aes(value, variable)) +
  tidybayes::stat_halfeye(aes(fill = after_stat(abs(x) > .1)), show.legend = FALSE) +
  geom_vline(xintercept = c(-.1, .1), lwd = .5, alpha = .5) +
  labs(x = "Efecto Estandarizado", y = NULL,
       title = "Efecto del índice Stress",
       subtitle = "Sobre el control hemodinámico") +
  theme_classic() +
  scale_y_discrete(expand = c(0,0.2,0,0),
                   labels = c("PAS", "PAD")) +
  ggsci::scale_fill_jama()


fig_3 <- ggpubr::ggarrange(
  ggpubr::ggarrange(fig_a, fig_b, fig_c, fig_d, ncol = 2, nrow = 2, align = "hv"),
  ggpubr::ggarrange(fig_e, fig_f, fig_g, ncol = 3, align = "hv"),
  nrow = 2, heights = c(2,1)
)

ggsave(filename = "docs/fig3.svg", device = "svg",
       width = 12, height = 12, scale = 2/3)
