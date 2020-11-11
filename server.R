

####################
###### SERVER ######
####################


function(input, output, session) {

    # Fix for mini_app greying-out after 10 min of inactivity
    autoInvalidate <- reactiveTimer(10000)
    observe({
        autoInvalidate()
        cat(".")
    })


    # Read in data ------------------------------------------------------------------------
    gwas <- HapMap %>% select (CHR, SNP, BP, P)
    gwas_cm <- HapMap %>% select(SNP, CHR, BP, P)
    
    
    # 1st Tab - INTERACTIVE MANHATAN PLOT --------------------------------------------------
    
    output$interactive_manhattan <- renderPlotly({
        
        cols = switch(   
            input$color,   
            "Grey"= c("#4D4D4D","#999999"),
            "Blue"= c("#104E8B", "#00BFFF"),  
            "Blue & Orange"=  c("#00008B", "#CD8500"), 
            "Earth"= c("#d9bb9c", "#28231e", "#4b61ba", "#deb7a0", "#a87963"),
            "Rainbow"= c("#4197d8", "#f8c120", "#413496", "#495226",
                         "#d60b6f", "#e66519", "#d581b7", "#83d3ad", "#7c162c", "#26755d")
        ) 
        
        if (input$suggest) suggest_y <- -log10(1e-5) else suggest_y <- FALSE
        if (input$geno) geno_y <- -log10(5e-08) else geno_y <- FALSE

        
        if (is.null(input$chr)){
            
            manhattanly(gwas, snp="SNP", point_size= input$point, col=cols,
                        suggestiveline = suggest_y,
                        genomewideline = geno_y)

        } else {
            manhattanly(subset(gwas, CHR %in% paste(input$chr, sep = ",")), 
                        snp = "SNP",
                        point_size = input$point,
                        col = cols,
                        suggestiveline = suggest_y,
                        genomewideline = geno_y,
                        )
        }
    })
    

    # Construct the plot if we have valid parameters
    output$manhattan_plot <- renderPlot({
        
        cols = switch(   
            input$colour_scheme,   
            "Grey"= c("grey30","grey60"),
            "Blue"= c("dodgerblue4", "deepskyblue"),  
            "Blue & Orange"=  c("blue4", "orange3"), 
            "Earth"= c("#d9bb9c", "#28231e", "#4b61ba", "#deb7a0", "#a87963"),
            "Rainbow"= c("#4197d8", "#f8c120", "#413496", "#495226",
                         "#d60b6f", "#e66519", "#d581b7", "#83d3ad", "#7c162c", "#26755d")
        )   
        

            if (input$circ_type == 'outw') outward <- TRUE else outward <- FALSE
            
            CMplot(gwas_cm,
                   type = "p",
                   plot.type="c",
                   chr.labels = paste("", c(1:23), sep=""),
                   r=100, 
                   cir.legend=TRUE, 
                   col=cols, 
                   cir.band=1500, H=3000, cex=0.4, signal.cex=0.7,
                   threshold.lty=c(1,2), threshold.col=c("red","blue"), signal.line=1, signal.col=c("red","green"), threshold=c(5e-8, 1e-5),
                   outward=outward, cir.legend.col="black", cir.chr.h=700, chr.den.col="black", band=1,
                    mar=c(0, 0, 0, 0),
                   file.output=FALSE)
        
    })
    
    
    output$qq_plot <- renderPlot({
        
        #qq(gwas$P)
        CMplot(gwas_cm, plot.type="q", box=FALSE,file.output=FALSE, mar=c(2, 2, 2, 2), 
               main=NULL, cex.lab=1, ylim=c(0, 20), col='black',
               conf.int=input$qqplot_conf, conf.int.col=NULL, threshold.col="red", threshold.lty=2)
    })
    
    output$snp_density <- renderPlot({
        CMplot(gwas_cm, type="p", plot.type="d", bin.size=1e6, 
               chr.den.col=c("darkgreen", "yellow", "red"), file.output=FALSE)
    })
    
    
    
}
