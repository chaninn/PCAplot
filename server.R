library(shiny)
library(shinyjs)



shinyServer(function(input, output, session) {
  
  observe({
    
    shinyjs::hide("downloadData") # Hide download button before input submission
    if(input$submitbutton>0)
      shinyjs::show("downloadData") # Show download button after input submission
    
  })
  
    datasetInput <- reactive({
    
    inFile1 <- input$file1
    inFile2 <- input$file2

    
    #########
    score_active = read.csv(inFile1$datapath, header = TRUE)
    loading_active = read.csv(inFile2$datapath, header = TRUE)
    
    par( mfrow = c(1,2 ),mai=c(0.85,0.85,0.3,0.3))
    
    Myblue <- rgb(t(col2rgb("red")), alpha=35, maxColorValue=255)
    Myred <- rgb(t(col2rgb("blue")), alpha=35, maxColorValue=255)
    
    pdf(file="pca.pdf", width = 5, height = 5)
    
    plot(score_active[,1], score_active[,2], main= NULL, xlab= "PC1(25.90%)",ylab= "PC2(12.27%)", pch=19,
         col=ifelse(score_active[6] == "YES",Myblue,Myred))
    
    plot(loading_active[,2], loading_active[,3], main= NULL, xlab= "PC1(25.90%)",ylab= ".", col= "forestgreen",pch=19, xlim=c(-1, 1), ylim=c(-1, 1))
    text(loading_active[,2], loading_active[,3], labels= loading_active[,1], cex= 0.8,pos=3)
    
    abline(h=0)
    abline(v=0)
    
    dev.off()
    #########    
    
    
    
      
    })
  
  output$contents <- renderPrint({
    if (input$submitbutton>0) { 
      isolate(datasetInput()) 
    } else {
      return("Server is ready for processing")
    }
  })
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("pca.pdf", sep='')
    },
    content = function(file) {
      myfile <- paste0("pca.pdf", collapse = NULL)
      file.copy(myfile, file)
    }
  )
  
})
