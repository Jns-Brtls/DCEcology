library(tidyverse)

# download the file
download.file("https://ndownloader.figshare.com/files/11930600?private_link=fe0cd1848e06456e6f38",
              "data/surveys_complete.csv")
surveys_complete <- read_csv("data/surveys_complete.csv")

ggplot(data = surveys_complete)

ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length))

ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +
  geom_point()
