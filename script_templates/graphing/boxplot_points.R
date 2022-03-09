
# this code will make a boxplot with mean and all points included
# make sure you have loaded the ggbeeswarm package to use geom_quasirandom()
# alternatively, you can use geom_jitter() instead


ggplot(
  data = ___, 
  aes(x = ___, y = ___)) + 
  geom_boxplot(outlier.shape= NA) +  #remove the outliers when all the points are included
  geom_quasirandom(
    aes(x= ___, y = ___, fill = ___),   #adds quasirandom jittered points but colors them by fill
    shape=21, size=1, alpha = 0.5, width=0.25) + #sets the size, shape, and transparency of the points
  stat_summary(fun=mean, geom="point", shape=4, size=2, colour="black", stroke=2) + #adds mean with an X
  ylab("___") +
  xlab("___") +
  coord_cartesian(expand=TRUE) +
  theme_classic(base_size=16)  +
  theme(legend.position="none") # remove this line if you DO want a legend/key

#see the resources below for some additional options to make a nice plot 
# https://www.datanovia.com/en/lessons/ggplot-boxplot/
# https://ggplot2.tidyverse.org/index.html