

implement_indicator <- function() {
    # Add a 200-day SMA indicator to strategy.st
    add.indicator(strategy = strategy.st, name = "SMA", arguments = list(x = quote(Cl(mktdata)), n = 200),
                  label = "SMA200")

    # Add a 50-day SMA indicator to strategy.st
    add.indicator(strategy = strategy.st, name = "SMA", arguments = list(x = quote(Cl(mktdata)), n = 50),
                  label = "SMA50")

    # Add an RSI 3 indicator to strategy.st
    add.indicator(strategy = strategy.st, name = "RSI", arguments = list(x = quote(Cl(mktdata)), n = 3),
                  label = "RSI_3")

}