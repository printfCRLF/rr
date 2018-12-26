optional_arguments <- function() {
    # Round 5.4
    round(5.4)

    # Round 5.4 with 1 decimal place
    round(5.4, digits = 1)

    # numbers
    numbers <- c(.002623, pi, 812.33345)

    # Round numbers to 3 decimal places
    round(numbers, digits = 3)
}

functions_in_functions <- function() {
    # cbind() the stocks
    stocks <- cbind(apple, ibm, micr)

    # cor() to create the correlation matrix
    cor(stocks)

    # All at once! Nest cbind() inside of cor()
    cor(cbind(apple, ibm, micr))
}

your_first_function <- function() {
    # Percent to decimal function
    percent_to_decimal <- function(percent) {
        percent / 100
    }

    # Use percent_to_decimal() on 6
    percent_to_decimal(6)

    # Example percentage
    pct <- 8

    # Use percent_to_decimal() on pct
    percent_to_decimal(pct)

}
percent_to_decimal <- function(percent, digits = 2) {
    decimal <- percent / 100

    round(decimal, digits)
}

multiple_arguments <- function() {
    # Percent to decimal function


    # percents
    percents <- c(25.88, 9.045, 6.23)

    # percent_to_decimal() with default digits
    percent_to_decimal(percents)

    # percent_to_decimal() with digits = 4
    percent_to_decimal(percents, digits = 4)
}

multiple_arguments2 <- function() {
    # Present value function
    pv <- function(cash_flow, i, year) {

        # Discount multiplier
        mult <- 1 + percent_to_decimal(i)

        # Present value calculation
        cash_flow * mult ^ -year
    }

    # Calculate a present value
    pv(1200, 7, 3)

}

#optional_arguments()
#functions_in_functions()
#your_first_function()
#multiple_arguments()
multiple_arguments2()

