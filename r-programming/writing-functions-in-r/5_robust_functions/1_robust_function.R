
an_error_is_better_than_a_surprise <- function() {
    # Define troublesome x and y
    x <- c(NA, NA, NA)
    y <- c(1, NA, NA, NA)

    both_na <- function(x, y) {
        # Add stopifnot() to check length of x and y
        stopifnot(length(x) == length(y))

        sum(is.na(x) & is.na(y))
    }

    # Call both_na() on x and y

    both_na(x, y)
}

an_informative_error_is_even_better <- function() {
    # Define troublesome x and y
    x <- c(NA, NA, NA)
    y <- c(1, NA, NA, NA)

    both_na <- function(x, y) {
        # Replace condition with logical
        if (length(x) != length(y)) {
            # Replace "Error" with better message
            stop("x and y must have the same length", call. = FALSE)
        }

        sum(is.na(x) & is.na(y))
    }

    # Call both_na() 
    both_na(x, y)
}

#an_error_is_better_than_a_surprise()
an_informative_error_is_even_better()