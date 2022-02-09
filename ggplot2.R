#Barplot----
#This R tutorial describes how to create a barplot using R software and ggplot2 package.
# http://www.cookbook-r.com/Graphs/----
# Data----
df <- data.frame(name=c("appu", "saneesh", "sanusha"),
                 weight=c(19, 48, 62.5))
head(df)
library(ggplot2)
# Basic barplot----
p<-ggplot(data=df, aes(x=name, y=weight)) +
  geom_bar(stat="identity")
p

# Horizontal bar plot----
p + coord_flip()
# Change the width of bars----
ggplot(data=df, aes(x=name, y=weight)) +
  geom_bar(stat="identity", width=0.5)
# Change colors----
ggplot(data=df, aes(x=name, y=weight)) +
  geom_bar(stat="identity", color="blue", fill="white")
# Minimal theme + blue fill color----
p<-ggplot(data=df, aes(x=name, y=weight)) +
  geom_bar(stat="identity", fill="steelblue")+
  theme_minimal()
p
# Outside bars----
ggplot(data=df, aes(x=name, y=weight)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=weight), vjust=-0.3, size=3.5)+
  theme_minimal()
# Inside bars----
ggplot(data=df, aes(x=name, y=weight)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=weight), vjust=1.6, color="red", size=3.5)+
  theme_minimal()
# Change outline colors by group---- 
p<-ggplot(df, aes(x=name, y=weight, color=name)) +
  geom_bar(stat="identity", fill="white")
p
# Custom colors----
# Use custom color palettes
p+scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))
# Use brewer color palettes
p+scale_color_brewer(palette="Dark2")
# Use grey scale
p + scale_color_grey() + theme_classic()
# Change fill colors----
# Change barplot fill colors by groups
p<-ggplot(df, aes(x=name, y=weight, fill=name)) +
  geom_bar(stat="identity")+theme_minimal()
p
# Adding a title----

p<-ggplot(df, aes(x=name, y=weight, fill=name)) +
  geom_bar(stat="identity")+theme_minimal()+
  ggtitle("name and weight of family members")
p
# Use custom color palettes----
p+scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))
# use brewer color palettes
p+scale_fill_brewer(palette="Dark2")
# Use grey scale
p + scale_fill_grey()

# Choose which items to display----
p + scale_x_discrete(limits=c("sanusha", "appu"))

# Use black outline color----
p<-ggplot(df, aes(x=name, y=weight, fill=name)) +
  geom_bar(stat="identity", color="black")+
  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))+
  theme_minimal()
p

# Change the legend position----
# Change bar fill colors to blues
p <- p+scale_fill_brewer(palette="Blues")
p + theme(legend.position="top")
p + theme(legend.position="bottom")
# Remove legend----
p + theme(legend.position="none")
# Barplot with multiple groups----
df2 <- data.frame(supp=rep(c("VC", "OJ"), each=3),
                  dose=rep(c("D0.5", "D1", "D2"),2),
                  len=c(6.8, 15, 33, 4.2, 10, 29.5))
head(df2)

# let us open excel and make a data.frame with column name, height and weight
# sanusha	1.55	48
# appu	0.5	20
# saneesh	1.6	63
# then save as df4, excel files as .csv in the directory that we made.
# go to the file window and click on the name and choose Import Dataset or

library(readr)
library(ggplot2)
df4 <- read.csv("df4.csv")
class(df4)

row.names (df4)
colnames(df4)
ggplot(data = df4, aes(x=height,y=name, fill=weight))+
  geom_bar(stat = "identity")+coord_flip()

# Stacked barplot with multiple groups----
ggplot(data=df4, aes(x=name, y=weight, fill=height)) +
  geom_bar(stat="identity")
# Use position=position_dodge()
ggplot(data=df4, aes(x=name, y=weight, fill=height)) +
  geom_bar(stat="identity", position=position_dodge())

