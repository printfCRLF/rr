
temps_csv <- read.csv("Temps.csv")
temps <- as.xts(temps_csv)

find_intervals_by_time <- function() {
    print("interval by week")
    weeks <- endpoints(temps, on = "weeks")
    print(weeks)

    print("interval by every second week")
    two_weeks <- endpoints(temps, on = "weeks", k = 2)
    print(two_weeks)
}

apply_a_function_by_timeperiod <- function() {
    ep <- endpoints(temps, on = "weeks")
    result <- period.apply(temps[, "Temp.Mean"], INDEX = ep, FUN = mean)
    print(result)

}   

using_lapply <- function() {
    temps_weekly <- split(temps, f = "weeks")

    # Create a list of weekly means, temps_avg, and print this list
    temps_avg <- lapply(X = temps_weekly, FUN = mean)
    print(temps_avg)
}

selection_by_endpoint <- function() {
    # Use the proper combination of split, lapply and rbind
    temps_1 <- do.call(rbind, lapply(split(temps, "weeks"), function(w) last(w, n = "1 day")))

    # Create last_day_of_weeks using endpoints()
    last_day_of_weeks <- endpoints(temps, on = "weeks")

    # Subset temps using last_day_of_weeks 
    temps_2 <- temps[last_day_of_weeks]

}

#find_intervals_by_time()
#apply_a_function_by_timeperiod()
#using_lapply()
selection_by_endpoint(9)


