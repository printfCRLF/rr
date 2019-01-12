library(zoo)
library(xts)
library(PerformanceAnalytics)
library(quantmod)

prices_to_returns <- function(prices) {
    returns <- Return.calculate(prices)
    returns <- returns[-1,]
    returns
}

data <- readRDS("./data/port_spec_fi_lo_ret.rds")
data <- readRDS("./data/port_spec_ws_lo_ret_ri_ribud.rds")
data <- readRDS("./data/rp_fi_lo_ret.rds")
data <- readRDS("./data/rp_ws_lo_ret_ri_ribud.rds")

create_portfolio_spec <- function() {
    # Get the column names of the returns data
    asset_names <- colnames(asset_returns)

    # Create a portfolio specification object using asset_names
    port_spec <- portfolio.spec(assets = asset_names)

    # Get the class of the portfolio specification object
    class(port_spec)

    # Print the portfolio specification object
    print(port_spec)
}

add_constraints <- function() {
    # Add the weight sum constraint
    port_spec <- add.constraint(portfolio = port_spec, type = "weight_sum", min_sum = 1, max_sum = 1)

    # Add the box constraint
    number_of_assets <- length(asset_names)
    pct_10 <- rep(0.1, 5)
    pct_5 <- rep(0.05, number_of_assets - 5)
    port_spec <- add.constraint(portfolio = port_spec, type = "box", min = c(pct_10, pct_5), max = 0.4)

    # Add the group constraint
    port_spec <- add.constraint(portfolio = port_spec, type = "group", groups = list(c(1, 5, 7, 9, 10, 11), c(2, 3, 4, 6, 8, 12)), group_min = 0.4, group_max = 0.6)


    # Print the portfolio specification object
    print(port_spec)

}

add_objectives <- function() {
    # Add a return objective to maximize mean return
    port_spec <- add.objective(portfolio = port_spec, type = "return", name = "mean")

    # Add a risk objective to minimize portfolio standard deviation
    port_spec <- add.objective(portfolio = port_spec, type = "risk", name = "StdDev")

    # Add a risk budget objective
    port_spec <- add.objective(portfolio = port_spec, type = "risk_budget", name = "StdDev", min_prisk = 0.05, max_prisk = 0.1)

    # Print the portfolio specification object
    print(port_spec)

}