#Homework 5
#matricies, lists, and data frames
######

#Q1
n_dims <- sample(3:10, size=1,)
n_dims
v <- 1:n_dims^2
v
sample(v)
m<-matrix(v, nrow=3, ncol=3)
print(m)
t(m) #transposes the matrix
print(m) #the matrix has been flipped. Wowzah!
c(sum(m[1,]), mean(m[1,]), sum(m[3,]), mean(m[3,]))
eigen(m, only.values=FALSE)

#these numbers are integers and often very small
typeof(m)
typeof(m["$values"])
typeof(m["$vectors"])


#Q2
#dumb and stupid way to do it
x <- runif(16)
x
my_matrix<-matrix(x, nrow=4, ncol=4)
print(my_matrix)
n<- 1:1000
n
v<-sample(n, 100)
v
isEven <- v%%2 == 0
isEven

#efficient way with inequality
my_matrix<- matrix(1:16, nrow=4, ncol=4)
my_logical <- 1:100
my_logical<50

my_letters<-letters
sample(my_letters)

my_list <- list(my_matrix[2,2], my_logical[2],my_letters[2])
my_list
typeof(my_list[[1]])
typeof(my_list[[2]])
typeof(my_list[[3]])

new_list <- c(my_matrix[2,2], my_logical[2],my_letters[2])
new_list
typeof(new_list)



#Q3
my_units <- runif(26, min=0, max=10)
my_letters <- sample(LETTERS)
df <- data.frame(my_units, my_letters)
df

to_replace <- sample(1:nrow(df), 4, replace = FALSE)
df$my_units[to_replace] <- NA
df


which(!complete.cases(df))

orderedDF <- df[order(df[, 2]), ]
orderedDF

mean(my_units)
