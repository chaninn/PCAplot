# PCAplot
A web tool for generating PCA plot in R

## Prerequisites

Before beginning, please make sure to install the following R packages: *shiny*, *shinyjs* and *shinythemes*, which can be performed by typing the following commands into an R environment:

```
install.packages(c('shiny','shinyjs','shinythemes'))
```

## Launching the application
To launch the application on your own computer, in an R environment, type the following:

```
shiny::runGitHub('PCAplot','chaninn')
```
In a few moments, the application should launch from your web browser.

To use the application:

1. Upload your input files (scores data and loadings data)
2. Wait until you see a message in the Output text box
3. Click on the **Download** button to download the output PDF file
