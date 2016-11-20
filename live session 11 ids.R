#live session assignment 11
# brian kruse
# section 404
# Novmeber XX, 2016

#Live Session Unit 11 Assignment

#Due:  November 24, 2016 (Thursday)

#1)	Go through the electric equipment example. 

#More examples of forecasting!
 #   Code to load data:
    library(fpp) #fpp package must be installed first
data(ukcars)
v <- ukcars
v
#a)	Plot the time series. Can you identify seasonal fluctuations and/or a trend? 


plot(v)

# graphical interpretation note there is an upward trend since 1980


#b)	Use a classical decomposition to calculate the trend-cycle and seasonal indices. 

fitd <- decompose(v) 
plot(fitd)

#c)	Do the results support the graphical interpretation from part (a)? 
#yes it does because we start with a downward tred and go up on the first two parts
# third one is a perfectly seasonally adjusted trend
# the fourth one identifies random walk 


#d)	Compute and plot the seasonally adjusted data. 
eeadj <- seasadj(fitd)
plot(eeadj)
library(tseries)
#e)	Change one observation to be an outlier (e.g., add 500 to one observation), 
#and recompute the seasonally adjusted data. What is the effect of the outlier? 
v2 <- ts(c(v[1:54],
                   v[55]+500,v[56:113] ),
                 start=c(1977,1),frequency=4)
plot(v2)


fitdv <- decompose(v2) 
plot(fitdv)
#f)	Does it make any difference if the outlier is near the end rather than in the middle of the time series? 
#yes it makes a difference during decomposition
#the trend flattens out on first display and last display


#g)	Use STL to decompose the series. 

v2.stl = stl(v2, s.window="periodic")

plot(v2.stl)

#Deliverable is a link to R Markdown file on GitHub.



