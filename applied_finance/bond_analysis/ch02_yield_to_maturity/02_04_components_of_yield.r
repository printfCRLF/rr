# Load quantmod package
library(quantmod)
library(Quandl)

# Obtain Treasury yield data
t10yr <- getSymbols(Symbols = "DGS10", src = "FRED", auto.assign = FALSE)

# Subset data
t10yr <-t10yr["200601/201609"]

# Plot yields
plot(x = index(t10yr),
     y = t10yr$DGS10,
     xlab = "Date",
     ylab = "Yield (%)",
     type = "l",
     col = "red",
     main = "10-Year US Treasury Yields")


# Obtain Moody's Baa index data
aaa_list <- Quandl("FED/RIMLPAAAR_N_M")
baa_list <- Quandl("FED/RIMLPBAAR_N_M")

spread <- data.frame(
    date = aaa_list$Date,
    aaa = aaa_list$Value,
    baa = baa_list$Value)

head(spread)
tail(spread)

# Calculate spread$diff
spread$diff <- (spread$baa - spread$aaa) * 100

# Plot spread
plot(x = spread$date,
     y = spread$diff,
     type = "l",
     xlab = "Date",
     ylab = "Spread (bps)",
     col = "red",
     main = "Baa - Aaa Spread")