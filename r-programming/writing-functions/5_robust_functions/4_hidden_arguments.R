
a_hidden_dependence <- function() {
    # This is the default behavior
    options(stringsAsFactors = TRUE)

    # Read in the swimming_pools.csv to pools
    pools <- read.csv("swimming_pools.csv")

    # Examine the structure of pools
    print(str(pools))

    # Change the global stringsAsFactors option to FALSE
    options(stringsAsFactors = FALSE)

    # Read in the swimming_pools.csv to pools2
    pools2 <- read.csv("swimming_pools.csv")

    # Examine the structure of pools2
    print(str(pools2))

}

ligitimate_use_of_options <- function() {
    # Start with this
    options(digits = 8)

    # Fit a regression model
    fit <- lm(mpg ~ wt, data = mtcars)

    # Look at the summary of the model
    summary(fit)

    # Set the global digits option to 2

    options(digits = 2)

    # Take another look at the summary
    summary(fit)
}

a_hidden_dependence()
#ligitimate_use_of_options()

