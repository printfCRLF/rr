getSymbols("SPY", 
            from = "2000-01-01"
            to = "2016-06-30"
            src = "yahoo"
            adjust = TRUE )

plot(Cl(SPY))
