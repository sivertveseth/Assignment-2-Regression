# laste inn nødvendig data
library(readxl)

dat <- read_excel ("resultat_dna_analyse-xlsx")

## lage dataramme for å finne avstand og molekylærvekt

ladder <- data.frame(dist = c(36, 59.5, 86.5,
                              119.5, 159.5, 208.5,
                              269.5, 351.5, 396.5,
                              455.5, 521.5, 599.5, 701.5),
                     mw = c(1000, 900, 800, 
                            700, 600, 500, 
                            400, 300, 250, 
                            200, 150, 100, 50))

## lage ny dataramme med ukjente variabler

unknown <- data.frame(dist = c(258.5, 262.5, 265.5, 335.5))

## lage en kalibreringsmodell ved hjelp av stigen

library(tidyverse)

ggplot(data = data.frame(x = c(36, 59.5, 86.5,
                               119.5, 159.5, 208.5,
                               269.5, 351.5, 396.5,
                               455.5, 521.5, 599.5, 701.5), 
                         y = c(1000, 900, 800, 
                               700, 600, 500, 
                               400, 300, 250, 
                               200, 150, 100, 50)), 
       aes(x, y)) + geom_point() +
  
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), 
              color = "green", se = FALSE)

scale_y_continuous(limits = c(0, 1000)) +
  
  scale_x_continuous(limits = c(0, 750))
  

## Fit the model

cal <- lm(log(mw) ~ dist, data = ladder)

## Check model performance, r^2 should be ~ 1.

summary(cal)

