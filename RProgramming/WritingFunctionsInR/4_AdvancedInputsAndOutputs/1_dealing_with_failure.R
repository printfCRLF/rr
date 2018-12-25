library(purrr)

urls <- list(
  example = "http://example.org",
  rproj = "http://www.r-project.org",
  asdf = "http://asdfasdasdkfjlda"
)

create_a_safe_function <- function() {
    # Create safe_readLines() by passing readLines() to safely()
    safe_readLines <- safely(readLines)

    # Call safe_readLines() on "http://example.org"
    example_lines <- safe_readLines("http://example.org")
    example_lines

    # Call safe_readLines() on "http://asdfasdasdkfjlda"
    nonsense_lines <- safe_readLines("http://asdfasdasdkfjlda")
    nonsense_lines
}

use_map_safely <- function(urls) {
    # Define safe_readLines()
    safe_readLines <- safely(readLines)

    # Use the safe_readLines() function with map(): html
    html <- map(urls, safe_readLines)

    # Call str() on html
    str(html)

    # Extract the result from one of the successful elements
    html[[1]]$result

    # Extract the error from the element that was unsuccessful
    html[[3]]$error
}

working_with_safe_output <- function(urls) {
    # Define safe_readLines() and html
    safe_readLines <- safely(readLines)
    html <- map(urls, safe_readLines)

    # Examine the structure of transpose(html)
    str(transpose(html))

    # Extract the results: res
    res <- transpose(html)$result

    # Extract the errors: errs
    errs <- transpose(html)$error
}

working_with_errors_and_results <- function(urls) {
    # Initialize some objects
    safe_readLines <- safely(readLines)
    html <- map(urls, safe_readLines)
    res <- transpose(html)[["result"]]
    errs <- transpose(html)[["error"]]

    # Create a logical vector is_ok
    is_ok <- map_lgl(errs, is_null)

    # Extract the successful results
    res[is_ok]

    # Find the URLs that were unsuccessful
    urls2 <- urls[!is_ok]
    print("urls that were unsuccessful")
    print(urls2)
}

#create_a_safe_function()
#use_map_safely()
#working_with_safe_output(urls)
working_with_errors_and_results(urls)

