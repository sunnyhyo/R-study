install.packages("plotly")
library(plotly)

plot_ly(z = ~volcano)

txhousing


# 1. ggplot()
p <- ggplot(txhousing, aes(date, median)) +
  geom_line(aes(group = city), alpha = 0.2)
p

# 1.1 ggplotly()
subplot(
  p, ggplotly(p, tooltip = "city"), 
  ggplot(txhousing, aes(date, median)) + geom_bin2d(),
  ggplot(txhousing, aes(date, median)) + geom_hex(),
  nrows = 2, shareX = TRUE, shareY = TRUE,
  titleY = FALSE, titleX = FALSE
)




# 1.2 plotly
# 계층 적 문법 그래픽
# 유연하고 직접적인 인터페이스 제공, 데이터프레임 필요 없음


library(dplyr)
tx <- group_by(txhousing, city)
# initiate a plotly object with date on x and median on y
p <- plot_ly(tx, x = ~date, y = ~median)
# plotly_data() returns data associated with a plotly object
plotly_data(p)

# add a line highlighting houston
add_lines(
  # plots one line per city since p knows city is a grouping variable
  add_lines(p, alpha = 0.2, name = "Texan Cities", hoverinfo = "none"),
  name = "Houston", data = filter(txhousing, city == "Houston")
)
#  add_*()에 정의 된 속성을 상속 모두의 기능을 plot_ly(). 이 함수는 data인수로 달리 지정되지 않는 한 입력으로 제공된 플롯 객체와 관련된 데이터도 상속


allCities <- txhousing %>%
  group_by(city) %>%
  plot_ly(x = ~date, y = ~median) %>%
  add_lines(alpha = 0.2, name = "Texan Cities", hoverinfo = "none")

allCities %>%
  filter(city == "Houston") %>%
  add_lines(name = "Houston")

allCities %>%
  add_fun(function(plot) {
    plot %>% filter(city == "Houston") %>% add_lines(name = "Houston")
  }) %>%
  add_fun(function(plot) {
    plot %>% filter(city == "San Antonio") %>% 
      add_lines(name = "San Antonio")
  })