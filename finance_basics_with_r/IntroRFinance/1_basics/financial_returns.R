financial_returns1 <- function() {
    # Variables for starting_cash and 5% return during January
    starting_cash <- 200
    jan_ret <- 5
    jan_mult <- 1 + (jan_ret / 100)

    # How much money do you have at the end of January?
    post_jan_cash <- starting_cash * jan_mult

    # Print post_jan_cash
    print(post_jan_cash)

    # January 10% return multiplier
    jan_ret_10 <- 10
    jan_mult_10 <- 1 + 10 / 100

    # How much money do you have at the end of January now?
    post_jan_cash_10 <- starting_cash * jan_mult_10

    # Print post_jan_cash_10
    print(post_jan_cash_10)
}

financial_returns2 <- function() {
    # Starting cash and returns 
    starting_cash <- 200
    jan_ret <- 4
    feb_ret <- 5

    # Multipliers
    jan_mult <- 1 + jan_ret / 100
    feb_mult <- 1 + feb_ret / 100

    # Total cash at the end of the two months
    total_cash <- starting_cash * jan_mult * feb_mult

    # Print total_cash
    print(total_cash)
}

#financial_returns1()
financial_returns2()