library(shiny)
library(AppliedPredictiveModeling)
library(caret)
set.seed(3200)

data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
library(e1071)
set.seed(111)
svm.model <- svm(CompressiveStrength ~ Cement, data = training)
aggregate.model <- svm(CompressiveStrength ~ FineAggregate, data = training)

compStrengthCement <- function(cement) {
    ynew <- c(cement)  
    ydata <- data.frame(ynew)
    names(ydata)[1] <- "Cement"
    svm.pred <- predict(svm.model, ydata)
    return (svm.pred[[1]])
}

compStrengthAggregate <- function(aggregate) {
    ynew <- c(aggregate)  
    ydata <- data.frame(ynew)
    names(ydata)[1] <- "FineAggregate"
    svm.pred <- predict(aggregate.model, ydata)
    return (svm.pred[[1]])
}

shinyServer(function(input, output) {
    observe({
        if(input$type == "1") {
            output$inputValue <- renderPrint({input$component}) 
            output$prediction <- renderPrint({compStrengthCement(input$component)})
        } else if (input$type == "2") {
            output$inputValue <- renderPrint({input$component})
            output$prediction <- renderPrint({compStrengthAggregate(input$component)})            
        }
    })
}
)