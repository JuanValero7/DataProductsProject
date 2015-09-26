library(shiny)
library(ggplot2)
shinyServer(
  function(input,output){
    e<-2.7182818284590452353602874713527
    pi<-3.14159265359
    output$oid1<-renderPrint({
    z<-input$id1
    if(length(z)>0){
      x<-input$id2
      if(input$type=="Exponential"){
        demo<-rexp(x)
      }
      if(input$type=="Uniform"){
        demo<-runif(x)
      }
      if(input$type=="Normal"){
        demo<-rnorm(x)
      }
      if(length(z)==1){
        z<-c(z,5,5)
      }
      if(length(z)==2){
        z<-c(z,5)
      }
      if(z[1]=="1"){
        print(mean(demo))
      }
      if(z[1]=="2"){
        print(var(demo))
      }
      if(z[1]=="3"){
        print(sd(demo))
      }
      if(z[2]==5){}
      if(z[2]=="2"){
        print(var(demo))
      }
      if(z[2]=="3"){
        print(sd(demo))
      }
      if(z[3]==5){}
      if(z[3]=="3"){
        print(sd(demo))
      }
    }
    if(length(z)==0){
    }
    }
    )
    
    output$plot1<-renderPlot({
      if(input$type=="Exponential"){
        x<-input$id2
        y<-input$col
        demo=rexp(x)
        densidad=e^(-demo)
        distribucion=1-e^-demo
        plot(demo,densidad,main = "Density",xlab = "Samples",ylab = "Values",pch=5,col=y)
      }
      if(input$type=="Uniform"){
        x<-input$id2
        y<-input$col
        demo=runif(x)
        densidad=rep((1/(1-0)),x)
        distribucion=demo/1
        plot(demo,densidad,main = "Density",xlab = "Samples",ylab = "Values",pch=5,col=y)
      }
      if(input$type=="Normal"){
        x<-input$id2
        y<-input$col
        demo=rnorm(x)
        densidad=(1/(2*pi))*(e^(-(1/2)*((demo/1)^2)))
        distribucion=(1/(2*pi))*(e^(-(1/2)*((demo/1)^2)))
       plot(demo,densidad,main = "Density",xlab = "Samples",ylab = "Values",pch=5,col=y)
      }
    }
    )
    output$plot2<-renderPlot({
      if(input$type=="Exponential"){
        x<-input$id2
        y<-input$col
        demo=rexp(x)
        densidad=e^(-demo)
        distribucion=1-e^-demo
        plot(demo,distribucion,main = "Distribution",xlab = "Samples",ylab = "Values",pch=5,col=y)
      }
      if(input$type=="Uniform"){
        x<-input$id2
        y<-input$col
        demo=runif(x)
        densidad=rep((1/(1-0)),x)
        distribucion=demo/1
        plot(demo,distribucion,main = "Distribution",xlab = "Samples",ylab = "Values",pch=5,col=y)
      }
#       if(input$type=="Normal"){
#         x<-input$id2
#         y<-input$col
#         demo=rnorm(x)
#         densidad=(1/(2*pi))*(e^(-(1/2)*((demo/1)^2)))
#         distribucion=(1/(2*pi))*(e^(-(1/2)*((demo/1)^2)))
#         plot(demo,distribucion,main = "Distribution",xlab = "Samples",ylab = "Values",pch=5,col=y)
#       }
    }
    )
    
  }
)
