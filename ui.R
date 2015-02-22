shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Compressive Strength prediction using a SVM prediction model"),
        sidebarPanel(
            selectInput("type", label = h4("Select component"), 
                        choices = list("Cement" = 1, "Fine Aggregate" = 2), selected = 1),
            br(),
            numericInput('component', 'kg/m3', 100, min = 100, max = 1000, step = 5),
            submitButton('Submit')
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