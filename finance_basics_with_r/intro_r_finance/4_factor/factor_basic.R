credit_rating <- c("BB", "AAA", "AA", "CCC", "AA", "AAA", "B", "BB")
credit_factor <- factor(credit_rating)

create_factor <- function() {
    print(credit_factor)

    print("structure of credit rating")
    print(str(credit_rating))

    print("structure of credit factor")
    print(str(credit_factor))
}

factor_levels <- function() {
    levels(credit_factor)

    levels(credit_factor) <- c("2A", "3A", "1B", "2B", "3C")

    print(credit_factor)

}

factor_summary <- function() {
    #result <- summary(credit_rating)
    #print(result)

    #result <- summary(credit_factor)
    #print(result)

    plot(credit_factor)
}

bucketing_numeric_vector_into_a_factor <- function() {
    AAA_rank <- c(31, 48, 100, 53, 85, 73, 62, 74, 42, 38, 97, 61, 48, 86, 44, 9, 43, 18, 62, 38, 23, 37, 54, 80, 78, 93, 47, 100, 22, 22, 18, 26, 81, 17, 98, 4, 83, 5, 6, 52, 29, 44, 50, 2, 25, 19, 15, 42, 30, 27)

    AAA_factor <- cut(AAA_rank, breaks = c(0, 25, 50, 75, 100))
    levels(AAA_factor) <- c("low", "medium", "high", "very_high")
    print(AAA_factor)
    plot(AAA_factor)
}

create_an_ordered_factor <- function() {
    unique(credit_rating)
    credit_factor_ordered <- factor(credit_rating, ordered = TRUE, levels = c("AAA", "AA", "BB", "B", "CCC"))
    plot(credit_factor_ordered)
}

subsetting_factor <- function() {
    keep_level <- credit_factor[-c(3, 7)]
    plot(keep_level)
    drop_level <- credit_factor[-c(3, 7), drop = TRUE]
    plot(drop_level)

}

stringsAsFactors_example <- function() {
    credit_rating <- c("AAA", "A", "BB")
    bond_owners <- c("Dan", "Tom", "Joe")

    bonds <- data.frame(credit_rating, bond_owners, stringsAsFactors = FALSE)
    print(str(bonds))

    bonds$credit_factor <- factor(bonds$credit_rating, ordered = TRUE, levels = c("AAA", "A", "BB"))
    print(str(bonds))

}

#create_factor()
#factor_levels()
#factor_summary()
#bucketing_numeric_vector_into_a_factor()
#create_an_ordered_factor()
#subsetting_factor()
stringsAsFactors_example()