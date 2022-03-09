
# this code will make a bar graph with means and standard errors



#first calculate the mean, sd, & count the observations in each group
df.sum <- ___ %>%
  group_by(___) %>%
  summarise(mean = mean(___), 
            sd = sd(___), 
            n = n()) %>%
  
  #calculate the standard error
  mutate(sem = sd/(sqrt(n)))


#make bar graph
ggplot(
  data=df.sum, 
  aes(x=___,y=mean))+
  geom_bar(stat="identity",  width = 0.5, fill = "steelblue")+
  geom_errorbar(aes(ymin=mean-sem, ymax=mean+sem), width=0.1, size=1) +
  ylab("___") +
  xlab("___") +
  coord_cartesian(xlim = c(0.5,4.5), ylim = c(0,5), expand=FALSE) +
  theme_classic(base_size=16) +
  theme(legend.position="none")


#see the resources below for some additional options to make a nice plot 
# https://www.datanovia.com/en/lessons/ggplot-barplot/
# https://ggplot2.tidyverse.org/index.html