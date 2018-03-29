company <- c("A", "A", "A", "B", "B", "B", "B")
cash_flow <- c(1000, 4000, 550, 1500, 1100, 750, 6000)
year <- c(1, 3, 4, 1, 2, 4, 5)

cash <- data.frame(company, cash_flow, year)

split_example <- function() {
    grouping <- cash$year
    split_cash <- split(cash, grouping)

    # Look at your split_cash list
    print(split_cash)

    # Unsplit split_cash to get the original data back.
    original_cash <- unsplit(split_cash, grouping)

    # Print original_cash
    print(original_cash)

}

split_apply_combine <- function() {
    grouping <- cash$company
    split_cash <- split(cash, grouping)
    split_cash$B$cash_flow
    split_cash$A$cash_flow <- 0
    cash_no_A <- unsplit(split_cash, grouping)
    print(cash_no_A)
}

attributes_example <- function() {
    my_matrix <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)
    rownames(my_matrix) <- c("Row1", "Row2")
    colnames(my_matrix) <- c("Col1", "Col2", "Col3")

    my_factor <- factor(c("A", "A", "B"), ordered = T, levels = c("A", "B"))

    result <- attributes(my_matrix)
    print(result)

    result <- attr(my_matrix, which = "dim")
    print(result)

    attributes(my_factor)
}

#split_example();
#split_apply_combine()
attributes_example()

