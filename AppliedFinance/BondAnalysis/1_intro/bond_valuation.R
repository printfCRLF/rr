
bond_valuation_example <- function() {
    cf <- c(5, 5, 5, 5, 105)
    cf <- data.frame(cf)

    cf$t <- as.numeric(rownames(cf))
    cf$pv_factor <- 1 / (1 + 0.06) ^ cf$t
    cf$pv <- cf$cf * cf$pv_factor
    pv <- sum(cf$pv)
    print(cf$pv)
    print(pv)
}

# par value, coupon rate, time to maturity, yield
bondprc <- function(p, r, ttm, y) {
    cf <- c(rep(p * r, ttm - 1), p * (1 + r))
    cf <- data.frame(cf)

    cf$t <- as.numeric(rownames(cf))
    cf$pv_factor <- 1 / (1 + y) ^ cf$t
    cf$pv <- cf$cf * cf$pv_factor
    pv <- sum(cf$pv)
    return (pv)
}

#bond_valuation_example()
pv <- bondprc(100, 0.05, 5, 0.06)
print(pv)
