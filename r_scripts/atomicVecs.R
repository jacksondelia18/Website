# this is a  document describing vecotrs in r
# 22nd jan 2026
# Jackson D'Elia


#-----------------------------------------------------------------------
#START OF SCRIPT

x <- 5
print(x)
x

plant_height_and_this_and_that <- 3 #snake case
plantHeightThisThat <- 4 #camel case
plant.height <- 2 #not preferred, evil

. #reserved for temporary variable


# 1D atomic vector:
z <- c(3.2, 5, 5, 6)
print(z)
typeof(z)


z <- c(c(3.2,3),c(3,5))
z
is.numeric(z)
is.character(z)

#character strings
t <- "perch"
print(t)

t <- c("perch", "bass", "trout")
print(t)

t[1]
t[3]

typeof(t)
is.numeric(t)


#logical / Boolean
z <- c(TRUE, FALSE, TRUE)
print(z)

is.logical(z)
typeof(z)

#can also be writen as T or F rather than TRUE or FALSE
c(T,F)

mean(z) #percent of TRUES, since booleans are 1s and 0s

# vector properties
z <- c(1.1, 1.2, 3, 4)

#type of asks what something is
#is asks a t/f statement
#as changes the value to a different type of variable

t <- as.character(z)
print(z)
typeof(z)

length(z) #how long is the variable string?

#random number gen
z <- runif(5)
names(z)
print(z)

names(z) <- c("A", "B", "C", "D", "E") #adds names
print(z)
mean(z)

names(z) <- NULL
names (z)


#special data types
z <- c(3.2, 3, 3, NA)
print(z)
typeof(z)
length(z)
typeof(z[3])
typeof(z[4])


sum(z) #NA stops the sum
sum(z, na.rm=T) #says to ingore the NA values


z <- 0/0
z
z <- 1/0
z

#vectorization
z <- c(10, 20, 30)
z + 1
z/3
z
y <- c(1, 2, 3)

z+y


# recycling

x <- c(1, 2)
z+x
#vectors of different lengths will loop through at different tempos

z+x

###################################################### 
# day 2

z <- vector(mode = "numeric", length = 0)
print (z)
# dynamic creation - avoid in R, doable in python
z <- c(z, 5)
print(z)


#predefined length
z <- rep(0, 100)
print(z)

z <- rep(NA, 100)
z
typeof(z)
z[1] <- "Vermont"
head(z)
typeof(z)

my_vector <- runif(n=100)
my_names <- paste("Species", seq(1:length(my_vector)),sep="")
print(my_names)
names(my_vector) <- my_names
head(my_vector)
str(my_vector)

#using the rep function
rep(0.5, 6)
rep(x=0.5, times=6)

my_vec <- c(1,2,3)
# repeat a vector
rep(x= my_vec, times=2, each=2)

#sequencing vectors
seq(from= 2, to= 4)
2:4 #good shorthand

x <- seq(from=2, to=4, length=7)
#evenly spaced between values 'length' amount of times
my_vec <- 1:length(x) #common in other languages
my_vec # slow in R
seq_along(my_vec) #better in R

#generating random vectors
runif(5) #gives us 5 values from 0-1
#the parameters
runif(n=3, min=100, max=101)

set.seed(123) #takes any number and gives same progression of rng
runif(n=1, min=1, max=10)

#normal distributions
out <- rnorm(n=500, mean=100, sd=30)
hist(out)

#random sampling from existing vector

long_vec <- seq_len(10)
sample(x=long_vec, size=100, replace=T) #return sampled data points, can duplicate
sample(x=long_vec, size=10, replace=F) #remove sampled data points, no dupes

#weighted sampling from vector
weights <- c(rep(20, 5), rep(100, 5))
sample(x=long_vec, replace=T, prob=weights)

weights <- c(rep(50, 5), rep(50, 5)) #draw with equal weight
sample(x=long_vec, replace=T, prob=weights)

weights <- c(rep(10, 5), rep(90, 5)) #draw with higher weight on last 5 digits
sample(x=long_vec, replace=T, prob=weights)


z <- c(3.1, 9.2, 1.3, 0.4, 7.5)
print(z)
z[1]
z[2]
z[c(2, 3)] #using vecs to slice
z[-c(2, 3)] #negative sign excludes those values

#using logicals
z[z<3] #finds all values less than 3
z[!z, <3] #! makes statement opposite


#relational operators
#< less than
# >g than
#<= lt or et
#>= gt or et
# == equal to

#logical operators
# ! not
# & and (vector)
# | or (vector)
# xor (x,y) exclusive or

x <- 1:5
x
y <- c(1:3,7,7)
y
x == 2 #boolean output
x !=2 #not equal

x==5 & y==7 #this and that
x==1 | y==7 #this or that
x==3 | y==3
xor(x==3, y==3)

#missing values
set.seed(90)
z <- runif(10)
z
z <0.5
z[z<0.5]

which(z <0.5) #where in the vector is this argument true

zd <- c(z, NA, NA)
zd
zd[zd<0.5]

#dropping NAs with which to index
zd[which(zd<0.5)] #ignores NAs in data,
which(zd<0.5)
