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
