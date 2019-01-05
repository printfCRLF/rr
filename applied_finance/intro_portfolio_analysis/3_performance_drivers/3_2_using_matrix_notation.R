


making_risk_reward_scatter_diagram <- function() {
    # Create a vector of returns 
    means <- apply(returns, 2, "mean")

    # Create a vector of standard deviation
    sds <- apply(returns, 2, "sd")

    # Create a scatter plot
    plot(sds, means)
    text(sds, means, labels = colnames(returns), cex = 0.7)
    abline(h = 0, lty = 3)
}

the_covariance_matrix <- function() {
    # Create a matrix with variances on the diagonal
    diag_cov <- diag(sds ^ 2)

    # Create a covariance matrix of returns
    cov_matrix <- cov(returns)

    # Create a correlation matrix of returns
    cor_matrix <- cor(returns)

    # Verify covariances equal the product of standard deviations and correlation
    all.equal(cov_matrix[1, 2], cor_matrix[1, 2] * sds[1] * sds[2])
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

