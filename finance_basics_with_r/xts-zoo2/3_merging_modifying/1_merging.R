a_data = c(-1.2070657, 0.2774292, 1.0844412, -2.3456977)
a_index = c(as.Date("2016-06-05"), as.Date("2016-06-08"), as.Date("2016-06-09"), as.Date("2016-06-13"))
a <- xts(x = a_data, order.by = a_index)

b_data <- c(0.4291247, 0.5060559, -0.5747400, - 0.5466319)
b_index <- c(as.Date("2016-06-05"), as.Date("2016-06-06"), as.Date("2016-06-08"), as.Date("2016-06-09"))
b <- xts(x = b_data, order.by = b_index)

combine_column_using_merge <- function(a, b) {
    print("inner join a and b")
    result <- merge.xts(a, b, join = "inner")
    print(result)

    print("left join a and b")
    result <- merge.xts(a, b, join = "left", fill = 0)
    print(result)

}

combine_xts_by_row_with_rbind <- function() {
    temps_csv <- read.csv("Temps.csv")
    temps <- as.xts(temps)

    data <- c(as.integer(75), as.integer(73), as.integer(63))
    m <- matrix(data = data, nrow = 1, ncol = 3)
    colnames(m) <- c("Temp.Max", "Temp.Mean", "Temp.Min")
    #print(m)
    temps_june30 <- xts(x = m, order.by = as.Date("2016-06-30"))
    #print(temps_june30)

    data <- c(as.integer(79), as.integer(70), as.integer(68))
    m <- matrix(data = data, nrow = 1, ncol = 3)
    colnames(m) <- c("Temp.Max", "Temp.Mean", "Temp.Min")
    temps_july17 <- xts(x = m, order.by = as.Date("2016-07-17"))
    
    data <- c(as.integer(75), as.integer(70), as.integer(65))
    m <- matrix(data = data, nrow = 1, ncol = 3)
    colnames(m) <- c("Temp.Max", "Temp.Mean", "Temp.Min")
    temps_july18 <- xts(x = m, order.by = as.Date("2016-07-18"))

    temps2 <- rbind(temps, temps_june30)
    print(temps2)

    temps3 <- rbind(temps2, temps_july17, temps_july18)
    print(temps3)
    
}

#combine_column_using_merge(a, b)
combine_xts_by_row_with_rbind()

