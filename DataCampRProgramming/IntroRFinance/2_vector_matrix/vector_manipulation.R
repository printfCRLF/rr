
weighted_average <- function() {
    micr_ret <- 7
    sony_ret <- 9
    micr_weight <- 0.2
    sony_weight <- 0.8

    portf_ret <- micr_ret * micr_weight + sony_ret * sony_weight
}

weighted_average2 <- function() {
    returns <- c(7, 9)
    weights <- c(0.2, 0.8)
    companies <- c("Microsoft", "Sony")

    names(returns) <- companies
    names(weights) <- companies

    ret_X_weight <- returns * weights
    print(ret_X_weight)

    portfolio_return <- sum(ret_X_weight)
    print(portfolio_return)
}

weighted_average3 <- function() {
    returns <- c(1.4, 4.8, 1.8)
    names <- c("Microsoft", "Apple", "Sony")
    names(returns) <- names
    weights <- 1 / 3
    ret_X_weight <- returns * weights

    portfolio_return <- sum(ret_X_weight)
    print(portfolio_return)

    result <- returns * c(.2, .6)
    print(result)

}

vector_subsetting <- function() {
    ret <- c(5, 2, 3, 7, 8, 3, 5, 9, 1, 4, 6, 3)

    result <- ret[1:6]
    print(result)
    c(ret["Mar"], ret["May"])

    # all items in the vector except for the first month
    result <- ret[-1]
    print(result)
}

#weighted_average()
#weighted_average2()
#weighted_average3()
vector_subsetting()
