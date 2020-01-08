#example use of Stan

#load stan
library("rstan")

#get data
schools_dat <- list(J = 8, 
                    y = c(28,  8, -3,  7, -1,  1, 18, 12),
                    sigma = c(15, 10, 16, 11,  9, 11, 10, 18))

#create fit with Stan
fit <- stan(file = '8schools.stan', data = schools_dat) #loading stan-file, given that it's in the current wd

#expamples of what to do with fit
print(fit) #provides a summary for the parameter of the model, as well as the log-posterior
plot(fit)
pairs(fit, pars = c("mu", "tau", "lp__"))

#extracting samples
la <- extract(fit, permuted = TRUE) # return a list of arrays 
mu <- la$mu