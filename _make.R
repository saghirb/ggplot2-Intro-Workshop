## Run all files to prepare "Getting Started in R and data.table" workshop

# Setup
library(here)
here()

# Render the presentation, Base R exercises and data.table exercises & solutions
rmarkdown::render(here("Presentation", "ggplot2-Intro.Rmd"),
                  clean = TRUE, output_dir = here("Presentation"))


# rmarkdown::render(here("Exercises", "World-Popn", "World-Population-Solutions.Rmd"),
#                   clean = TRUE, output_dir = here("Exercises", "World-Popn"))

# Create zip files to share with participants
# First empty the share folder and recreate the directory structure.
unlink(here("Share/"), recursive = TRUE)
dir.create(here("Share"))
dir.create(here("Share", "Slides-Notes"))
dir.create(here("Share", "Exercises"))
dir.create(here("Share", "Exercises", "data"))

# Populate the Share directories
file.copy(here("Presentation", "ggplot2-Intro.html"),
          here("Share", "Slides-Notes"), overwrite = TRUE)

file.copy(here("Exercises", "ggplot2-Intro-Exercises.Rmd"),
          here("Share", "Exercises"), overwrite = TRUE)

file.copy(here("Exercises", "data", "gapminder.csv"),
          here("Share", "Exercises", "data"), overwrite = TRUE)

# Creating (initialising) an RStudio project
rstudioapi::initializeProject(path = here("Share", "Exercises"))
file.rename(here("Share", "Exercises", "Exercises.Rproj"),
            here("Share", "Exercises", "ggplot2-Exercises.Rproj"))

# Using here() function with zip results in full paths in the zip files :(
# Not beautiful: Using setwd to overcome the full paths issue above.
setwd(here("Share"))
zip(here("Share", "ggplot2-Intro.zip"), ".", extras = "-FS")
setwd(here())

