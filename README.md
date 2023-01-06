# MechaCar_Statistical_Analysis
Use statistics and R to visualize datasets of a new car company and compare it to existing companies. 

## Linear Regression to Predict MPG
* Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?
In my analysis I found that the **vehicle length** and **ground clearence** variables provided a non-random amount of variance![1 1](https://user-images.githubusercontent.com/112291075/210944738-a9eea4cc-1d52-4c7f-b52c-975f20126bb6.jpg)

* Is the slope of the linear model considered to be zero? Why or why not?
While the coefficients are really close to zero, especially **vehicle weight** at .001, the slope is not 0

* Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?
While the correlation of R squared in my data set is strong at 0.7149, it is not the only variable that should be taken into account when determining MPG in the real world with a real car and a real person behind the wheel. 
![1 3](https://user-images.githubusercontent.com/112291075/210945883-3dbb2741-0782-48b3-9273-bd0a2bde0dff.PNG)

## Summary Statistics on Suspension Coils
* The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?

Here is the variance of all the individual lots:

![2 1](https://user-images.githubusercontent.com/112291075/210946697-3dd0f123-7e97-4e54-8820-d37a7202423a.PNG)

As well as the the mean of all 3 lots combined

![2 2](https://user-images.githubusercontent.com/112291075/210947843-3a222d55-ae07-4bc5-8bcc-9edc5c2a6ab4.PNG)

The standard variance does stay under 100 psi just as intended, but the individual lot 3 is over 100 PSI, so that will have to be addressed.

## T-Tests on Suspension Coils

## Study Design: MechaCar vs Competition
1. I propose that these following metrics require further testing to accurately compare MegaCar and its competitors:
    * Horsepower
    * Crash safety ratings 

2. A near perfect null hypothesis is one where either horsepower or the crash safety ratings are at 0. An alternate hypothesis is where any of those categories are not 0

3. A good test to challenge this hypothesis would be a multiple linear regression statistical summary.

4. The data for this study would be conducted with a random sample of MechaCars and its competitors of about x > 25
