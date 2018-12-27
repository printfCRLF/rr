
first_and_last <- function() {
    temps <- read.csv("Temps.csv")
    temps_xts <- as.xts(temps)

    # Create lastweek using the last 1 week of temps
    lastweek <- last(temps_xts, "1 week")

    # Print the last 2 observations in lastweek
    print(last(lastweek, 2), last(lastweek, 2))

    # Extract all but the first two days of lastweek
    first(lastweek, "-2 days")

    # Extract the first three days of the second week of temps
    result <- first(last(first(temps_xts, "2 weeks"), "1 week"), "3 days")
    print(result)

}

first_and_last()


