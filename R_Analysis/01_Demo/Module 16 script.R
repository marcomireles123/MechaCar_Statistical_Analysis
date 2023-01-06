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

