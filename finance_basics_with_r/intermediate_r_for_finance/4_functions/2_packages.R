# Library tidquant
library(tidyquant)

# Pull Apple stock data
apple <- tq_get("AAPL", get = "stock.prices",
                from = "2007-01-03", to = "2017-06-05")

# Take a look at what it returned
head(apple)

# Plot the stock price over time
plot(apple$date, apple$adjusted, type = "l")

# Calculate daily stock returns for the adjusted price
apple <- tq_mutate(data = apple,
                   ohlc_fun = Ad,
                   mutate_fun = dailyReturn)

# Sort the returns from least to greatest
sorted_returns <- sort(apple$daily.returns)

# Plot them
plot(sorted_returns)
