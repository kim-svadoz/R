library("ggplot2")
data(mpg)
mpg %>% 
  group_by(class) %>% 
  summarise(cty_avg=mean(cty)) %>% 
  arrange(desc(cty_avg))

head(mpg,n=3) %>% 
  group_by(manufacturer) %>% 
  arrange(desc(hwy))

mpg[mpg$class=="compact",] %>% 
  group_by(manufacturer) %>% 
  summarise(count=n()) %>% 
  arrange(desc(count))
  
