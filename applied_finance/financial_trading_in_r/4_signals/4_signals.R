# Add a sigComparison which specifies that SMA50 must be greater than SMA200, call it longfilter
add.signal(strategy.st, name = "sigComparison",

# We are interested in the relationship between the SMA50 and the SMA200
           arguments = list(columns = c("SMA50", "SMA200"),

           # Particularly, we are interested when the SMA50 is greater than the SMA200
                            relationship = "gt"),

                            # Label this signal longfilter
           label = "longfilter")


# Add a sigCrossover which specifies that the SMA50 is less than the SMA200 and label it filterexit
add.signal(strategy.st, name = "sigCrossover",

# We're interested in the relationship between the SMA50 and the SMA200
           arguments = list(columns = c("SMA50", "SMA200"),

           # The relationship is that the SMA50 crosses under the SMA200
                            relationship = "lt"),

                            # Label it filterexit
           label = "filterexit")


# Implement a sigThreshold which specifies that DVO_2_126 must be less than 20, label it longthreshold
add.signal(strategy.st, name = "sigThreshold",

# Use the DVO_2_126 column
           arguments = list(column = "DVO_2_126",

           # The threshold is 20
                            threshold = 20,

                            # We want the oscillator to be under this value
                            relationship = "lt",

                            # We're interested in every instance that the oscillator is less than 20
                            cross = FALSE),

                            # Label it longthreshold
           label = "longthreshold")

# Add a sigThreshold signal to your strategy that specifies that DVO_2_126 must cross above 80 and label it thresholdexit
add.signal(strategy.st, name = "sigThreshold",

# Reference the column of DVO_2_126
           arguments = list(column = "DVO_2_126",

           # Set a threshold of 80
                            threshold = 80,

                            # The oscillator must be greater than 80
                            relationship = "gt",

                            # We are interested only in the cross
                            cross = TRUE),

                            # Label it thresholdexit
           label = "thresholdexit")

# Create your dataset: test
test_init <- applyIndicators(strategy.st, mktdata = OHLC(SPY))
test <- applySignals(strategy = strategy.st, mktdata = test_init)

# Add a sigFormula signal to your code specifying that both longfilter and longthreshold must be TRUE, label it longentry
add.signal(strategy.st, name = "sigFormula",

# Specify that longfilter and longthreshold must be TRUE
           arguments = list(formula = "longfilter & longthreshold",

           # Specify that cross must be TRUE
                            cross = TRUE),

                            # Label it longentry
           label = "longentry")
