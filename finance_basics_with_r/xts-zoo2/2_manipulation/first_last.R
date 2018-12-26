
first_and_last <- function() {
    temps <- read.csv("Temps.csv")
    temps_xts <- as.xts(temps)

    lastweek <- last(temps_xts, "1 week")
    print(last(lastweek, 2), last(lastweek, 2))

    first(lastweek, "-2 days")

    # Extract the first three days of the second week of temps
    result <- first(last(first(temps_xts, "2 weeks"), "1 week"), "3 days")
    print(result)

}

first_and_last()


