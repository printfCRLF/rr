titanic <- read.csv("titanic.csv")

exploratory <- function() {
    dim(titanic)
    hist(titanic$Age)

    # Print out total value of fares
    fare <- sum(titanic$Fare)
    print(fare)

    # Print out proportion of passengers that survived
    numOfSurvived <- mean(titanic$Survived)
    print(numOfSurvived)
}

exploratory()

