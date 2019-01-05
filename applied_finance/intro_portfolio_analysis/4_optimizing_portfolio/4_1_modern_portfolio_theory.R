# Load tseries
library(tseries)

exploring_monthly_returns_of_dija <- function() {
    class(returns)
    dim(returns)

    ew_preturns <- rowMeans(returns)
    ew_preturns <- xts(ew_preturns, order.by = time(returns))
    plot.zoo(ew_preturns)
}

find_the_mean_variance_efficient_portfolio <- function() {

    # Create an optimized portfolio of returns
    opt <- portfolio.optim(returns)

    pf_weights <- opt$pw
    names(pf_weights) <- colnames(returns)

    # Select optimum weights opt_weights
    opt_weights <- pf_weights[pf_weights >= 0.01]

    # Barplot of opt_weights
    barplot(opt_weights)

    opt$pm
    opt$ps
}

effect_of_return_target <- function() {
    # Create portfolio with target return of average returns 
    pf_mean <- portfolio.optim(returns, pm = mean(returns))

    # Create portfolio with target return 10% greater than average returns
    pf_10plus <- portfolio.optim(returns, pm = 1.1 * mean(returns))

    # Print the standard deviations of both portfolios
    pf_mean$ps
    pf_10plus$ps

    # Calculate the proportion increase in standard deviation
    (pf_10plus$ps - pf_mean$ps) / (pf_mean$ps)
}

imposing_weight_constraint <- function() {
    # Create vectors of maximum weights
    max_weights1 <- rep(1, ncol(returns))
    max_weights2 <- rep(0.1, ncol(returns))
    max_weights3 <- rep(0.05, ncol(returns))

    # Create an optimum portfolio with max weights of 100%
    opt1 <- portfolio.optim(returns, reshigh = max_weights1)

    # Create an optimum portfolio with max weights of 10%
    opt2 <- portfolio.optim(returns, reshigh = max_weights2)

    # Create an optimum portfolio with max weights of 5%
    opt3 <- portfolio.optim(returns, reshigh = max_weights3)

    # Calculate how many assets have a weight that is greater than 1% for each portfolio
    sum(opt1$pw > .01)
    sum(opt2$pw > .01)
    sum(opt3$pw > .01)

    # Print portfolio volatilites 
    opt1$ps
    opt2$ps
    opt3$ps
}

exploring_monthly_returns_of_dija()
find_the_mean_variance_efficient_portfolio()
effect_of_return_target()
imposing_weight_constraint()
