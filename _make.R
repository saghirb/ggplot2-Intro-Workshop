## Run all files to prepare "Introduction to ggplot2" workshop

# Use all but one available cores
useNcpus = max(1, parallel::detectCores()-1)
options(Ncpus=useNcpus)

# Start timing
library(tictoc)
tic()

# Setup
library(here)
here()

# Copy the Gapminder data to the exercises folder
file.copy(here("data", "gapminder.csv"),
          here("Exercises", "data", "gapminder.csv"), overwrite = TRUE)

# Render the presentation, Base R exercises and data.table exercises & solutions
rmarkdown::render(here("Presentation", "ggplot2-Intro.Rmd"),
                  clean = TRUE,
                  output_dir = here("Presentation"))

rmarkdown::render(here("Exercises", "ggplot2-Exercises.Rmd"),
                  clean = TRUE,
                  output_dir = here("Exercises"))

rmarkdown::render(here("Exercises", "ggplot2-Solutions.Rmd"),
                  clean = TRUE,
                  params = list(
                    echoCode = FALSE,
                    mainTitle = "`ggplot2` Solutions (without Code): Gapminder Data"),
                  output_dir = here("Exercises"),
                  output_file = "ggplot2-Solutions_Without_Code.html")

rmarkdown::render(here("Exercises", "ggplot2-Solutions.Rmd"),
                  clean = TRUE,
                  params = list(
                    echoCode = TRUE,
                    mainTitle = "`ggplot2` Solutions: Gapminder Data"),
                  output_dir = here("Exercises"),
                  output_file = "ggplot2-Solutions_With_Code.html")

# Create a PDF version of the slides to share
# Using xaringan::decktape() function (see help page)
## Make sure that phantom.js is installed (e.g. webshot::install_phantomjs())
# library(webshot)
htmlSlides <- paste0("file://",
                    normalizePath(here("Presentation", "ggplot2-Intro.html")))
# webshot(htmlSlides, here("Presentation", "ggplot2-Intro.pdf"), delay = 10,
#         vwidth = 960, vheight = 540, zoom = 1.0, cliprect = "viewport")

xaringan::decktape(file = htmlSlides,
                   output = here("Presentation", "ggplot2-Intro.pdf"),
                   docker = TRUE)

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

file.copy(here("Presentation", "ggplot2-Intro.pdf"),
          here("Share", "Slides-Notes"), overwrite = TRUE)

file.copy(here("Exercises", "ggplot2-Exercises.Rmd"),
          here("Share", "Exercises"), overwrite = TRUE)

file.copy(here("Exercises", "ggplot2-Solutions_Without_Code.html"),
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
zip(here("Share", "ggplot2-Intro.zip"), ".",
    extras = "-FS")

setwd(here("Exercises"))
zip(here("Share", "ggplot2-Solutions.zip"),
    c("ggplot2-Solutions.Rmd", "ggplot2-Solutions_With_Code.html"),
    extras = "-FS")
setwd(here())

# Total run time.
toc()
