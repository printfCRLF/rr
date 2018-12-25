# vapply() has a pre-specificed type of return value

temp <- list(
    c(3, 7, 9, 6, - 1),
    c(6, 9, 12, 13, 5),
    c(4, 8, 3, -1, - 3),
    c(1, 4, 7, 2, - 2),
    c(5, 7, 9, 4, 2),
    c(-3, 3, 5, 8, 9, 4),
    c(3, 6, 9, 4, 1))

use_vapply <- function() {
    basics <- function(x) {
        c(min = min(x), mean = mean(x), max = max(x))
    }

    result <- vapply(temp, FUN.VALUE = numeric(3), basics)
    print(result)
}

use_vapply2 <- function() {
    basics4 <- function(arr) {
        c(min = min(arr), mean = mean(arr), median = median(arr), max = max(arr))
    }

    result <- vapply(temp, FUN.VALUE = numeric(4), basics4)
    print(result)
}

convert_sapply_to_vapply <- function() {
    vapply(temp, FUN.VALUE = numeric(1), max)

    result <- vapply(temp, FUN.VALUE = logical(1), function(x, y) { mean(x) > y }, y = 5)
    print(result)
}

#use_vapply()
#use_vapply2()
convert_sapply_to_vapply()
