get_posterior <- function(model, regex) {
  if (missing(regex)) {
    regex <- grep("[a-zA-Z]", model$prior$coef, value = TRUE) |>
      unique() |>
      paste0(collapse = "|")
  }
  posterior <- model |>
    as.data.frame() |>
    dplyr::select(dplyr::contains(regex))
  return(posterior)
}

sim_gaussian_prior <- function(posterior, mu, sigma, seed = 1234) {
  n_vars <- ncol(posterior); n_samples <- nrow(posterior)

  set.seed(seed)
  prior_df <- rnorm(n = n_samples * n_vars,
                    mean = mu,
                    sd = sigma) |>
    matrix(ncol = n_vars) |>
    as.data.frame()
  return(prior_df)
}

summary_model <- function(model, regex, mu = 0, sigma = 3, seed = 1234) {

  posterior <- get_posterior(model, regex)
  prior_df <- sim_gaussian_prior(posterior, mu, sigma, seed = 1234)

  bayestestR::describe_posterior(
    posterior = posterior,
    test = c("pd","ps","rope","bf"),
    bf_prior = prior_df
  )
}
