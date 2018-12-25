# Load the purrr package
library(purrr)

the_map_functions <- function(df) {
    df <- data.frame(
        a = rnorm(10),
        b = rnorm(10),
        c = rnorm(10),
        d = rnorm(10)
        )

    map_dbl(df, mean)
    map_dbl(df, median)
    map_dbl(df, sd)
}

pass_arguments_to_functions <- function() {

    year <- c(1956, 1975, 1977, 1996, 2010, NA)
    engines <- c(4, 1, 2, 2, 2, 1)
    seats <- c(102, 4, 139, 142, 20, 2)
    speed <- c(232, 108, 432, NA, NA, NA)

    planes <- list(
               year = year,
               engines = engines,
               seats = seats,

    speed = speed)
    map_dbl(planes, mean)
    map_dbl(planes, mean, na.rm = TRUE)
    map_dbl(planes, quantile, probs = c(0.05), na.rm = TRUE)
}

picking_the_right_map_function <- function() {
    df3 <- data.frame(
        a = rnorm(10),
        b = c("A", "B", "A", "B", "A", "B", "A", "B", "A", "B"),
        c = 1:10,
        a = rnorm(10)
        )

    map_lgl(df3, is.numeric) # logic
    map_chr(df3, typeof) # character
    map(df3, summary) # list
}

#the_map_functions()
#pass_arguments_to_functions()
picking_the_right_map_function()
