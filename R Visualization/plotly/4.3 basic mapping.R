library(ggplot2)

us_map <- map_data("state")
head(us_map, 3)
table(us_map$group)

us_map %>%  #us_map 데이터셋에서
  filter(region %in% c("north carolina", "south carolina")) %>% # filter (행선택) 두 지역 선택
  ggplot(aes(x = long, y = lat)) +   #plot 을 그린다. x 축 경도축, y 축 위도
  geom_point()                       # 점찍어라

us_map %>%  
  filter(region %in% c("north carolina", "south carolina")) %>% 
  ggplot(aes(x = long, y = lat)) +
  geom_path()  #geom_line() 과 차이는? 한번 해보자..
#geom_line()은 aes(x) x축대로 sorting을 자동으로 해준다
#geom_path()는 dataset 의 정렬되지 않은 x 순서대로 그려준다. 
#이 그림에서 문제는? 두 지역 잇는 요상한 선

us_map %>%
  filter(region %in% c("north carolina", "south carolina")) %>% 
  ggplot(aes(x = long, y = lat, group = group)) +   
               # group =각 그룹별로 따로따로 그림을 그려준다. 
  geom_path()

us_map %>% 
  filter(region %in% c("north carolina", "south carolina")) %>% 
  ggplot(aes(x = long, y= lat, group = group)) + 
  geom_polygon(fill = "lightblue", colo오r = "black")   
#geom_polygon() 다각형옵션, fill 하늘색으로 채워주시오
us_map %>% 
  filter(region %in% c("north carolina", "south carolina")) %>% 
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "lightblue", color = "black") + 
  theme_void()  #테마 적ㅇ


us_map %>% #dplyr 의 filter 적용을 안했더니! 미국 전체 주에 대해서 색칠ㄷ
  ggplot(aes(x = long, y = lat, group = group)) + 
  geom_polygon(fill = "lightblue", color = "black") + 
  theme_void()


##########################

data(votes.repub)
head(votes.repub)

library(dplyr)
library(viridis)

colnames(votes.repub)

votes.repub %>% 
  tbl_df %>% 
  mutate(state = rownames(votes.repub), 
         state = tolower(state)) %>% 
  right_join(us_map, by = c("state"="region")) %>% 
  ggplot(aes(x = long, y = lat, group = group, fill = `1976`)) +
  geom_polygon(color = "black") + 
  theme_void() +
  scale_fill_viridis(name = "Republican\nvotes(%)")

########################
#오류...
library(readr)

serial <- read_csv(paste0("https://raw.githubusercontent.com/",
                          "dgrtwo/serial-ggvis/master/input_data/",
                          "serial_podcast_data/serial_map_data.csv"))
head(serial, 3)


serial <-  serial %>% 
  mutate(long = - 76.8854 + 0.00017022* x, 
         lat = 39.23822 + 1.371014e-04* y, 
         tower = Type == "cell-site")
serial %>% 
  slice( c(1:3, (n() -2):(n())))


maryland <- map_data('contry', region = "maryland")         
head(maryland)
baltimore <- maryland %>%
  filter(subregion %in% c("baltimore city", "baltimore"))
head(baltimore, 3)
ggplot(baltimore, aes(x = long, y = lat, group = group)) + 
  geom_polygon(fill = "lightblue", color = "black") + 
  theme_void()
ggplot(baltimore, aes(x = long, y = lat, group = group)) + 
  geom_polygon(fill = "lightblue", color = "black") + 
  geom_point(data = serial, aes(group = NULL, color = tower)) + 
  theme_void() + 
  scale_color_manual(name = "Cell tower", values = c("black", "red"))
