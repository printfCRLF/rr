bondprc <- function(p, r, ttm, y) {
    cf <- c(rep(p * r, ttm - 1), p * (1 + r))
    cf <- data.frame(cf)

    cf$t <- as.numeric(rownames(cf))
    cf$pv_factor <- 1 / (1 + y) ^ cf$t
    cf$pv <- cf$cf * cf$pv_factor
    pv <- sum(cf$pv)
    return (pv)
}

# Value bond using 5% yield
bondprc(p = 100, r = 0.05, ttm = 5, y = 0.05)

# Value bond using 7% yield
bondprc(p = 100, r = 0.05, ttm = 5, y = 0.07)

# Value bond using 6% yield
bondprc(p = 100, r = 0.05, ttm = 5, y = 0.06)

# Create cash flow vector
cf <- c(-95.79, 5, 5, 5, 5, 105)

# Create bond valuation function
bval <- function(i, cf,
     t=seq(along = cf))
     sum(cf / (1 + i)^t)

# Create ytm() function using uniroot
ytm <- function(cf) {
    uniroot(bval, c(0, 1), cf = cf)$root
}

# Use ytm() function to find yield
ytm(cf)

