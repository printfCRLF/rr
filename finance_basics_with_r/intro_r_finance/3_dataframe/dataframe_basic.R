company <- c("A", "A", "A", "B", "B", "B", "B")
cash_flow <- c(1000, 4000, 550, 1500, 1100, 750, 6000)
year <- c(1, 3, 4, 1, 2, 4, 5)

create_dataframe <- function() {
    cash <- data.frame(company, cash_flow, year)
    print(cash)
}

head_tail <- function() {
    cash <- data.frame(company, cash_flow, year)
    head <- head(cash, 4)
    print(head)

    tail <- tail(cash, 3)
    print(tail)

    str(cash)
}

subsetting <- function() {
    cash <- data.frame(company, cash_flow, year)
    print(cash$year)

    cash$cash_flow * 2
    cash$company <- NULL
    print(cash)

    # find rows of company B
    print(subset(cash, company == "B"))

    # find rows with cash flow due in a year
    print(subset(cash, year == 1))

}

add_new_columns <- function() {
    cash <- data.frame(company, cash_flow, year)
    cash$quarter_cash <- cash$cash_flow / 4
    cash$double_year <- cash$year * 2

}

present_value_cash_flow <- function() {
    cash <- data.frame(company, cash_flow, year)
    present_value_4k <- 4000 * 1.05 ^ -3

    cash$present_value <- cash$cash_flow * 1.05 ^ -cash$year
    print(cash)

    cash_B <- subset(cash, company == "B")
    total_pv_B <- sum(cash_B$present_value)
    print(total_pv_B)

}

create_dataframe()
head_tail()

#subsetting()
#add_new_columns()

#present_value_cash_flow()
