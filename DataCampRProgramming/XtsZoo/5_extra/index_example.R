
temps_csv <- read.csv("Temps.csv")
temps <- as.xts(temps_csv)

get_index <- function() {
    index(temps)[1:3]
    indexClass(temps)
    indexTZ(temps)
    indexFormat(temps) <- "%b-%d-%Y"
    head <- head(temps)
    print(head)
}

time_zone <- function() {
    times_xts <- xts(1:10, order.by = times, tzone = "America/Chicago")
    tzone(times_xts) <- "Asia/Hong_Kong"
    tzone(times_xts)
    head <- head(times_xts)
    print(head)
}

#get_index()
#time_zone()

