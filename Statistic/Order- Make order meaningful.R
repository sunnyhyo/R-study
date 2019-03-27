library(dplyr)
library(ggplot2)
library(gridExtra)
library(ggthemes)
install.packages("nloptr")
library(nloptr)
install.packages("faraway")  ## Uncomment and run if you do not have the `faraway` package installed
library(faraway)
data(worldcup)
###########################
head(worldcup)
table(worldcup$Team)
worldcup %>%
  group_by(Team) 
worldcup %>%
  group_by(Team) %>%
  summarize(mean_time = mean(Time))

#########################
##Order
#Make order meaningful

## Left plot
worldcup %>%
  group_by(Team) %>%
  summarize(mean_time = mean(Time)) %>%
  ggplot(aes(x = mean_time, y = Team)) + 
  geom_point() + 
  theme_few() + 
  xlab("Mean time per player (minutes)") + ylab("") 

## Right plot
worldcup %>%
  group_by(Team) %>%
  summarize(mean_time = mean(Time)) %>%
  arrange(mean_time) %>%                         # re-order and re-set
  mutate(Team = factor(Team, levels = Team)) %>% # factor levels before plotting
  ggplot(aes(x = mean_time, y = Team)) + 
  geom_point() + 
  theme_few() + 
  xlab("Mean time per player (minutes)") + ylab("") 