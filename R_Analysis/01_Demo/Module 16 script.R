library(tidyverse)
library(dplyr)
?gather()
long_table <- gather(demo_table3,key="Metric",value="Score",buying_price:popularity)
?spread()
wide_table <- long_table %>% spread(key="Metric",value="Score")

# 16.3.1 Introduction to ggplot2

# Make sure to import the tidyverse library to enable ggplot
?ggplot()
head(mpg)  

# 16.3.2 Build a bar plot in ggplot 2

# Bar charts documentation
?geom_bar()

# Create a summary table
mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n(), .groups = 'keep')

# import data set into ggplot2
plt <- ggplot(mpg_summary,aes(x=manufacturer,y=Vehicle_Count)) 

# plot a bar plot
plt + geom_col() 

# 16.3.3 Add formatting functions

#plot bar plot with labels
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") 

#rotate the x-axis label 45 degrees
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") + theme(axis.text.x=element_text(angle=45,hjust=1))

# 16.3.4 Build a line plot in ggplot2

#create summary table
mpg_summary <- subset(mpg,manufacturer=="toyota") %>% group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')

#import data set into ggplot2
plt <- ggplot(mpg_summary,aes(x=cyl,y=Mean_Hwy))

# Generate line plot using geom_line()
plt + geom_line()

#add line plot with labels
  # Ignore the warning about continuous limits
plt + geom_line() + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks = c(16:30))

# import data set into ggplot2
plt <- ggplot(mpg,aes(x=displ,y=cty))

#add scatter plot with labels
plt + geom_point() + xlab("Engine Size (L)") + ylab("City Fuel-Efficiency (MPG)")

#add scatter plot with labels
  # This adds vehicle classes and gives them an individual color
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class))
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class")

#add scatter plot with multiple aesthetics
  # This adds type of drive-train and their own individual shapes
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class,shape=drv))
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class",shape="Type of Drive")

# 16.3.4 Skill drill 1/1
  # Skipped

# 16.3.5 Create advanced box plots in ggplot2

# Generate a box plot to visualize the highway fuel efficiency of our mpg data set
# Import data set into ggplot2
plt <- ggplot(mpg,aes(y=hwy))
# Add box plot
plt + geom_boxplot()

# Create a set of box plots that compares highway fuel efficiency for each car manufacturer
# import data set into ggplot2
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy))
# add box plot and rotate x-axis labels 45 degrees
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1))

# 16.3.5 Skill drill 1/1
  # Skipped

# 16.3.6 Create heat map plots

#create summary table
mpg_summary <- mpg %>% group_by(class,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')
plt <- ggplot(mpg_summary, aes(x=class,y=factor(year),fill=Mean_Hwy))

#create heat map with labels
plt + geom_tile() + labs(x="Vehicle Class",y="Vehicle Year",fill="Mean Highway (MPG)")

# look at the difference in average highway fuel efficiency across each vehicle model from 1999 to 2008
#create summary table
mpg_summary <- mpg %>% group_by(model,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')
#import data set into ggplot2
plt <- ggplot(mpg_summary, aes(x=model,y=factor(year),fill=Mean_Hwy))
# Add heat map with labels
  # Rotate x-axis labels 90 degrees with '+ theme'
plt + geom_tile() + labs(x="Model",y="Vehicle Year",fill="Mean Highway (MPG)") + theme(axis.text.x = element_text(angle=90,hjust=1,vjust=.5))

# 16.3.7 Add layers to plots

#import data set into ggplot2
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy))
#add box plot
  #rotate x-axis labels 45 degrees
    #overlay scatter plot on top
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) + geom_point()

#create summary table
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ), .groups = 'keep')
#import data set into ggplot2
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine))
#add scatter plot
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size")

# Layer the upper and lower standard deviation boundaries to our visualization using the geom_errorbar() function
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ),SD_Engine=sd(displ), .groups = 'keep')
#import data set into ggplot2
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine))
#add scatter plot with labels
  #overlay with error bars
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") + geom_errorbar(aes(ymin=Mean_Engine-SD_Engine,ymax=Mean_Engine+SD_Engine))

#convert to long format
mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy))
head(mpg_long)

# Visualize the different vehicle fuel efficiency ratings by manufacturer
#import data set into ggplot2
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type))
#add box plot with labels rotated 45 degrees
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1))

?facet_wrap()
# facet our previous example by the fuel-efficiency type
#import data set into ggplot2
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type))
#create multiple box plots, one for each MPG type
  #rotate x-axis labels
plt + geom_boxplot() + facet_wrap(vars(MPG_Type)) + theme(axis.text.x=element_text(angle=45,hjust=1),legend.position = "none") + xlab("Manufacturer")

# 16.4.4 Test for normality

# Visualize distribution using density plot
ggplot(mtcars,aes(x=wt)) + geom_density()

?shapiro.test()
shapiro.test(mtcars$wt)

# 16.6.1 Sample versus population
?sample_n()

# Visualize the distribution of driven miles for our entire population data set

#import used car data set
setwd("C:/Users/Marco/Desktop/Boot_Camp/Module 16/MechaCar_Statistical_Analysis/R_Analysis/01_Demo")
population_table <- read.csv('used_car_data.csv',check.names = F,stringsAsFactors = F)

#import data set into ggplot2
plt <- ggplot(population_table,aes(x=log10(Miles_Driven)))

#visualize distribution using density plot
plt + geom_density()

#randomly sample 50 data points
sample_table <- population_table %>% sample_n(50)

#import data set into ggplot2
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven)))

#visualize distribution using density plot
plt + geom_density()

# 16.6.2 Use the One-Sample t-Test

?t.test()

#compare sample versus population means
t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven)))

# 16.6.3 Use the Two-Sample t-Test

#generate 50 randomly sampled data points
sample_table <- population_table %>% sample_n(50)

#generate another 50 randomly sampled data points
sample_table2 <- population_table %>% sample_n(50)

#compare means of two samples
t.test(log10(sample_table$Miles_Driven),log10(sample_table2$Miles_Driven))

# 16.6.4 Use the Two-Sample t-Test to Compare Samples

#import dataset
mpg_data <- read.csv('mpg_modified.csv')

# select only data points where the year is 1999
mpg_1999 <- mpg_data %>% filter(year==1999)

#select only data points where the year is 2008
mpg_2008 <- mpg_data %>% filter(year==2008)

# compare the mean difference between two samples
t.test(mpg_1999$hwy,mpg_2008$hwy,paired = T)

# 16.6.5 Use the ANOVA Test

?aov()

# Filter columns from mtcars data set
mtcars_filt <- mtcars[,c("hp","cyl")]

# Convert numeric column to factor
mtcars_filt$cyl <- factor(mtcars_filt$cyl)

# Compare means across multiple levels
aov(hp ~ cyl,data=mtcars_filt)

summary(aov(hp ~ cyl,data=mtcars_filt))

# 16.7.1 The Correlation Conundrum
?cor()
head(mtcars)

#import data set into ggplot2
plt <- ggplot(mtcars,aes(x=hp,y=qsec))

#create scatter plot
plt + geom_point()

#calculate correlation coefficient
cor(mtcars$hp,mtcars$qsec)

# Read in data set
used_cars <- read.csv('used_car_data.csv',stringsAsFactors = F)

head(used_cars)

# Import data set into ggplot2
plt <- ggplot(used_cars,aes(x=Miles_Driven,y=Selling_Price))

# Create a scatter plot
plt + geom_point()

# Calculate correlation coefficient
cor(used_cars$Miles_Driven,used_cars$Selling_Price)

# convert data frame into numeric matrix
used_matrix <- as.matrix(used_cars[,c("Selling_Price","Present_Price","Miles_Driven")])
cor(used_matrix)

# 16.7.2 Return to Linear Regression
?lm()

#create linear model
lm(qsec ~ hp,mtcars)

#summarize linear model
summary(lm(qsec~hp,mtcars))

#create linear model
model <- lm(qsec ~ hp,mtcars)

#determine y-axis values from linear model
yvals <- model$coefficients['hp']*mtcars$hp + model$coefficients['(Intercept)']

#import dataset into ggplot2
plt <- ggplot(mtcars,aes(x=hp,y=qsec))

#plot scatter and linear model
plt + geom_point() + geom_line(aes(y=yvals), color = "red")

# 16.7.3 Perform Multiple Linear Regression

#generate multiple linear regression model
lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars)

#generate summary statistics
summary(lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars))

# 16.8.1 Category Complexities
?chisq.test()

#generate contingency table
table(mpg$class,mpg$year)

#generate contingency table
tbl <- table(mpg$class,mpg$year)

#compare categorical distributions
chisq.test(tbl)

# 16.9.1 Practice A/B Testing
