
library(tidyverse)

# Exercises 9.2.1

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(colour = "pink", shape = 17)

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy), color = "blue")

?geom_point

# Chapter 10

as_tibble(iris)

# Tibble recycles inputs from above and applies functions.

tibble(
  x = 1:5, 
  y = 1, 
  z = x ^ 2 + y
)

# it is possible for a tibble to have non static names

tb <- tibble(
  `:)` = "smile", 
  ` ` = "space",
  `2000` = "number"
)
tb

# creating a transposed tibble (tribble - transposed tibble), (headings start with ~)

tribble(
  ~x, ~y, ~z,
  #--|--|----
  "a", 2, 3.6,
  "b", 1, 8.5
)


#Printing tibbles
tibble(
  a = lubridate::now() + runif(1e3) * 86400,
  b = lubridate::today() + runif(1e3) * 30,
  c = 1:1e3,
  d = runif(1e3),
  e = sample(letters, 1e3, replace = TRUE)
)

# you can specify how far you want to print

nycflights13::flights %>% 
  print(n = 10, width = Inf)

# Subsetting
df <- tibble(
  x = runif(5),
  y = rnorm(5)
)

# Extraction
df$x
df[["x"]]

# Chapter 11

heights <- read_csv("data/heights.csv") # assumes I have this data, lol 

# Skipping data you are importing

read_csv("The first line of metadata
  The second line of metadata
  x,y,z
  1,2,3", skip = 2)

# skip = n skips the first n lines


read_csv("1,2,3\n4,5,6", col_names = c("x", "y", "z"))

# importing numbers from strings
parse_number("It cost $123.45")

# Dates and time
parse_datetime("2010-10-01T2213")

