prepare_data <- function() {
    # my score for this year
    me <- 89

    # others score for this year
    other_199 <- c(
    66, 81, 77, 90, 95, 54, 78, 90, 80, 71, 96, 70, 81, 71, 60, 91, 62, 54,
    70, 96, 90, 82, 78, 100, 79, 84, 79, 73, 66, 63, 97, 91, 82, 81, 52, 73,
    89, 70, 69, 60, 63, 78, 77, 73, 64, 62, 61, 72, 64, 87, 54, 80, 82, 61,
    70, 69, 61, 88, 90, 74, 80, 59, 75, 65, 83, 70, 83, 83, 81, 80, 88, 77,
    84, 50, 73, 70, 74, 75, 71, 60, 62, 80, 78, 81, 60, 80, 99, 90, 90, 66,
    61, 79, 71, 80, 69, 67, 80, 59, 72, 76, 74, 70, 74, 96, 73, 90, 92, 75,
    77, 63, 94, 67, 56, 95, 85, 63, 80, 96, 72, 77, 79, 69, 68, 70, 73, 99,
    64, 59, 63, 82, 76, 90, 80, 86, 77, 80, 84, 80, 99, 80, 68, 77, 51, 67,
    86, 60, 61, 57, 62, 86, 86, 75, 75, 62, 60, 75, 71, 70, 70, 70, 75, 72,
    79, 74, 72, 78, 87, 70, 77, 64, 77, 67, 88, 87, 80, 76, 73, 78, 89, 72,
    86, 68, 84, 64, 73, 73, 64, 70, 92, 91, 65, 69, 99, 76, 94, 72, 77, 80,
    64)

    # all the students' scores for the previous four years. 
    year1 <- c(82, 66, 66, 86, 76, 74, 56, 80, 71, 69, 69, 72, 68, 63, 83, 55, 87, 79, 75, 100, 61, 70, 66, 90, 85, 56, 73, 72, 81, 86, 60, 88, 77, 80, 57, 69, 73, 61, 50, 67, 98, 80, 82, 69, 89, 74, 89, 73, 67, 67, 90, 68, 64, 85, 70, 78, 96, 69, 74, 71, 55, 62, 56, 83, 65, 76, 83, 77, 78, 52, 75, 55, 50, 58, 68, 94, 90, 67, 70, 58, 80, 93, 65, 73, 64, 56, 73, 57, 65, 56, 83, 72, 61, 58, 56, 92, 99, 68, 61, 60, 97, 96, 51, 95, 90, 89, 72, 67, 50, 80, 74, 72, 70, 88, 56, 79, 98, 51, 66, 79, 53, 53, 72, 66, 87, 61, 54, 70, 54, 77, 60, 88, 71, 90, 51, 74, 74, 86, 90, 80, 68, 75, 63, 78, 65, 73, 70, 69, 72, 65, 88, 65, 67, 76, 68, 88, 69, 83, 76, 75, 51, 66, 61, 58, 73, 80, 96, 61, 52, 74, 72, 76, 78, 54, 80, 79, 66, 94, 63, 74, 67, 84, 93, 70, 94, 79, 60, 60, 70, 60, 63, 68, 72, 90, 96, 61, 66, 70, 61, 63)

    year2 <- c(89, 89, 65, 79, 83, 73, 79, 87, 59, 77, 84, 75, 70, 63, 74, 70, 61, 85, 75, 72, 53, 80, 80, 85, 75, 77, 89, 73, 72, 68, 74, 85, 81, 76, 90, 66, 87, 61, 73, 60, 68, 70, 84, 90, 68, 74, 88, 93, 66, 79, 83, 77, 78, 66, 56, 66, 77, 99, 91, 67, 63, 87, 78, 70, 68, 84, 70, 65, 85, 70, 99, 60, 100, 77, 92, 82, 79, 89, 50, 64, 87, 63, 99, 73, 85, 82, 62, 64, 84, 77, 71, 87, 58, 70, 87, 60, 90, 68, 55, 85, 96, 79, 80, 71, 59, 80, 70, 79, 75, 84, 77, 70, 59, 74, 73, 90, 69, 80, 94, 57, 99, 73, 80, 74, 54, 77, 84, 79, 53, 89, 73, 83, 85, 79, 99, 54, 90, 78, 70, 79, 70, 98, 60, 70, 70, 92, 86, 59, 73, 98, 72, 76, 62, 82, 77, 78, 84, 82, 78, 76, 51, 55, 82, 94, 62, 81, 81, 73, 99, 80, 77, 80, 79, 84, 76, 84, 88, 75, 52, 82, 73, 76, 99, 73, 70, 75, 67, 70, 83, 88, 83, 78, 57, 87, 63, 60, 76, 76, 77, 78)

    year3 <- c(53, 66, 85, 65, 75, 69, 98, 66, 100, 76, 70, 89, 60, 52, 80, 84, 95, 68, 92, 78, 55, 69, 64, 95, 71, 55, 80, 70, 63, 80, 73, 93, 62, 80, 90, 61, 64, 75, 92, 100, 76, 85, 97, 67, 72, 60, 89, 91, 60, 73, 87, 92, 71, 72, 82, 90, 63, 70, 56, 75, 79, 62, 98, 63, 88, 66, 58, 73, 67, 80, 69, 52, 77, 60, 70, 76, 84, 98, 62, 70, 79, 90, 88, 60, 67, 75, 80, 77, 69, 72, 68, 54, 90, 79, 65, 71, 83, 68, 60, 77, 79, 62, 69, 52, 64, 77, 89, 80, 71, 60, 77, 89, 77, 82, 90, 73, 72, 50, 50, 80, 61, 76, 89, 91, 65, 86, 92, 62, 87, 97, 52, 76, 65, 80, 71, 69, 74, 98, 79, 75, 50, 80, 66, 55, 85, 75, 78, 97, 58, 86, 74, 70, 67, 68, 58, 80, 73, 74, 67, 54, 62, 76, 66, 83, 72, 82, 66, 66, 75, 84, 81, 70, 99, 84, 98, 64, 68, 76, 74, 90, 99, 69, 100, 51, 81, 99, 70, 62, 52, 70, 70, 73, 80, 64, 73, 98, 74, 61, 70, 80)

    year4 <- c(70, 76, 73, 64, 56, 71, 96, 78, 77, 99, 89, 56, 92, 73, 85, 71, 67, 75, 65, 90, 87, 91, 77, 81, 99, 98, 59, 73, 56, 70, 97, 50, 71, 75, 95, 89, 88, 93, 88, 74, 61, 96, 97, 82, 64, 85, 71, 87, 51, 68, 65, 79, 96, 99, 94, 80, 71, 94, 64, 59, 86, 70, 55, 87, 75, 83, 72, 69, 63, 80, 85, 67, 60, 70, 82, 82, 90, 51, 92, 86, 85, 62, 90, 90, 68, 98, 93, 80, 75, 70, 66, 87, 100, 90, 85, 76, 100, 52, 75, 56, 74, 91, 84, 81, 89, 89, 80, 70, 88, 77, 59, 50, 56, 83, 88, 77, 95, 90, 83, 75, 78, 76, 55, 73, 82, 92, 90, 71, 86, 66, 73, 86, 64, 71, 80, 95, 69, 82, 84, 84, 53, 97, 78, 76, 80, 61, 70, 78, 70, 79, 76, 86, 69, 95, 55, 74, 96, 86, 57, 79, 70, 80, 73, 84, 67, 89, 88, 85, 64, 70, 77, 72, 55, 77, 72, 73, 86, 94, 50, 71, 80, 74, 94, 90, 84, 88, 100, 66, 68, 62, 71, 60, 67, 88, 78, 87, 78, 86, 76, 94)

    previous_4 <- cbind(year1, year2, year3, year4)

    results <- list("me" = me, "other_199" = other_199, "previous_4" = previous_4)
    return(results)
}

analysis <- function() {
    # Merge me and other_199: my_class
    my_class <- c(me, other_199)

    # cbind() my_class and previous_4: last_5
    last_5 <- cbind(my_class, previous_4)

    # Name last_5 appropriately
    nms <- paste0("year_", 1:5)
    colnames(last_5) <- nms
    print(str(last_5))

    results <- list("my_class" = my_class, "last_5" = last_5)

    return(results)
}

plot <- function() {
    # Build histogram of my_class
    hist(my_class)

    # Generate summary of last_5
    summary(last_5)

    # Build boxplot of last_5
    boxplot(last_5)
}

basic_query <- function() {
    # Is your grade equal to 72?
    me == 72
    # Which grades in your class are higher than 75?
    my_class > 75
    # Which grades in the last 5 years are below or equal to 64?
    last_5 < 65
}

build_aggregates <- function() {
    # How many grades in your class are higher than 75?
    sum(my_class > 75)

    # How many students in your class scored strictly higher than you?
    sum(my_class > me)

    # What's the proportion of grades below or equal to 64 in the last 5 years?
    sum(last_5 <= 64) / (nrow(last_5) * ncol(last_5))
}

logic_operator <- function() {
    # Is your grade greater than 87 and smaller than or equal to 89?
    me > 87 & me <= 89

    # Which grades in your class are below 60 or above 90?
    my_class < 60 | my_class > 90
}

build_aggregates2 <- function() {
    # What's the proportion of grades in your class that is average?
    mean(my_class >= 70 & my_class <= 85)

    # How many students in the last 5 years had a grade of 80 or 90?
    sum(last_5 == 80 | last_5 == 90)
}

if_else <- function() {
    # Define n_smart
    n_smart <- sum(my_class >= 80)

    # Code the if-else construct
    if (n_smart > 50) {
        print("smart class")
    } else {
        print("rather average")
    }

    # Define prop_less
    prop_less <- mean(my_class < me)

    # Code the control construct
    if (prop_less > 0.9) {
        print("you're among the best 10 percent")
    } else if (prop_less > 0.8) {
        print("you're among the best 20 percent")
    } else {
        print("need more analysis")
    }
}

operation <- function() {
    # Create top_grades
    top_grades <- my_class[my_class >= 85]

    # Create worst_grades
    worst_grades <- my_class[my_class < 65]

    # Write conditional statement
    if (length(top_grades) > length(worst_grades)) {
        print("top grades prevail")
    }
}

data <- prepare_data()
me <- data$me
other_199 <- data$other_199
previous_4 <- data$previous_4

a <- analysis()
my_class <- a$my_class
last_5 <- a$last_5

#plot()
#basic_query()
build_aggregates()
logic_operator()
build_aggregates2()
operation()

