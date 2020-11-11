
################
###### UI ######
################


navbarPage("GWAS Results Analysis",
           
           
                 tabPanel("Interactive Manhattan Plot",
                          sidebarLayout(
                            
                            sidebarPanel(
                              selectInput("color", "Choose colour scheme:",
                                          list('Grey', 'Blue', 'Blue & Orange', 'Earth', 'Rainbow'),
                                          selected = 'Rainbow'),
                              selectizeInput("chr", 'Choose the chromosomes you want to plot:',
                                             choices = 1:22,
                                             multiple = TRUE),
                              sliderInput(inputId = "point", 
                                          label = "select Point size",
                                          min = 1, 
                                          max = 10, 
                                          step = 0.05,
                                          value = 5),
                              checkboxInput(inputId = "suggest",
                                            label = "Suggestive line", 
                                            value = TRUE),
                              checkboxInput(inputId = "geno",
                                            label = "Genome-wide significance line", 
                                            value = TRUE),
                            
                          
                  ),
                  mainPanel(
                          p("Hover the mouse over a point in the plot to inspect its annotation information, such as the SNP identified and GENE name. 
                            A menu will appear in the upper-right corner of the graph, this allows to zoom in on a region of interest and export the image as a .png file"),
                          plotlyOutput("interactive_manhattan")
                  
                          )
                 )),
                 
                 tabPanel("Circular Manhattan plot",
                          
                          sidebarLayout(
                            # Wrap up all the parameter controls in a panel
                            sidebarPanel(

                              # Color scheme
                              selectInput("colour_scheme", "Colour scheme:",
                                          list('Grey', 'Blue', 'Blue & Orange', 'Earth', 'Rainbow'),
                                          selected = 'Rainbow'),
                              
                              
                              # Options for circular Manhattan plot
                              radioButtons("circ_type", "Type", c("Inward plot"="inw", "Outward plot"="outw"), selected='inw')
                              
                              
                            ),
                            # The mainPanel is the main part of the UI on the right.
                            mainPanel(
                              # A caption will be displayed above the chart
                              h3(textOutput(outputId = "caption", container = span)),
                              
                              # The chart or plot
                              plotOutput("manhattan_plot",
                                         height = "800px",
                                         width = "800px"),
                              
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
                 ),
                  
                tabPanel("Help",
                         documentation_tab()
                         )
)