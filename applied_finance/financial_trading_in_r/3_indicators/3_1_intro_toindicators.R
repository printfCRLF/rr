# Create a 200-day SMA
spy_sma <- SMA(Cl(SPY), n = 200)

# Create an RSI with a 3-day lookback period
spy_rsi <- RSI(Cl(SPY), n = 3)


# Plot the closing prices of SPY
plot(Cl(SPY))

# Overlay a 200-day SMA
lines(SMA(Cl(SPY), n = 200), col = "red")

# What kind of indicator?
"trend"

# Plot the closing price of SPY
plot(Cl(SPY))

# Plot the RSI 2
plot(RSI(Cl(SPY), n = 2))

# What kind of indicator?
"reversion"