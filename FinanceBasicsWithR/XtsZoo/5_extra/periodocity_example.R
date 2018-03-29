
temps_csv <- read.csv("Temps.csv")
temps <- as.xts(temps_csv)

determine_periodicity <- function() {
    periodicity(temps)
    p <- periodicity(edhec)
    print(p)

    edhec_yearly <- to.yearly(edhec)
    p <- periodicity(edhec_yearly)
    print(p)
}

find_number_of_periods <- function() {
    n_months <- nmonths(edhec)
    print(n_months)

    n_quarters <- nquarters(edhec)
    print(n_quarters)

    n_years <- nyears(edhec)
    print(n_years)
}

index_tool <- function() {
    .index(temps)
    .indexwday(temps)

    index <- which(.indexwday(temps) == 6 | .indexwday(temps) == 0)
    weekends <- temps[index]
    print(weekdays)
}

modity_timestamps <- function() {
    z_unique <- make.index.unique(z, eps = 1e-4)
    z_dup <- make.index.unique(z, drop = TRUE)
    z_round <- align.time(z, n = 3600)
}

#determine_periodicity()
#find_number_of_periods()
index_tool()
modity_timestamps()
