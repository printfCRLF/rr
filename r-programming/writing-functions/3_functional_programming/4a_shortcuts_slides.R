library(purrr)

#specifying.f
shortcut1 <- function() {
    # pass in the summary function from the base package as .f argument
    map(df, summary)

    # pass your own function rescale01 as .f argument
    map(df, rescale01)

    # an anonymous function 
    map(df, function(x) sum(is.na(x)))

    # an anonymous function defined using a formula shortcut 
    map(df, ~ sum(is.na(.)))
}

##shortcut when .f is [[
shortcut2 <- function() {
    list_of_results <- list(
       list(a = 1, b = "A"),
       list(a = 2, b = "C"),
       list(a = 3, b = "D"))

    map_dbl(list_of_results, function(x) x[["a"]])

    map_dbl(list_of_results, `[[`, "a")
    map_dbl(list_of_results, "a") # string subsetting

    map_chr(list_of_results, `[[`, 2)
    map_chr(list_of_results, 2) # integer subsetting
}

shortcut2()