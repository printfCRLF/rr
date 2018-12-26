library(xts)

converting_xts_objects <- function() {
    print(head(austres))

    au <- as.xts(austres)
    am <- as.matrix(au)
    result <- head(am)
    print(result)

    am2 <- as.matrix(austres)
    result <- head(am2)
    print(result)
}

importing_data <- function() {
    tmp_file = "http://s3.amazonaws.com/assets.datacamp.com/production/course_1127/datasets/tmp_file.csv"
    dat <- read.csv(tmp_file)
    print("raw csv file content")
    print(dat)

    # Convert dat into xts
    xts(dat, order.by = as.Date(rownames(dat), "%m/%d/%Y"))

    # Read tmp_file using read.zoo
    dat_zoo <- read.zoo(tmp_file, index.column = 0, sep = ",", format = "%m/%d/%Y")
    print("read.zoo")
    print(dat_zoo)

    dat_xts <- as.xts(dat_zoo)
    print("convert zoo into xts")
    print(dat_xts)
}

export_xts_object <- function() {
    csv_data = read.csv("Temps.csv")
    sunspots_xts <- as.xts(csv_data)
    print(sunspots_xts)
    #tmp <- generate_temp_filename()
    tmp <- "Temps_out.csv"

    write.zoo(sunspots_xts, sep = ",", file = tmp)
    sun <- read.zoo(tmp, sep = ",", FUN = as.yearmon)
    sun_xts <- as.xts(sun)
    #print(sun_xts)
}

generate_temp_filename <- function() {
    result <- toString(rnorm(1))
    result <- paste(result, "csv", sep = ".")
    return(result)
}

#converting_xts_objects()
#importing_data()
export_xts_object()