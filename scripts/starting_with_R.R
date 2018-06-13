library(tidyverse)

download.file("https://ndownloader.figshare.com/files/2292169", "data/portal_data_joined.csv")

surveys <- read.csv("data/portal_data_joined.csv")
head(surveys)
str(surveys)

dim(surveys) 
nrow(surveys) 
ncol(surveys) 
head(surveys) 
tail(surveys) 
names(surveys)    
rownames(surveys)
str(surveys)
summary(surveys)


sex <- factor(c("male", "female", "male", "female"))
levels(sex)
nlevels(sex)

lvls <- factor(c("high", "medium", "low"))
levels(lvls)

# change level order
lvls <- factor(lvls, levels = c("low", "medium", "high"))
levels(lvls)

as.character(lvls)

# numbers
year_fct <- factor(c(1990, 1983, 1997, 1990))
as.numeric(as.character(year_fct))
as.numeric(levels(year_fct))[year_fct]

# plotting
plot(surveys$sex)
str(surveys$sex)

sex <- surveys$sex
levels(sex)

# change the name of the first one, the empty one
levels(sex)[1] <- "Undetermined"

levels(sex)

plot(sex)


# Challenge 
# Rename “F” and “M” to “female” and “male” respectively. 
# Now that we have renamed the factor level to “undetermined”, can you recreate
# the barplot such that “undetermined” is last (after “male”)?

levels(sex)[2] <- "Female"
levels(sex)[3] <- "Male"
levels(sex)[1:3] <- c("Undetermined","Female","Male")

sex <- factor(sex, levels = c("Female", "Male", "Undetermined"))

plot(sex)


# stringsAsFactors = FALSE
surveys <- read.csv("data/portal_data_joined.csv", stringsAsFactors = FALSE)
str(surveys)

plot(surveys$species_id)
#doesnt work

# stringsAsFactors = TRUE
surveys <- read.csv("data/portal_data_joined.csv", stringsAsFactors = TRUE)
str(surveys)

plot(surveys$species_id)
#does work


#date
library(lubridate)

my_date <- ymd("2015-01-01")
str(my_date)

my_date2 <- ymd(paste("2015","1","1", sep = "-"))

paste(surveys$month, surveys$month, surveys$day, sep = "-")
ymd(paste(surveys$month, surveys$month, surveys$day, sep = "-"))

surveys$date <- ymd(paste(surveys$month, surveys$month, surveys$day, sep = "-"))
str(surveys)


#look for missing date (129 failed to parse)
is_missing_date <- is.na(surveys$date)
is_missing_date
sum(is_missing_date) # is 129

date_columns <- c("year", "month", "day")
missing_dates <- surveys[is_missing_date, date_columns]
head(missing_dates)



