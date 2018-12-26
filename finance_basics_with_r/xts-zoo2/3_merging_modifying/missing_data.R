
temps_csv = read.csv("Temps.csv")
temps_csv = head(temps_csv)
temps = as.xts(temps_csv)

fill_example <- function() {
    print("temps")
    temps["2016-07-02", "Temp.Mean"] <- NA
    temps["2016-07-03", "Temp.Mean"] <- NA
    print(temps)

    print("Last observation carried forward")
    temps_last <- na.locf(temps)
    print(temps_last)

    print("Last observation carried backward")
    temps_next <- na.locf(temps, fromLast = TRUE)
    print(temps_next)
}

interpolation_example <- function() {
    airpass_csv <- read.csv("AirPass.csv")
    airpass_xts <- as.xts(airpass_csv)

    print(airpass_csv)

    print("Interpolate NAs using linear approximation")
    result <- na.approx(airpass_xts)
    print(result)

}

#fill_example()
interpolation_example()

#1960-01-01, 417 417
#1960-02-01, 391 391
#1960-03-01, NA 419
#1960-04-01, NA 461
#1960-05-01, NA 472
#1960-06-01, 535 535
#1960-07-01, 622 622
#1960-08-01, 606 606
#1960-09-01, 508 508
#1960-10-01, 461 461
#1960-11-01, 390 390
#1960-12-01, 432 432



