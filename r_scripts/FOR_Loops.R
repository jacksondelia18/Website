#basic coding with for loops

for (i in 1:5) {
  cat("stuck in a loop", "\n")
  cat(3+2, "\n")
  cat(runif(1), "\n")

}


my_dogs <- c("chow", "akia", "malam", "husky", "samoyed")

for (i in 1:length(my_dogs)){
  cat("i=", i, "my_dogs[i]", my_dogs[i], "\n")
}

my_bad_dogs <- NULL
for (i in 1:length(my_bad_dogs)){
  cat("i=", i, "my_bad_dogs[i]", my_bad_dogs[i], "\n")
}

for (i in seq_along(my_dogs)){
 cat("i=", i, "my_dogs[i]", my_dogs[i], "\n")

}

#Tips & tricks
#dont loop things you dont need to:

for(i in seq_along(my_dogs)){
  my_dogs[i] <- toupper(my_dogs[i])


}
my_dogs
tolower(my_dogs)
#text changes or rounding can be done once at the end rather than
#in the loop every single time


#tip 2
#don't change dimensions in the loop
my_dat <- runif(1)
for (i in 2:10){
  temp <- runif(1)
  my_dat <- c(my_dat, temp)
  cat("loop number =", i, my_dat[i], "\n")
  print(my_dat)
}
#make a vector of length 10, then run that in the loop rather than
#generating the long vector in the loop


#tip 3
#don't write a loop if you can vectorize it
my_dat <- 1:10
for (i in seq_along(my_dat)){
  my_dat[i] <- my_dat[i] + my_dat[i]^2
  cat("loop number =", i, "vector element", my_dat[i], "\n")


}
#much more efficient
z <- 1:10
z <- z + z^2


#tip 4
#remember diff between i and z[i]
z <- c(10,2,4)
for (i in seq_along(z)){
  cat("i=", i, "z[i]=", z[i], "\n")


}
#i is position, z[i] is value indexed


#tip 5
# dont have to loop through every value

z <- 1:20

for (i in seq_along(z)){
  if(i %% 2 ==0) next
  print(i)
}
#only prints odd values, reducing computing time by half


########################################

# LOGISTIC GROWTH FUNCTION
######################################################
# Function Name: logistic_growth
#
# Purpose:
#   Simulates continuous-time logistic population growth using the
#   closed-form solution to the logistic differential equation.
#   Returns a tidy dataframe suitable for plotting or further analysis.
#
# Inputs:
#   N0 (numeric)  : Initial population size at time t = 0
#   r  (numeric)  : Intrinsic growth rate
#   K  (numeric)  : Carrying capacity
#   t_max (numeric) : Maximum simulation time
#   dt (numeric)  : Time step used to generate the time vector
#
# Output:
#   data.frame containing:
#     time (numeric)        : Time values from 0 to t_max
#     population (numeric)  : Population size N(t) at each time
#     N0 (numeric)          : Initial population parameter used
#     r (numeric)           : Growth rate parameter used
#     K (numeric)           : Carrying capacity parameter used
######################################################
logistic_growth <- function(
  N0 = 10,
  r  = 0.3,
  K  = 100,
  t_max = 50,
  dt = 0.1
){
  
  # time vector
  time <- seq(0, t_max, by = dt)
  
  # logistic equation (closed-form solution)
  N <- K / (1 + ((K - N0) / N0) * exp(-r * time))
  
  # return tidy dataframe
  data.frame(
    time = time,
    population = N,
    N0 = N0,
    r = r,
    K = K
  )
}
######################################################
# END FUNCTION
  

r_vec <- seq(0, 1, by=0.01)
container <- rep(NA, length(r_vec)) #storage for max(n)


for (i in seq_along(r_vec)){
  tempDF <- logistic_growth(r = r_vec[i])
  max_n <- max(tempDF$population)
  print(max_n)
  container[i] <- max_n 

}
growthdf <- data.frame(r = r_vec, N = container)
head(growthdf)


plot(growthdf$r, growthdf$N)
