library(tidyverse)
?gather()
long_table <- gather(demo_table3,key="Metric",value="Score",buying_price:popularity)
?spread()
wide_table <- long_table %>% spread(key="Metric",value="Score")

# 16.3.1 Introduction to ggplot2
?ggplot()
head(mpg)  

# 16.3.2 Build a bar plot in ggplot 2
# Import data set into ggplot 2
plt <- ggplot(mpg,aes(x=class))
# Plot a bar plot
plt + geom_bar()
# Bar charts documentation
?geom_bar()
# Create a summary table
mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n(), .groups = 'keep')
