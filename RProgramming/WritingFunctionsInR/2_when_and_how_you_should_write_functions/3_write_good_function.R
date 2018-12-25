mean_ci <- function(level, x) {
    se <- sd(x) / sqrt(length(x))
    alpha <- 1 - level
    mean(x) + se * qnorm(c(alpha / 2, level / 2))
}

# Alter the arguments to mean_ci
mean_ci <- function(x, level = 0.95) {
    se <- sd(x) / sqrt(length(x))
    alpha <- 1 - level
    mean(x) + se * qnorm(c(alpha / 2, 1 - alpha / 2))
}

# Alter the mean_ci function
mean_ci <- function(x, level = 0.95) {
    if (length(x) == 0) {
        warning("`x` was empty", call. = FALSE)
        return(c(-Inf, Inf))
    }
    se <- sd(x) / sqrt(length(x))
    alpha <- 1 - level
    mean(x) + se * qnorm(c(alpha / 2, 1 - alpha / 2))
}

df <- data.frame(
    z = rnorm(10)
                 )

replace_missings <- function(x, replacement) {
    is_miss <- is.na(x)
    x[is_miss] <- replacement

    # Rewrite to use message()
    message(sum(is_miss), replacement)
    x
}

# Check your new function by running on df$z
replace_missings(df$z, 0)