bondprc <- function(p, r, ttm, y) {
    cf <- c(rep(p * r, ttm - 1), p * (1 + r))
    cf <- data.frame(cf)

    cf$t <- as.numeric(rownames(cf))
    cf$pv_factor <- 1 / (1 + y) ^ cf$t
    cf$pv <- cf$cf * cf$pv_factor
    pv <- sum(cf$pv)
    return (pv)
}

# Calculate bond price given 10% yield
px <- bondprc(p = 100, r = 0.10, ttm = 20, y = 0.10)
px

# Calculate bond price if yields increase by 1%
px_up <- bondprc(p = 100, r = 0.10, ttm = 20, y = 0.11)
px_up

# Calculate bond price if yields decrease by 1%
px_down <- bondprc(p = 100, r = 0.10, ttm = 20, y = 0.09)
px_down

# Calculate approximate duration
duration <- (px_down - px_up)/(2 * px* 0.01)
duration

# Estimate percentage change
duration_pct_change <- duration / px
duration_pct_change

# Estimate dollar change
duration_dollar_change <- duration_pct_change * px
duration_dollar_change

# Calculate approximate convexity
convexity <- (px_up + px_down - 2 * px) / (px * (0.01)^2)
convexity

# Estimate percentage change
convexity_pct_change <- 0.5 * convexity * (0.01)^2
convexity_pct_change

# Estimate dollar change
convexity_dollar_change <- px * convexity_pct_change
convexity_dollar_change

# Estimate change in price
price_change <- duration_dollar_change + convexity_dollar_change

# Estimate price
price <- px + duration_dollar_change + convexity_dollar_change
