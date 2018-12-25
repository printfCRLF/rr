library(purrr)

map1 <- function() {
    # Create a list n containing the values: 5, 10, and 20
    n <- list(5, 10, 20)

    # Call map() on n with rnorm() to simulate three samples
    result <- map(n, rnorm)
    print(result)
}

map_over_two_arguments <- function() {
    # Initialize n
    n <- list(5, 10, 20)

    # Create a list mu containing the values: 1, 5, and 10
    mu <- list(1, 5, 10)

    # Edit to call map2() on n and mu with rnorm() to simulate three samples
    result <- map2(n, mu, rnorm)
    print(result)
}

map_over_multiple_arguments <- function() {
    n <- list(5, 10, 20)
    means <- list(1, 5, 10)
    sd <- list(0.1, 1, 0.1)

    result <- pmap(list(n, means, sd), rnorm)
    print(result)

    pmap(list(mean = mu, n = n, sd = sd), rnorm)
}

mapping_over_functions <- function() {
    # Define list of functions
    funs <- list("rnorm", "runif", "rexp")

    # Parameter list for rnorm()
    rnorm_params <- list(mean = 10)

    # Add a min element with value 0 and max element with value 5
    runif_params <- list(min = 0, max = 5)

    # Add a rate element with value 5
    rexp_params <- list(rate = 5)

    # Define params for each function
    params <- list(
      rnorm_params,
      runif_params,
      rexp_params
    )

    # Call invoke_map() on funs supplying params and setting n to 5
    invoke_map(funs, params, n = 5)
}

#map1()
#map_over_two_arguments()
#map_over_multiple_arguments()
mapping_over_functions()


