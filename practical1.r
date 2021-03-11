# First step 
# Assign number 2 to variable x

x <- 2      # same as x = 2 
print (x)
y <- 5
y
rm(y)       # remove variable y
y
class(x)    # Datatype of a variable 

# test to see if x is numeric
is.numeric(x)

a <- 4
class(a)
a <- 4L
class(a)    # integer type
b <- 2.8
class(b)
c <- a*b
class(c)
class(5L)
class(2L)
class(5L / 2L)


x <- "data"
x
class(x)
y <- factor('data')
y

nchar(x)
x

date1 <- as.Date('2021-03-11')
date1
class(date1)
as.numeric(date1)

# vectors
p <- c(3, 5, 6, 8)
q <- c(3, 3, 3)
r <- p + q
r

# vector arithmatic
x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
# create a vector y to contain all of x, 0, all of x
y <- c(x, 0, x)
y

z <- 2*x
z
zz <- 2*x + y + 1
zz

min(zz) # min value
max(zz) # max value

range(zz) # range of min max
mean(zz)  # mean 

sorted_z <- sort(zz)   # sort
sorted_z

seq3 <- seq(-100, 100, by=0.6)
seq3
sort(seq3)
sort(seq3, decreasing = TRUE) 


vec1 <- c("Hockey","Football","Baseball","Curling","Rugby","Hurling","Basketball","Tennis","Cricket","Lacrosse")
vec1

vec2 <- c(vec1, "Hockey","Lacrosse","Hockey","WaterPolo","Hockey","Lacrosse")
vec2

vec2_factor <- as.factor(vec2)
vec2_factor

vec3 <- c(vec2[1],vec2[3],vec2[6])
vec3
vec3 <- vec2[c(1,3,6)]
vec3
