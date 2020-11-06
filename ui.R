
################
###### UI ######
################


navbarPage("GWAS Results Analysis",
           
           
                 tabPanel("Interactive Manhattan",
                          p("Hover the mouse over a point in the plot to inspect its annotation information, such as the SNP identified and GENE name."),
                          p("A menu will appear in the upper-right corner of the graph, this allows to zoom in on a region of interest and export the image as a .png file"),
                          plotlyOutput("interactive_manhattan")
                 ),
                 
                 tabPanel("Manhattan plot",
                          
                          sidebarLayout(
                            # Wrap up all the parameter controls in a panel
                            sidebarPanel(
                              
                              # Selector for rectangular/circular Manhattan plot
                              radioButtons("manhattan_type", "Plot type", c("Rectangular Manhattan"="rect", "Circular Manhattan"="circ")),
                              
                              # Color scheme
                              selectInput("colour_scheme", "Colour scheme:",
                                          list('Grey', 'Blue', 'Blue & Orange', 'Earth', 'Rainbow')),
                              
                              # Options for rectangular Manhattan plot
                              conditionalPanel(condition = "input.manhattan_type == 'rect'",
                                               # Chromosomes to plot
                                               selectInput("chromosome", "Choose chromosome to plot:",
                                                           list("All", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 
                                                                14, 15, 16, 17, 18, 19, 20, 21, 22)),
                                               # Point size
                                               sliderInput(inputId = "point_size", 
                                                           label = "Point size",
                                                           min = 0.05, 
                                                           max = 1, 
                                                           step = 0.05,
                                                           value = 1),
                                               # Checkboxes for significance lines
                                               checkboxInput(inputId = "suggest_line",
                                                             label = "Suggestive line", 
                                                             value = TRUE),
                                               checkboxInput(inputId = "geno_line",
                                                             label = "Genome-wide significance line", 
                                                             value = TRUE),  
                                               checkboxInput(inputId = "all_snps",
                                                             label = "Annotate all significant SNPs", 
                                                             value = TRUE),
                              ),
                              
                              # Options for circular Manhattan plot
                              conditionalPanel(condition = "input.manhattan_type == 'circ'",
                                               # Inward out outward plot
                                               radioButtons("circ_type", "Type", c("Inward plot"="inw", "Outward plot"="outw"), selected='outw'),
                              ),
                              
                            ),
                            # The mainPanel is the main part of the UI on the right.
                            mainPanel(
                              # A caption will be displayed above the chart
                              h3(textOutput(outputId = "caption", container = span)),
                              
                              # The chart or plot
                              plotOutput("manhattan_plot")
                            )
                          )
                 ),
                 
                 tabPanel("QQ Plot",
                          sidebarLayout(
                            sidebarPanel("QQ Plot",
                                         checkboxInput(inputId = "qqplot_conf",
                                                       label = "Include confidence interval", 
                                                       value = FALSE),
                            ),
                            mainPanel(
                              plotOutput("qq_plot")
                            )
                          )
                 ),
                 
                 tabPanel("SNP Density",
                          sidebarLayout(
                            sidebarPanel(
                              radioButtons("plotTyp", "Plot type", c("SNP density"="p"))
                            ),
                            mainPanel(
                              plotOutput("snp_density")
                            )
                          )
                 )
)