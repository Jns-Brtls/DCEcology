library(tidyverse)

# download the file
download.file("https://ndownloader.figshare.com/files/11930600?private_link=fe0cd1848e06456e6f38",
              "data/surveys_complete.csv")
surveys_complete <- read_csv("data/surveys_complete.csv")

ggplot(data = surveys_complete)

ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length))

ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +
  geom_point()

ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, color = "blue")

ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, aes(color = species_id))

ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length, color = species_id)) +
  geom_point(alpha = 0.1)

# challenge
ggplot(data = surveys_complete, aes(x = species_id, y = weight, color = plot_id)) +
  geom_jitter(alpha = 0.15) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Species and weight\n", x = "Species", y = "Weight", color = "Plot id\n")

str(surveys_complete)

surveys_complete$plot_id <- factor(surveys_complete$plot_id)

ggplot(data = surveys_complete, aes(x = species_id, y = weight)) +
  geom_jitter(alpha = 0.15, aes(color = plot_id)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Species and weight\n", x = "Species", y = "Weight", color = "Plot id\n") +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())

# Challenges
# Boxplots are useful summaries, but hide the shape of the distribution. For
# example, if the distribution is bimodal, we would not see it in a boxplot. An
# alternative to the boxplot is the violin plot, where the shape (of the density
# of points) is drawn. Replace the box plot with a violin plot; see
# geom_violin().

# In many types of data, it is important to consider the scale of the
# observations. For example, it may be worth changing the scale of the axis to
# better distribute the observations in the space of the plot. Changing the
# scale of the axes is done similarly to adding/modifying other components
# (i.e., by incrementally adding commands). Try making these modifications:
# Represent weight on the log10 scale; see scale_y_log10().

# So far, we’ve looked at the distribution of weight within species. Try making
# a new plot to explore the distribution of another variable within each
# species. Create a boxplot for hindfoot_length. Overlay the boxplot layer on a
# jitter layer to show actual measurements. Add color to the data points on your
# boxplot according to the plot from which the sample was taken (plot_id).

# Hint: Check the class for plot_id. Consider changing the class of plot_id from
# integer to factor. Why does this change how R makes the graph?
  

