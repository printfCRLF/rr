library(purrr)

funs <- list(Normal = "rnorm", Uniform = "runif", Exp = "rexp")
params <- list(
        Normal = list(mean = 10),
        Uniform = list(min = 0, max = 5),
        Exp = list(rate = 5)
    )

sims <- invoke_map(funs, params, n = 50)

walk_example <- function(sims) {
    walk(sims, hist)
}

walking_over_two_or_more_arguments <- function(sim) {
    # Replace "Sturges" with reasonable breaks for each sample
    breaks_list <- list(
      Normal = seq(6, 16, 0.5),
      Uniform = seq(0, 5, 0.25),
      Exp = seq(0, 1.5, 0.1)
    )

    # Use walk2() to make histograms with the right breaks
    walk2(sims, breaks_list, hist)
}

find_breaks <- function(x) {
    rng <- range(x, na.rm = TRUE)
    seq(rng[1], rng[2], length.out = 30)
}

nice_breaks <- function(sim) {
    # Call find_breaks() on sims[[1]]
    find_breaks(sims[[1]])

    # Use map() to iterate find_breaks() over sims: nice_breaks
    nice_breaks <- map(sims, find_breaks)

    # Use nice_breaks as the second argument to walk2()
    walk2(sims, nice_breaks, hist)
}

pwalk_example <- function() {
    # Increase sample size to 1000
    sims <- invoke_map(funs, params, n = 1000)

    # Compute nice_breaks (don't change this)
    nice_breaks <- map(sims, find_breaks)

    # Create a vector nice_titles
    nice_titles <- list("Normal(10, 1)", "Uniform(0, 5)", "Exp(5)")

    # Use pwalk() instead of walk2()
    pwalk(list(x = sims, breaks = nice_breaks, main = nice_titles), hist, xlab = "")
}

walking_with_pipes <- function() {
    sims %>%
    walk(hist) %>% map(summary)
}

#walk_example()
#walking_over_two_or_more_arguments()
#pwalk_example()
walking_with_pipes()

