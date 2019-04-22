# Workshop - Introduction to `ggplot2`

This approximately three hour workshop gives an introduction the
[`ggplot2`](https://ggplot2.tidyverse.org/) package for newcomers to the 
[R](https://www.r-project.org/). Participants are immediately taught to work with R 
markdown so that it becomes a natural part of their workflow.

## Target Audience

This is a beginner level course aimed at anyone who works with data and has at least 
some basic knowledge of R, e.g., see:

- [Getting Started in R](https://ilustat.com/shared/Getting-Started-in-R.pdf)

## Running the Workshop 

- Use the workshop presentation (HTML):
    + https://github.com/saghirb/ggplot2-Intro-Workshop/tree/master/Presentation
- Share the following zip file with the participants:
    + [ggplot2-Intro.zip](https://github.com/saghirb/ggplot2-Intro-Workshop/blob/master/Share/ggplot2-Intro.zip)
    + Ask them to unzip it
    
## Presentation and Exercises

The presentation is in three part with three accompanying sets of exercises as follows:

- Exercise 1: Portugal
- Exercise 2: Europe
- Exercise 3: Gapminder plot

Start by presenting the basic `ggplot2` concepts using the HTML presentation referenced 
above. Before the participants start the first exercise show them how to use R markdown 
and go through the first part of "Exercise 1" with them, step by step.

When you get to each of the exercises in the presentation:

- Ask the participant to double click on `Exercises/ggplot2-Exercises.Rproj` from 
  the unzipped location to open  Rstudio with the right setup.
- Participants should then work through `Exercises/ggplot2-Exercises.Rmd`.
- Start by knitting[^zipproblem] the `Rmd` document.
    + As the start of the first Exercise ask the participants to change the name to 
    their name and knit again. This usually makes them smile.
  
**During the exercises strongly encourage participants to discuss and work together in pairs.**
  
## At the End of the Course

- Share the solutions to the exercises (zip file)
    + https://github.com/saghirb/ggplot2-Intro-Workshop/raw/master/Share/ggplot2-Solutions.zip

# Re-creating the Workshop Materials.

Run the [_make.R](https://github.com/saghirb/ggplot2-Intro-Workshop/blob/master/_make.R) 
script in the R console.

## Why `ggplot2`?

It produces elegant graphics by design. It is very flexible mean that you can customise your
plots or add new features to the `ggplot2`[^ggplot2ext] ecosystem.

`ggplot2` is an essential must have package your R tool kit. Be brave give it a go :)

For more information see [https://ggplot2.tidyverse.org/](https://ggplot2.tidyverse.org/)

## Workshops

First presented as part of a [Data Science Unplugged](https://dsup.org/) meetup:
 
- https://www.meetup.com/Data-Science-Unplugged/events/260241067/

## ## Annoucements

A reminder of annoucements for this repository.

- List here! 

## Acknowledgements - `ggplot2`

Thanks to [Hadley Wickham](https://github.com/hadley) (author and maintainer) and his
co-authors Winston Chang, Lionel Henry, Thomas Lin Pedersen, Kohske Takahashi, 
Claus Wilke, Kara Woo and RStudio for this great package. For a full list of
contributors to the `ggplot2` package see https://github.com/tidyverse/ggplot2/graphs/contributors.



[^zipproblem:] Some participants might open the `Exercises/ggplot2-Exercises.Rproj` 
from within the zip archive which will lead to issues when knitting the 
`Exercises/ggplot2-Exercises.Rmd`. Double check that they unzipped the file first and opened
`Exercises/ggplot2-Exercises.Rproj` from the unzipped location.
[^ggplot2ext:] To see the community contributions to the `ggplot2` ecosystem visit
https://www.ggplot2-exts.org/gallery/
[^ggplot2Authors] For the most up to date list of authors see
https://ggplot2.tidyverse.org/authors.html
