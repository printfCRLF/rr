library(zoo)
library(xts)
library(PerformanceAnalytics)
library(quantmod)

prices_to_returns <- function(prices) {
    returns <- Return.calculate(prices)
    returns <- returns[-1,]
    returns
}

eq_prices <- as.xts(readRDS("./data/eq_prices.RData"))
returns_equities <- prices_to_returns(eq_prices)
bond_prices <- as.xts(readRDS("./data/bond_prices.RData"))
returns_bonds <- prices_to_returns(bond_prices)
real_estate_prices <- as.xts(readRDS("./data/real_estate_prices.RData"))
returns_real_estates <- prices_to_returns(real_estate_prices)
comm_prices <- as.xts(readRDS("./data/comm_prices.RData"))
returns_comm <- prices_to_returns(comm_prices)

returns <- merge(returns_equities, returns_bonds, returns_real_estates, returns_comm)
colnames(returns) <- c("equities", "bonds", "realestate", "commodities")

who_did_it <- function(returns) {
    # Create portfolio weights
    weights <- c(0.4, 0.4, 0.1, 0.1)

    # Create volatility budget
    vol_budget <- StdDev(returns, portfolio_method = "component", weights = weights)

    # Make a table of weights and risk contribution
    weights_percrisk <- cbind(weights, vol_budget$pct_contrib_StdDev)
    colnames(weights_percrisk) <- c("weights", "perc vol contrib")

    # Print the table
    print(weights_percrisk)
}

who_did_it(returns)


