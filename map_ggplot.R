library(ggplot2)
xlims <- c(-70, 290)
ylims <- c(-55, 75)
df_map <- map_data('world', wrap=xlims, ylim=ylims)
ggplot(df_map, aes(long, lat, group=group, color='red'))+
  geom_polygon()+
  coord_map('gilbert', xlim = xlims, ylim = ylims)
