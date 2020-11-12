documentation_tab <- function() {
  tabPanel("Help",
           fluidPage(width = 12,
                     fluidRow(column(
                       6,
                       h3("Genome Wide Association Studies (GWAS)"), 
                       p("This mini-app allows you to easily visualise the results from a GwAS. GWAS is a hypothesis-free mothod for identifying associations between genetic regions and traits
                         (e.g. diseases). This kind of studies search for ", strong("Single-Nucleotide Polymorphisms (SNPs)"), " , which are small variations in the genetic 
                         code. Through GWAS, it is possible to identify SNPs that occur more frequently in certain diseases"),
                       p("GWAS use two groups of participants, cases and controls. If certain SNPs are found to be significantly more frequent in cases of a certain disease
                         compared to controls, the SNPs could be associated with the disease or trait."),
                       p("GWAS results are displayed in a ", strong("Manhattan plot"), "which shows the -log10(p-value) against the position in the genome. The signficace
                         threshold for this studies is p = 5 x 10", tags$sup("-8.")),
                       h4("Mini-app layout"),
                       p("The mini-app contains 4 tabs; this help tab gives you an overview of the mini-app itself."),
                       
                       h5("To use the mini-app"),
                       p("The data being used by the app is the HapMap dataset from the manhattanly R package, to use a different dataset you should store the 
                         csv file in the data folder" ),
                       
                       tags$ol(
                         tags$li("The first tab displays an ", strong("interactive Manhattan plot"), " showing the -log10(p-value) against the position in the genome.
                                 The red line shows the significace threshold and the blue line shows the suggestive line. 
                                 You can hover the moues over the SNPs to display the variant information. Using the options on the left-side bar, the user can change
                                 the color scheme, choose to display one or multiple chromosomes, select the size of the points and remove the suggestive ans siginificance
                                 lines. A menu will appear in the upper-right corner of the graph, this allows to zoom in on a region of interest and export the image 
                                 as a .png file"), 
                         
                         tags$li("The second tab prints a ", strong("Circular Manhattan plot."), 
                                 "This plot is not interactive, but it is possible to change the color scheme using the options on the left."),
                         tags$li("In the third tab builds a ", strong("Quantile-quantile (QQ) plot, "), 
                                 "which are probability plots that are used to compare two probability distributions by plotting their quantiles against each other. In GWAS
                                 studies, the QQ plot is a graphical representation of the deviation of the observed p-value against the expected p-values from a 
                                 theoretical distribution"), 
                         tags$li("Finally, the fourth tab build the ", strong("SNP density plot, "), "which shows the number of candidate variants in consecutive 100-kb regions")
                       )
                     ),
                     column(
                       6,
                       h3("Walkthrough video"),
                       HTML('<iframe width="100%" height="300" src="" frameborder="0"></iframe>'),
                       p(class = "nb", "NB: This mini-app is for provided for demonstration purposes, is unsupported and is utilised at user's 
                       risk. If you plan to use this mini-app to inform your study, please review the code and ensure you are 
                       comfortable with the calculations made before proceeding. ")
                       
                     ))
                     
                     
                     
                     
           ))
}