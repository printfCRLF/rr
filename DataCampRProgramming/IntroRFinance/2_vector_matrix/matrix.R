# a matrix is a 2D-vector
# it fills by column by default, use byRow = TRUE to fill by row
# it can only has one data type 


apple <- c(109.49, 109.90, 109.11, 109.95, 111.03, 112.12, 113.95, 113.30, 115.19, 115.19, 115.82, 115.97, 116.64, 116.95, 117.06, 116.29, 116.52, 117.26, 116.76, 116.73, 115.82)

ibm <- c(159.82, 160.02, 159.84, 160.35, 164.79, 165.36, 166.52, 165.50, 168.29, 168.51, 168.02, 166.73, 166.68, 167.60, 167.33, 167.06, 166.71, 167.14, 166.19, 166.60, 165.99)

micr <- c(59.20, 59.25, 60.22, 59.95, 61.37, 61.01, 61.97, 62.17, 62.98, 62.68, 62.58, 62.30, 63.62, 63.54, 63.54, 63.55, 63.24, 63.28, 62.99, 62.90, 62.14)

create_a_matrix <- function() {
    my_vector <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)

    my_matrix <- matrix(data = my_vector, nrow = 3, ncol = 3)
    print(my_matrix)

    my_matrix2 <- matrix(data = my_vector, nrow = 3, ncol = 3, byrow = TRUE)
    print(my_matrix2)
}

bind <- function() {
    cbind_stocks <- cbind(apple, ibm, micr)
    print(cbind_stocks)

    rbind_stocks <- rbind(apple, ibm, micr)
    print(rbind_stocks)
    
}

visualize_your_matrix <- function() {
    apple_micr_matrix <- cbind(apple, micr)
    plot(apple_micr_matrix)
}

correlation <- function() {
    cor(apple, ibm)
    stocks <- cbind(apple, micr, ibm)
    result <- cor(stocks)
    print(result)
}

matrix_subsetting <- function() {
    stocks = cbind(apple, ibm, micr)
    stocks[3,]

    stocks[c(4, 5), "ibm"]

    stocks[, c("apple", "micr")]
}

#create_a_matrix()
#bind()
#visualize_your_matrix()
#correlation()
matrix_subsetting()
