x <- c(1, 2, NA, 3, NA)
y <- c(NA, 3, NA, 3, 4)

start_simple <- function(x, y) {
    # Count how many elements are missing in both x and y
    x_na <- is.na(x)
    b_na <- is.na(y)

    sum(x_na & b_na)
}

rewrite_as_function <- function(x, y) {
    both_na <- function(x, y) {
        sum(is.na(x) & is.na(y))
    }

    x <- c(NA, NA, NA)
    y1 <- c(1, NA, NA)
    y2 <- c(1, NA, NA, NA)

    both_na(x, y1)
    both_na(x, y2)
}

rewrite_as_function()
