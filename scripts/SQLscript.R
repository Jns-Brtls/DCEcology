# Installing new packages ----
# install.packages("dbplyr")
# install.packages("RSQLite") 

# Load the libraries ----
library(dplyr)
library(dbplyr)
library(DBI)
library(RSQLite)

# download data ----
# download.file(url = "https://ndownloader.figshare.com/files/2292171", destfile = "data/portal_mammals.sqlite", mode = "wb")
?download.file

# Create a connection to the sqlite database ----
?dbConnect # to create a connection to an existing DB
DBconnection <- DBI::dbConnect(RSQLite::SQLite(),"data/portal_mammals.sqlite")

# to see what our DBconnection object looks like
str(DBconnection)

# looking into my DBConnection
??src_dbi 
src_dbi(DBconnection)

# interacting with tables
?tbl
tbl(DBconnection, "surveys")
tbl(DBconnection, "plots")
tbl(DBconnection, "species")

# assign to an object
surveys <- tbl(DBconnection, "surveys")
head(surveys)
nrow(surveys)
tbl(DBconnection, "plots")
tbl(DBconnection, "species")

surveys %>% 
  filter(year == 2002, weight > 220)

#dplyr and SQL are related!
show_query(surveys %>% 
             filter(year == 2002, weight > 220))

# write a dplyr mutate on surveys to add a column called mean_weight
surveys %>% 
  mutate(weight_kg = weight / 1000)

# in the back, it is sql
show_query(surveys %>% 
             mutate(weight_kg = weight / 1000))

# Make a subset of your data and plot it
surveys2002 <- surveys %>% 
  filter(year == 2002) %>% 
  as.data.frame() # makes it as a data frame in our environment

library(ggplot2)  
ggplot(data = surveys2002, aes(weight, colour = "red")) +
  stat_density(geom = "line", size = 2, position = "identity") +
  theme_classic() +
  theme(legend.position = "none")

# Exercise
# Make one chunk of code to do the subset and the plot

surveys %>% 
  filter(year == 2002) %>% 
  as.data.frame() %>% 
  ggplot(aes(weight, colour = "red")) +
  stat_density(geom = "line", size = 2, position = "identity") +
  theme_classic() +
  theme(legend.position = "none")


# Save the surveys2002 into a csv file in your data folder
write_csv(surveys2002, path = "data/surveys2002.csv")














