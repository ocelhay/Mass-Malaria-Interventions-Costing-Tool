bsModal("Advanced", "Advanced", "advanced_panel", size = "small",
        fluidRow(
          column(12,
                 switchInput(inputId = "Managementon", value = TRUE, inline = TRUE, size = "small"), HTML("Program management"), br(),
                 switchInput(inputId = "Monitoringon", value = TRUE, inline = TRUE, size = "small"), HTML("Monitoring"), br(),
                 switchInput(inputId = "Trainingon", value = TRUE, inline = TRUE, size = "small"), HTML("Training"), br()
                 )
        )
)