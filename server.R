# install.packages('ISwR')
# install.packages('survival')
# install.packages('shiny')
# install.packages("devtools")
# install.packages("Rtools")
# devtools::install_github('rstudio/shinyapps')


# library(Rtools)
# library(shiny)

library(devtools)
library(shinyapps)
library(shiny)
library(survival)
library(ISwR)
x <<- 0

#recode status 2's and 3's to 0 (censored)
melanom[melanom$status %in% c(2,3),"status"]=0

mykmplot1 = function(mystrata){
  if(mystrata==1){
  myfit = survfit(Surv(melanom$days,melanom$status==1)~1)
  print(myfit)
  }
  if(mystrata==2){
    myfit = survfit(Surv(melanom$days,melanom$status==1)~melanom$sex)
    myfit2 = survdiff(Surv(melanom$days,melanom$status==1)~melanom$sex)
    print(myfit)
    print(myfit2)
#     return(myfit2)
    
  }
}


# mykmplot2(1)
# mykmplot(2)

shinyServer(
  function(input,output){
    x <<- x+1
    output$inputValue = renderPrint({input$mystrata})
    output$prediction1 = renderPrint({mykmplot1(input$mystrata)})    
    output$counter = renderText(x)
    output$tte1 = renderPlot({
      if (input$mystrata==1){
        sfit = survfit(Surv(melanom$days,melanom$status==1)~1)
        plot(sfit,conf.int=F)
      }
      if (input$mystrata==2){
        sfit = survfit(Surv(melanom$days,melanom$status==1)~melanom$sex)
        plot(sfit,conf.int=F)
      }
      
      
      
    })
    
  }
)


# setwd("C:/Users/harric17/Desktop/R Stuff/coursera/dp2/")

# 
# install.packages("devtools")
# install.packages("Rtools")
# devtools::install_github('rstudio/shinyapps')
# library(shinyapps)
# library(Rtools)
# library(shiny)
# 
# runApp()
# deployApp()
# deployApp(appName="APPNAME")
