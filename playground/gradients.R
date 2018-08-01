## Clean environment
rm(list = ls())

## Load dependencies
library(numDeriv)
library(plotly)

## Input functions
f_scalar <- function(x) {x[1]^2 - x[2]^2}

f_vector <- function(x) {
  c(
    x[1]^2 - x[2]^2,
    cos(x[1])
  )
}

## Compute gradient of a scalar function
g <- grad(f_scalar, c(1,2))
print(g)

## Compute jacobian of a vector function
j <- jacobian(f_vector, c(1,2))
print(j)

## Plot a surface
xs <- seq(from=-1, to=1, by=0.05)
ys <- seq(from=-1, to=1.1, by=0.05)

zs <- matrix(NaN, length(xs), length(ys))
for(i in 1:length(xs)) {
  for(j in 1:length(ys)) {
   zs[i,j] <- f_scalar(c(xs[i],ys[j]))
  }
}

p <- plot_ly(x = xs, y = ys, z = zs) %>% add_surface()
print(p)
