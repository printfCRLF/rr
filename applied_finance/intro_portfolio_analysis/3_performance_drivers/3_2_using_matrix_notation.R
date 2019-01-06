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

making_risk_reward_scatter_diagram <- function(returns) {
    # Create a vector of returns 
    means <- apply(returns, 2, "mean")

    # Create a vector of standard deviation
    sds <- apply(returns, 2, "sd")

    # Create a scatter plot
    plot(sds, means)
    text(sds, means, labels = colnames(returns), cex = 0.7)
    abline(h = 0, lty = 3)
}

the_covariance_matrix <- function(returns) {
    sds <- apply(returns, 2, "sd")
    # Create a matrix with variances on the diagonal
    diag_cov <- diag(sds ^ 2)

    # Create a covariance matrix of returns
    cov_matrix <- cov(returns)

    # Create a correlation matrix of returns
    cor_matrix <- cor(returns)

    # Verify covariances equal the product of standard deviations and correlation
    result <- all.equal(cov_matrix[1, 2], cor_matrix[1, 2] * sds[1] * sds[2])
    print(paste("varify covariances equal the product of standard deviations and correlation", result))
}

matrix_based_calculation_of_portfolio_mean_and_variance <- function() {
    # Create a weight matrix w
    w <- as.matrix(weights)

    # Create a matrix of returns
    mu <- as.matrix(vmeans)

    # Calculate portfolio mean monthly returns
    t(w) %*% mu

    # Calculate portfolio volatility
    sqrt(t(w) %*% sigma %*% w)
}

#making_risk_reward_scatter_diagram(returns)
the_covariance_matrix(returns)



