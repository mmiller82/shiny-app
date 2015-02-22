shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Compressive Strength prediction using a SVM prediction model"),
        
        sidebarPanel(
            selectInput("type", label = h4("Select component"), 
                        choices = list("Cement" = 1, "Fine Aggregate" = 2), selected = 1),
            br(),
            numericInput('component', 'kg/m3', 100, min = 100, max = 1000, step = 5),
            submitButton('Submit'),
            br(),
            helpText("Note:This app predicts the compressive strength of concrete with different",
                     "concentrations of Cement and Fine Aggregate using the svm model.  ",
                     "The application takes a type of either Cement or Fine Aggregate.  ",  
                     "It also takes a concentration value in kg/m3. Once a type and concentration", 
                    "value have been selected click the submit button.  The application will display",
                    "the input concentration and the predicted compressive strength.")
        ),
        
        mainPanel(
            h3('Results of prediction'),
            h4('You entered'),
            verbatimTextOutput("inputValue"),
            p('kg/m3'),
            br(),
            h4('Which resulted in a prediction of '),
            verbatimTextOutput("prediction"),
            p('MPa')
        )
    )
)