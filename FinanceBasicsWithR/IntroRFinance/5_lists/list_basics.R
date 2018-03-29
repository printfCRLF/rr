portfolio <- vector("list", length = 4)

create_a_list <- function() {
    name <- "Apple and IBM"
    apple <- c(109.49, 109.90, 109.11, 109.95, 111.03)
    ibm <- c(159.82, 160.02, 159.84, 160.35, 164.79)
    cor_matrix <- cor(cbind(apple, ibm))

    portfolio <- list(name, apple, ibm, cor_matrix)
    #print(portfolio)

    return(portfolio)
}

named_list <- function(portfolio) {
    names(portfolio) <- c("portfolio_name", "apple", "ibm", "correlation")
    #print(portfolio)
    return(portfolio)
}

subsetting_list <- function() {
    #print(portfolio[c(2, 3)])
    #print(portfolio$correlation)
}

adding_to_list <- function(portfolio) {
    portfolio$weight <- c(apple = .2, ibm = .8)
    #print(portfolio)

    portfolio$weight <- c(apple = .3, ibm = .7)
    #print(portfolio)
    return (portfolio)
}

removing_from_list <- function(portfolio) {
    portfolio$msft <- c(40, 41, 42)
    portfolio$msft <- NULL
    print(portfolio)

}

portfolio = create_a_list()
portfolio = named_list(portfolio)
subsetting_list()
portfolio = adding_to_list(portfolio)
portfolio = removing_from_list(portfolio)
