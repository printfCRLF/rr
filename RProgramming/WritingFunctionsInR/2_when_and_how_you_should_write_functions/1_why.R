x <- c(1:10, NA)

start_with_a_snippet_of_code <- function(x) {
    # Rewrite this snippet to refer to x
    (x - min(x, na.rm = TRUE)) /
    (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
}

rewrite_for_clarity <- function() {
    # Define rng
    rng <- range(x, na.rm = TRUE)
    # Rewrite this snippet to refer to the elements of rng
    (x - rng[1]) / (rng[2] - rng[1])
}

turn_info_function <- function(x) {
    rescale01 <- function(x) {
        rng <- range(x, na.rm = TRUE)
        (x - rng[1]) / (rng[2] - rng[1])
    }

    rescale01(x)
}

turn_info_function(x)

