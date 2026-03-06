#Title: HW3
#### Q1


# Suppose x = 1.1, a = 2.2, and b = 3.3. Assign each expression to the value of the variable z and print the value stored in z.

x <- 1.1
a <- 2.2
b <- 3.3


### a)
z <- x^a^b
print (z)

### b)
w<- (x^a)^b
print(w)


### c)
q <- 3*x^3 + 2*x^2 + 1
print(q)

# I have elected to print a different variable for each of the equations, z, w, and q 
# rather than z three different times


####Q2


#Using the rep and seq functions, create the following vectors:
vectorA <- c(1, 2, 3, 4, 5, 6, 7, 8)
endA <- rev(vectorA)
c(vectorA, endA)

x <- seq(from= 1, to= 8)
x
z <- seq( from= 7, to= 1)
z
c(x, z) #listing things with c





#b
vectorB <- c(1, 2, 3, 4, 5)
print(vectorB)
repeated_vector <- rep(vectorB, times = vectorB)
repeated_vector 


#c
vectorC <- rev(vectorB)
vectorC
reversed_vector <- rep(vectorC, times = vectorB)
reversed_vector


###Q3
set.seed(10)
vectorD <- runif(2, min=1, max=10,)
vectorD
y <- vectorD[1]
y
x <- vectorD[2]
x
theta <- atan2(y, x)


r <- sqrt(x^2 + y^2)
r


pcor <- c(r, theta)
pcor



###Q4
que <- c("sheep", "fox", "owl", "ant")
que
a <- c(que, "serpent")
a 
# adds serpent to the end


b <- a[-1]
b
#removes the first position animal

c <- c("donkey", b)
c
# add donkey to the fron of the line

d <- c[-5]
d
#removes 5th position animal

e <- d[-3]
e
#removes 3rd position animal

f <- e[c(1, 2)]
f2 <- e[c(3)]
f2
g <- c( f, "aphid", f2)
#splits the vector into f and f2 so I can add aphid in the middle

which(g == "aphid")
#asks at which position aphid is listed in spliced vector



###Q5
x <- (1:100) #assigns my vector
x


y <- x[!x%%2==0]
y #removes all div/2


p <- y[!y%%3==0]
p #reomves all div/3


q <- p[!p%%7==0]
q #removes all div/7

#q is final vector

final <- q
final

