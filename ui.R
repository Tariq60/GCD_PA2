# load shiny package
library(shiny)
# begin shiny UI
shinyUI(navbarPage("Shiny Project",
                   # create first tab
                   tabPanel("Documentation",
                            # load MathJax library so LaTeX can be used for math equations
                            withMathJax(), h3("Why is the Mean Estimator \\(\\bar X_n\\) divided by \\(n?\\)"),
                            # paragraph and bold text
                            p("The ", strong("unbiased estimation of the sample mean")," is calculated as follows",
                              "$$\\bar X_n \\mbox{(unbiased)} = \\frac{1}{n}\\sum_{i=1}^n X_i$$",
                              "The unbiased calculation is most often used, as it provides a ",
                              strong(em("more accurate")), " estimate of population mean"),
                            # break used to space sections
                            br(), p("To show this empirically, we simulated the following in the ",
                                    strong("Simulation Experiment"), " tab: "), br(),
                            # ordered list
                            tags$ol(
                                 tags$li("Create population by drawing observations from values 1 to 20."),
                                 tags$li("Draw a number of samples of specified size from the population"),
                                 tags$li("Plot difference between sample and true population mean"),
                                 tags$li("Show the effects of sample size vs accuracy of mean estimated")
                            )),
                   # second tab
                   tabPanel("Simulation Experiment",
                            # fluid row for space holders
                            fluidRow(
                                 # fluid columns
                                 column(4, div(style = "height: 150px")),
                                 column(4, div(style = "height: 150px")),
                                 column(4, div(style = "height: 150px"))),
                            # main content
                            fluidRow(
                                 column(12,h4("We start by generating a population of ",
                                              span(textOutput("population", inline = TRUE),
                                                   style = "color: red; font-size: 20px"),
                                              " observations from values 1 to 20:"),
                                        tags$hr(),htmlOutput("popHist"),
                                        # additional style
                                        style = "padding-left: 20px"
                                 )
                            ),
                            # absolute panel
                            absolutePanel(
                                 # position attributes
                                 top = 50, left = 0, right =0,
                                 fixed = TRUE,
                                 # panel with predefined background
                                 wellPanel(
                                      fluidRow(
                                           # sliders
                                           column(4, sliderInput("population", "Size of Population:",
                                                                 min = 100, max = 500, value = 250),
                                                  p(strong("Population Mean: "),
                                                    textOutput("popMean", inline = TRUE))),
                                           column(4, sliderInput("numSample", "Number of Samples:",
                                                                 min = 100, max = 500, value = 300),
                                                  p(strong("Sample Mean (unbiased): "),
                                                    textOutput("unbiaMean", inline = TRUE))),
                                           column(4, sliderInput("sampleSize", "Size of Samples:",
                                                                 min = 2, max = 15, value = 10))),
                                      style = "opacity: 0.92; z-index: 100;"
                                 ))
                   )
))