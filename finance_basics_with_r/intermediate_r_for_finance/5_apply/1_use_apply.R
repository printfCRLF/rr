apple <- c(0.37446342, -0.71883530, 0.76986527, 0.98226467, 0.98171665, 1.63217981, -0.57042563, 1.66813769, 0.00000000, 0.54692248, 0.12951131, 0.57773562, 0.26577503, 0.09405729, -0.65778233, 0.19778141, 0.63508411, -0.42640287, -0.02569373, -0.77957680)

ibm <- c(0.1251408, -0.1124859, 0.3190691, 2.7689429, 0.3458948, 0.7014998, -0.6125390, 1.6858006, 0.1307267, -0.2907839, -0.7677657, -0.0299886, 0.5519558, -0.1610979, -0.1613578, -0.2095056, 0.2579329, -0.5683858, 0.2467056, -0.3661465)

micr <- c(0.08445946, 1.63713080, -0.44835603, 2.36864053, -0.58660583, 1.57351254, 0.32273681, 1.30287920, -0.47634170, -0.15954052, -0.44742729, 2.11878010, -0.12574662, 0.00000000, 0.01573812, -0.48780488, 0.06325111, -0.45828066, -0.14287982, -1.20826709)

stock_return <- list(
    apple = apple,
    ibm = ibm,
    micr = micr)


percent_to_decimal <- function(percent, digits = 2) {
    decimal <- percent / 100
    round(decimal, digits)
}

lapply_on_list <- function(stock_return) {
    lapply(stock_return, percent_to_decimal)
}

sharpe <- function(returns) {
    (mean(returns) - .0003) / sd(returns)
}

lapply_on_dataframe <- function(stock_return) {
    stock_means <- lapply(stock_return, mean)
    print("stock means")
    print(stock_means)

    stock_sharp <- lapply(stock_return, sharpe)
    print("stock sharp ratio")
    print(stock_sharp)
}

fun_argument <- function(stock_return) {
    # sharpe
    sharpe <- function(returns, rf = 0.0003) {
        (mean(returns) - rf) / sd(returns)
    }

    # First lapply()
    lapply(stock_return, sharpe, rf = 0.0004)

    # Second lapply()
    lapply(stock_return, sharpe, rf = 0.0009)
}

sapply_examples <- function(stock_return) {
    # lapply() on stock_return
    lapply(stock_return, sharpe)

    # sapply() on stock_return
    sapply(stock_return, sharpe)

    # sapply() on stock_return with optional arguments
    sapply(stock_return, sharpe, simplify = FALSE, USE.NAMES = FALSE)
}

failing_to_simplify <- function() {
    # Market crash with as.Date()
    market_crash <- list(dow_jones_drop = 777.68,
                     date = as.Date("2008-09-28"))

    # Find the classes with sapply()
    sapply(market_crash, class)

    # Market crash with as.POSIXct()
    market_crash2 <- list(dow_jones_drop = 777.68,
                      date = as.POSIXct("2008-09-28"))

    # Find the classes with lapply()
    lapply(market_crash2, class)

    # Find the classes with sapply()
    sapply(market_crash2, class)

}

vapply_examples <- function() {
    market_crash2 <- list(dow_jones_drop = 777.68,
                      date = as.POSIXct("2008-09-28"))

    sapply(market_crash2, class)

    vapply(market_crash2, class, FUN.VALUE = character(1))
}

vapply_examples2 <- function(stock_return) {
    vapply(stock_return, sharpe, FUN.VALUE = numeric(1))

    summary(stock_return$apple)

    vapply(stock_return, summary, FUN.VALUE = numeric(6))
}

anonymous_function <- function(stock_return) {
    # Max and min
    vapply(stock_return,
       FUN = function(x) { c(max(x), min(x)) },
       FUN.VALUE = numeric(2))

}


#lapply_on_list(stock_return)
#lapply_on_dataframe(stock_return)
#fun_argument(stock_return)
#sapply_examples(stock_return)
#failing_to_simplify()
vapply_examples2(stock_return)
anonymous_function(stock_return)

