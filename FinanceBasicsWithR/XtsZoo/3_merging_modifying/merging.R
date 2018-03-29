a_data = c(-1.2070657, 0.2774292, 1.0844412, -2.3456977)
a_index = c(as.Date("2016-06-05"), as.Date("2016-06-08"), as.Date("2016-06-09"), as.Date("2016-06-13"))
a <- xts(x = a_data, order.by = a_index)

b_data <- c(0.4291247, 0.5060559, -0.5747400, - 0.5466319)
b_index <- c(as.Date("2016-06-05"), as.Date("2016-06-06"), as.Date("2016-06-08"), as.Date("2016-06-09"))
b <- xts(x = b_data, order.by = b_index)

combine_column_using_merge <- function() {
    merge.xts(a, b, join = "inner")

}

combine_xts_by_row_with_rbind <- function() {
    temps <- read.csv("Temps.csv")
    temps_xts <- as.xts(temps)

    data <- c(as.integer(75), as.integer(73), as.integer(63))
    m <- matrix(data = data, nrow = 1, ncol = 3)
    colnames(m) <- c("Temp.Max", "Temp.Mean", "Temp.Min")
    #print(m)
    temps_june30 <- xts(x = m, order.by = as.Date("2016-06-30"))
    #print(temps_june30)
    temps2 <- rbind(temps, temps_june30)
    print(temps2)
}

#combine_column_using_merge()
combine_xts_by_row_with_rbind()

