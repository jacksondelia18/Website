#This #homework assignment focus on data manipulation in R. Complete these problems using the dplyr and tidyverse packages.
#Examine the structure of the iris data set. How many observations and variables are in the data set?

data(iris)
class(iris)
glimpse(iris)
#150 rows, 5 columns including spela length, speal width, petal length, petal width, and species


#Q2
iris1 <- filter(iris, Species=="virginica" | Species=="versicolor")%>%
  filter(Sepal.Length > 6.00 & Sepal.Width > 2.50)
glimpse(iris1)
#there are 56 observations and 5 variables when filtering for these parameters


#Q3
iris2 <- select(iris1, Species, Sepal.Length, Sepal.Width)
iris2
glimpse(iris2)
#there are 56 observations and 3 variables when selecting for these paramters


#Q4
iris3 <- arrange(iris2, by=desc(Sepal.Length))
head(iris3, 6)


#Q5
iris4 <- mutate(iris3, Sepal.Area=Sepal.Length*Sepal.Width)
iris4
glimpse(iris4)
#there are 56 observations and 4 variables when creating a new column this way


#Q6
iris5<- summarize(iris4, Avg.Sepal.Length=mean(Sepal.Length), Avg.Sepal.Width=mean(Sepal.Width), Sample.Size=n())
iris5


#Q7
iris6 <- iris4%>%
  group_by(Species)%>%
  summarize(Avg.Sepal.Length=mean(Sepal.Length), Avg.Sepal.Width=mean(Sepal.Width))
iris6


#Q8
irisFinal <- iris%>%
filter(Species=="virginica" | Species=="versicolor")%>%
  filter(Sepal.Length > 6.00 & Sepal.Width > 2.50) %>%
    select(Species, Sepal.Length, Sepal.Width)%>%
      arrange(by=desc(Sepal.Length))%>%
        mutate(Sepal.Area=Sepal.Length*Sepal.Width)%>%
                group_by(Species)%>%
                 summarize(Avg.Sepal.Length=mean(Sepal.Length), Avg.Sepal.Width=mean(Sepal.Width))


#Q9
iris_longer <- iris%>%
  pivot_longer(cols= Sepal.Length:Petal.Width, names_to = "Measure", values_to = "Value")
iris_longer
