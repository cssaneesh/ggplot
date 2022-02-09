# Install.packages("tidyverse")
# Install.packages("dplyr")
# install.packages("corrplot")
# install.packages("MuMIn")
# install.packages("data.table")
# install.packages("car")
# install.packages("ggplot2")
# install.packages("RColorBrewer")
# install.packages("GGally")

library(ggplot2)
library(RColorBrewer)

# data----
data("msleep")
str(msleep)
View(msleep)

class(msleep$vore) # class of a single variable 

# do larget animals sleep a lot?----
ggplot(msleep, aes(x=bodywt, y=sleep_total))+
  geom_point(size=3, aes(color=vore))+
  xlab('body weight')+
  ylab('total sleep (hours)')+
  ggtitle('are larger animals sleeping more?')

# we would like to see what is the large animal
ggplot(msleep, aes(x=bodywt, y=sleep_total, label=name, color=vore))+
  geom_text(check_overlap = T)+
  xlab('body weight')+
  ylab('total sleep (hours)')+
  ggtitle('are larger animals sleeping more?')+
  xlim(-500, NA) # this will allow all the names to fit nicely

# faceting----
ggplot(msleep, aes(x=bodywt, y=sleep_total,  label=name, color=vore))+
  geom_point()+
  xlab("Body Weight")+
  ylab("Total sleep (hours)")+
  facet_wrap(~vore)+  
  ggtitle("Are larger animals sleeping   more?")+
  scale_colour_grey()
  
ggplot(msleep, aes(x=sleep_total, y=brainwt))+
  geom_point(aes(color=vore, size=bodywt))+
  geom_smooth(SE=F, color='black')+
  xlab("log lody Weight (kg)")+
  ylab("sleep (hours)")+
  ggtitle("Are larger animals sleeping   more?")+
  scale_y_continuous(trans='log10')
  
ggplot(msleep, aes(x=sleep_total, y=brainwt))+
  geom_point(aes(color=vore, size=bodywt))+
  geom_smooth(method = 'lm', SE=T, color='black')+ # add method lm and standared error
  xlab("log lody Weight (kg)")+
  ylab("sleep (hours)")+
  ggtitle("Are larger animals sleeping   more?")

ggplot(msleep, aes(x= vore, y= bodywt))+
  geom_boxplot(aes(fill=vore))+
  geom_jitter()+
  xlab("diet")+
  ylab("log Body Weight (kg)")+
  ggtitle("diet vs. body weight")+
  scale_y_continuous(trans='log10')

ggplot(msleep, aes(x= vore, y= bodywt))+
  geom_jitter ()+
  geom_boxplot(aes(fill=vore))+
  xlab("diet")+
  ylab("log Body Weight (kg)")+
  ggtitle("diet vs. body weight")+
  scale_y_continuous(trans='log10')

ggplot(msleep, aes(x= vore, y= bodywt, color=vore, fill=vore))+
  geom_jitter()+
  geom_boxplot()+ # can add color='black' inside ()
  theme(axis.line.x = element_text(angle = 90))+
  xlab("diet")+
  ylab("log Body Weight (kg)")+
  ggtitle("diet vs. body weight")+
  scale_y_continuous(trans='log10')+
  theme_classic()+ 
  ggsave("my_plot.jpg") # to save the plot

names(msleep)

ggplot(msleep, aes(x= vore, y= bodywt, fill=vore))+
  geom_jitter()+
  geom_boxplot()+ # can add color='black' inside ()
  theme(axis.line.x = element_text(angle = 90))+
  xlab("diet")+
  ylab("log Body Weight (kg)")+
  ggtitle("diet vs. body weight")+
  scale_y_continuous(trans='log10')+
  theme_classic()+
  scale_fill_brewer(palette = "BuGn") # using RColorBrewer package
