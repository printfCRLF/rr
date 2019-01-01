library(quantmod)

aggregate_daily_and_merge_with_monthly <- function() {
    # Aggregate DFF to monthly
    monthly_fedfunds <- apply.monthly(DFF, mean)

    # Convert index to yearmon
    index(monthly_fedfunds) <- as.yearmon(index(monthly_fedfunds))


    # Merge FEDFUNDS with the monthly aggregate
    merged_fedfunds <- merge(FEDFUNDS, monthly_fedfunds)

    # Look at the first few rows of the merged object
    head(merged_fedfunds)
}



align_series_to_first_and_last_day_of_month <- function(FEDFUNDS, monthly_fedfunds, merged_fedfunds) {
    # Fill NA forward
    merged_fedfunds_locf <- na.locf(merged_fedfunds)

    # Extract index values containing last day of month
    aligned_last_day <- merged_fedfunds_locf[index(monthly_fedfunds)]
    print(head(aligned_last_day))

    # Fill NA backward
    merged_fedfunds_locb <- na.locf(merged_fedfunds, fromLast = TRUE)

    # Extract index values containing first day of month
    aligned_first_day <- merged_fedfunds_locb[index(FEDFUNDS)]
    print(head(aligned_first_day))
}

aggregate_to_week <- function() {
    # Extract index weekdays
    index_weekdays <- .indexwday(DFF)

    # Find locations of Wednesdays
    wednesdays <- which(index_weekdays == 3)

    # Create custom end points
    end_points <- c(0, wednesdays, nrow(DFF))

    # Calculate weekly mean using custom end points
    weekly_mean <- period.apply(DFF, end_points, mean)
}

getSymbols(c("FEDFUNDS", "DFF"), src = "FRED")
aggregate_daily_and_merge_with_monthly()

monthly_fedfunds <- apply.monthly(DFF, mean)
merged_fedfunds <- merge(FEDFUNDS, monthly_fedfunds)
align_series_to_first_and_last_day_of_month(FEDFUNDS, monthly_fedfunds, merged_fedfunds)

aggregate_to_week()




