# sapply() stands for simple apply 
# it try to simplify list to array

temp <- list(
    c(3, 7, 9, 6, - 1),
    c(6, 9, 12, 13, 5),
    c(4, 8, 3, -1, - 3),
    c(1, 4, 7, 2, - 2),
    c(5, 7, 9, 4, 2),
    c(-3, 3, 5, 8, 9, 4),
    c(3, 6, 9, 4, 1))

simple_sapply_sample <- function() {
    result <- lapply(temp, min)
    print(result)
    result <- sapply(temp, min)
    print(result)
    result <- lapply(temp, max)
    #print(result)
    result <- sapply(temp, max)
    #print(result)
}

sapply_with_own_function <- function() {
    extremes_avg <- function(x) {
        (min(x) + max(x)) / 2
    }

    result <- sapply(temp, extremes_avg)
    print(result)
    lapply(temp, extremes_avg)
}

sapply_with_function_returning_vector <- function() {
    extremes <- function(x) {
        c(min = min(x), max = max(x))
    }

    result <- sapply(temp, extremes)
    print(result)
    lapply(temp, extremes)
}

cannot_simplify <- function() {
    below_zero <- function(x) {
        return (x[x < 0])
    }
    freezing_s <- sapply(temp, below_zero)
    print(freezing_s)

    freezing_l <- lapply(temp, below_zero)
    print(freezing_l)

    is_identical = identical(freezing_s, freezing_l)
    #sprintf("is_identical: %i", is_identical)
    print(is_identical)

}

sapply_with_functions_that_return_NULL <- function() {
    print_info <- function(x) {
        cat("The average temperature is", mean(x), "\n")
    }
    result <- sapply(temp, print_info)
    print(result)
    result <- lapply(temp, print_info)
    print(result)
}

#simple_sapply_sample()
#sapply_with_own_function()
#sapply_with_function_returning_vector()
#cannot_simplify()
sapply_with_functions_that_return_NULL()