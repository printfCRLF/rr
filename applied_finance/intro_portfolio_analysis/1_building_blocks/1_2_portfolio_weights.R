
calculate_weights_when_values_are_given <- function() {
    # Define the vector values
    values <- c(4000, 4000, 2000)

    # Define the vector weights
    weights <- values / sum(values)

    # Print the resulting weights
    weights
}

market_capitalization_weighted_portfolio <- function() {
    # Define marketcaps
    marketcaps <- c(5, 8, 9, 20, 25, 100, 100, 500, 700, 2000)

    # Compute the weights
    weights <- marketcaps / sum(marketcaps)

    # Inspect summary statistics
    summary(weights)

    # Create a barplot of weights
    barplot(weights)
}

#calculate_weights_when_values_are_given()
market_capitalization_weighted_portfolio()




