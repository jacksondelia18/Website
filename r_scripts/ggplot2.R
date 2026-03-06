#ggplot


library(ggplot2)

d <- mpg # use built in mpg data frame
str(d)

g1 <- ggplot(data=d) +
      aes(x=displ,y=cty) + 
      geom_point() + 
      geom_smooth()
  labs(fill = "fuel Type", x = "fuel type", y = "count", title = "My Plot")
  theme(legend.position = "top")
  theme(legend.position = c(.2, .8))
print(g1)


g2 <- ggplot(data=d) +
          aes(x=fl) +
          geom_bar(fill="tomato",color="black")+ 
          theme(legend.position="none")
        labs(fill = "fuel Type", x = "fuel type", y = "count", title = "My Plot")
  theme(legend.position = "top")
  theme(legend.position = c(.2, .8))
print(g2)            

 p2 <- ggplot(data=d, mapping=aes(x=fl,fill=fl)) + geom_bar()+
    labs(fill = "fuel Type", x = "fuel type", y = "count", title = "My Plot")+
    theme(legend.position = "top")
 print(p2)


#########################
#multi panel plots

install.packages("patchwork")
install.packages("ggthemes")

library("patchwork")
library("ggthemes")

g1 <- ggplot(data = d) +
  aes( x= displ, y= cty) +
  geom_point() +
  geom_smooth()
g1

g2 <- ggplot(data = d) +
  aes(x=fl) +
  geom_bar(fill = "tomato", color = "black") 

  g2
 

g3 <- ggplot(data = d) +
    aes (x = displ) +
  geom_histogram(fill = "royalblue", color = "black")
g3

g4 <- ggplot(data = d) +
  aes(x = "fuel type", y= "cty", fill = fl) +
  geom_boxplot() +
  theme(legend.position = "none")
g4


#combining plots
g1+g2

g1+g2+g3 + plot_layout(ncol = 1)


#relative area of each plot
g1 + g2 + plot_layout(ncol = 1, heights = c(3, 1))
#heights is weights of relative size
g1 + g2 + plot_layout(ncol = 2, widths = c(4, 1))


#adding spacers
g1 + plot_spacer() + g2


#nested layouts
g1 + {
  g2 + {
    g3+
      g4+
      plot_layout(ncol = 1)
  }

} + 
  plot_layout(ncol = 1)


# - operator for subtrack placement
g1 + g2 - g3 + plot_layout(ncol = 1)


#using | and \ 
(g1 | g2 | g3)/g4 + plot_annotation("Title Here", caption = "made in patchwork")


#adding tags
g1 / (g2 + g3) + 
  plot_annotation(tag_levels = "A")


#############################
#multi-panel plots woth facet

m1 <- ggplot(data = d) +
  aes(x = displ, y = cty) +
  geom_point() +
  geom_smooth(method = "lm")
#add using facet grid
m1 + facet_grid(class ~ fl, scales = "free_x")
#facet with two variables, and dynamic scales
#also can do free_y, or both with just "free"


#facet only one variable
m1 + facet_grid(.~class)


#facet wrap
m1 + facet_wrap(~class + fl)
#strips out combos with no data
#add: , drop= F to keep empty points
