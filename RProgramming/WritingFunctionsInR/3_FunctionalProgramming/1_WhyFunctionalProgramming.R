df <- data.frame(
    a = rnorm(10),
    b = rnorm(10),
    c = rnorm(10),
    d = rnorm(10)
    )

col_median <- function(df) {
    output <- numeric(ncol(df))
    for (i in seq_along(df)) {
        output[[i]] <- median(df[[i]])
    }
    output
}

col_mean <- function(df) {
    output <- numeric(ncol(df))
    for (i in seq_along(df)) {
        output[[i]] <- mean(df[[i]])
    }
    output
}

col_sd <- function(df) {
    output <- numeric(ncol(df))
    for (i in seq_along(df)) {
        output[[i]] <- sd(df[[i]])
    }
    output
}

col_summary <- function(df, fun) {
    output <- numeric(ncol(df))
    for (i in seq_along(df)) {
        output[[i]] <- fun(df[[i]])
    }
    output
}

# Find the column medians using col_median() and col_summary()
col_median(df)
col_summary(df, fun = median)

# Find the column means using col_mean() and col_summary()
col_mean(df)
col_summary(df, fun = mean)

# Find the column IQRs using col_summary()
col_summary(df, fun = IQR)


