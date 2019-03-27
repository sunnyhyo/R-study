library(dplyr)
library(ggplot2)
library(gridExtra)
library(ggthemes)
install.packages("nloptr")
library(nloptr)
install.packages("faraway")  ## Uncomment and run if you do not have the `faraway` package installed
library(faraway)
data(nepali)
data(worldcup)

# install.packages("dlnm")     ## Uncomment and run if you do not have the `dlnm` package installed
library(dlnm)
data(chicagoNMMAPS)
chic <- chicagoNMMAPS
chic_july <- chic %>%
  filter(month == 7 & year == 1995)

##############
#Guidelines for good plot

head(worldcup)

###############
#1. Data to ink ratio 
worldcup %>% group_by(Position)  %>% 
  ggplot(aes(Position))+ geom_bar() + ylab("Number of Players") + coord_flip()

worldcup %>% group_by(Position)  %>% 
  ggplot(aes(Position))+ stat_summary(geom="bar")+ ylab("Number of Players") + coord_flip()




###
#With facet_wrap, you can specify how many columns you want to use, which makes it useful if you want to facet across a variable with a lot of variables.
worldcup %>%
  ggplot(aes(x = Time, y = Shots)) + 
  geom_point(alpha = 0.25) +
  facet_wrap(~ Team, ncol = 6) 

