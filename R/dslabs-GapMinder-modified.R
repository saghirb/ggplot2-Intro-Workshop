# Gapminder data
# Create a modified version of the Gapminder data from the dslabs package.

library(dslabs)
library(data.table)
library(here)

# Get the dslabs version of the gapminder data
gmOrig <- as.data.table(dslabs::gapminder)

setnames(gmOrig, c("infant_mortality", "life_expectancy", "population"),
         c("infmort", "lifeexp", "pop"))

# Remove region as we won't be using it, keep 5 year data and reorder variables.
gm <- gmOrig[, gdpPercap:=gdp/pop][
  year %% 5 == 0, c("continent", "country", "year", "pop", "gdpPercap",
                               "lifeexp", "infmort", "fertility")][
             order(country, year)]

# Write the data to a CSV file
fwrite(gm, file = here("data", "gapminder.csv"))
