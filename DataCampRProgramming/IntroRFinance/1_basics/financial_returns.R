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

financial_returns2() {
    


}

financial_returns1()