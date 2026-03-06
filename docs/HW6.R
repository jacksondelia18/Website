################
#Homework 5

#1) Create a funtion that takes the parameters 
# required to run a logistic growth model and 
# returns a dataframe with columns for population size and time.

Nt <- function(N0 = 10, r = 0.1, K = 200, tf = 100, ts = 1) {

  t <- seq(from = 1, to = tf, by = ts)
  e <- 2.7183
  N <- K/(1+((K-N0)/N0)*e^(-r*t))

  df <- data.frame(t, N)
  
return(df)

  

}
LogGrowth <- Nt()

#######


plot <- function(df = LogGrowth){

  library(ggplot2)
  LogGrowth |>
      ggplot(aes(x=t, y=N))+
    geom_point()+
    labs(
      x = "Time in Years", 
      y = "Population Size") +
    theme_minimal()


}
plot()

















