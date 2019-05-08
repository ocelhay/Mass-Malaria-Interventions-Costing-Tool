div(class = 'section',
    h4('Programme Assumptions'),
    numericInputSplit(inputId = "No_villages",label = 'Total Villages', value = 56, min = 10, max = 1500, width = '100px'),
    sliderInputSplit(inputId = "vilSize", label = "Average Village Population", value = 537, min = 100, max= 1500, step= 50, ticks = FALSE),
    htmlOutput("total_population"), br(),
    sliderInputSplit(inputId = "length",label = 'Program Duration (months)', value = 6, min = 0, max = 60, ticks = FALSE, post = ' months'),
    
    br(),
    h4('Existing Interventions'),
    br(),
    switchInput(inputId = "CHWon", value = FALSE, inline = TRUE, size = "small"), HTML("Community Health Workers"),
    conditionalPanel(condition = "input.CHWon == true",
                     actionButton("par_chw", label = "Settings", icon = icon('gear')),
                     source("./www/tab_baseline/ui_chw.R", local = TRUE)$value
    ),
    br(), br(),
    switchInput(inputId = "ITNon", value = FALSE, inline = TRUE, size = "small"), HTML("Distribution of ITNs"),
    conditionalPanel(condition = "input.ITNon == true",
                     actionButton("par_itn", label = "Settings", icon = icon('gear')),
                     source("./www/tab_baseline/ui_itn.R", local = TRUE)$value
    ),
    
    
    div(class = 'validation-checkbox',
        prettyCheckbox(inputId = "common_program_valid", label = "Okay", icon = icon("check"), animation = "pulse", bigger = TRUE, status = "success")
    )
)