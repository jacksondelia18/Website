#Functions
####################################
#what is programming?

# functional v object oriented programming
#chunk v dynamic

#Functional programming \/
#anatomy of a function
func <- function(x,y){} #user defining own function
#local v global variables. minimize global vars. vars inside a function 
# only exist within the function
{return(out)}
z<-func(x=2, y=3)
#power of quick repitition using function blocks


######
#User defined functions demo
sum(3,2) #function
3+2 #operator
`+`(3,2)
y<-3
`<-`(yy, 5)

print(read.table) #source code of a built-in function

#creating a function
#start function called adder_subtractor
###########################################################
adder_subtractor <- function(x=1, y=2, z=TRUE){
  #Name: FunctionName
  #Operation: does some random math depending on value of z
  #inputs: 3 inputs: 
    #x (numeric scalar value, default=1. one of numbers to be operated on)
    #y (numeric scalar value, default=2. one of numbers to be operated on)
    #z (logical, default = T. A switch to decide on subtraction or addition)
  #outputs: numeric value resulting from addition or subtraction

  if(z==TRUE){
    out <- x+y
  }else{
    out <- x-y
  }
#out could be two things, depending on if/else statement
  
  return(out)

}
##########################################
#end of adder_subtractor

adder_subtractor(x=7, y=4, z=FALSE)





##########################################
#START OF FUNCTION
hardy_weinberg <- function(p = runif(1)){
##########################################
  #Hardy weinberg my beloved
  #FUNCTION: H_W
  #operation: runs hardy-weinberg equilibrium problem
  #inputs = p: allele frequecny of dom allele
  #output = q: (rec allele): the frequencies of the three genotypes (fAA, fAB, fBB)
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2

  #store data for output
  out_vec <- signif(c(p = p, AA = fAA, BB = fBB, AB = fAB), digits = 3)

  return(out_vec) #return those values
  
}


##########################################

hardy_weinberg(p=0.3)

x <- 5
x


#global v local parameters
my_function <- function(a=3, b=4){
  z<- a+b
  return(z)


}

my_function()


my_bad_function <- function(a=3){
  b=8
  z<- a+b
  return(z)
}
my_bad_function()
#########################
#variable delcared globally but referenced locally can cause issues



#passing global variables properly

a <-32
b <- 4
func <- function(first, second){
  z<- first + second
  return(z)


}
func(first=a, second=b)


#errors and warnings in function


##########################################
#START OF FUNCTION
hardy_weinberg <- function(p = runif(1)){
##########################################
  #Hardy weinberg my beloved
  #FUNCTION: H_W
  #operation: runs hardy-weinberg equilibrium problem
  #inputs = p: allele frequecny of dom allele
  #output = q: (rec allele): the frequencies of the three genotypes (fAA, fAB, fBB)
  if(p>1 | p<0){
    return("function failure. p must be greater than zero and less than 1!")

  }
#control structure stops function if p value is nonsensical
#and returns custom error message

  
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2

  #store data for output
  out_vec <- signif(c(p = p, AA = fAA, BB = fBB, AB = fAB), digits = 3)

  return(out_vec) #return those values
  
}


##########################################

hardy_weinberg(03)


#using STOP 
##########################################
#START OF FUNCTION
hardy_weinberg <- function(p = runif(1)){
##########################################
  #Hardy weinberg my beloved
  #FUNCTION: H_W
  #operation: runs hardy-weinberg equilibrium problem
  #inputs = p: allele frequecny of dom allele
  #output = q: (rec allele): the frequencies of the three genotypes (fAA, fAB, fBB)
  if(p>1 | p<0){
    stop("function failure. p must be greater than zero and less than 1!")

  }
#control structure stops function if p value is nonsensical
#and returns custom error message

  
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2

  #store data for output
  out_vec <- signif(c(p = p, AA = fAA, BB = fBB, AB = fAB), digits = 3)

  return(out_vec) #return those values
  
}


##########################################
hardy_weinberg(4) #returns error message
hardy_weinberg(0.4) # correct function



#regression function


##########################################
#START OF FUNCTION
#function fit_linear
#intent: fits a simple linear regression
#inputs: numeric vector of predictors x and response y
#output: slope and p value

fit_linear<- function(x = runif(20), y=runif(20)){

  my_mod <- lm(y~x)
  my_out <- c(slope=summary(my_mod)$coefficients[2,1], 
  p_value=summary(my_mod)$coefficients[2,4])

  #plot the output
  plot(x=x, y=y)
  return(my_out)


}
#END OF FUNCTION
##########################################


var1<- 1:20
var2<- 21:40

fit_linear(x = var1, y=var2)



##########################################
#START OF FUNCTION
#function fit_linear
#intent: fits a simple linear regression
#inputs: numeric vector of predictors x and response y
#output: slope and p value

fit_linear<- function(p=NULL){

if(is.null(p)){
  p <- list(x=runif(20), y= runif(20))
}

  my_mod <- lm(p$x~p$y) #fits the model


  my_out <- c(slope=summary(my_mod)$coefficients[2,1], 
  p_value=summary(my_mod)$coefficients[2,4])

  plot(x=p$x, y=p$y)
  return(my_out)
}
fit_linear()


my_parms <- list(x =1:10, y= sort(runif(10)))
my_parms


fit_linear(p=my_parms)
