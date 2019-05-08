div(class = 'section',
    h4(icon('chalkboard-teacher'), 'Training'),
    p('All training costs are in US$'), hr(),
    h4("Travel Costs"),
    sliderInput(inputId = "Trainer_travel", label = "Travel Cost (for trainers) round trip",value = 50, min = 0, max = 300, ticks = FALSE),
    sliderInput(inputId = "Trainee_travel", label = "Travel Cost (for trainee) round trip",value = 10, min = 0, max = 50, ticks = FALSE),
    
    h4("Accommodation Costs"),
    sliderInput(inputId = "Trainer_accom", label = "Cost of accommodation per day (for trainers)",value = 30, min = 0, max = 50, ticks = FALSE),
    sliderInput(inputId = "Trainee_accom", label = "Cost of accommodation per days (for trainee)",value = 10, min = 0, max = 50, ticks = FALSE),
    
    h4("Perdiem"),
    sliderInput(inputId = "Trainer_perdi", label = "Perdiem for trainers",value = 50, min = 0, max = 300, ticks = FALSE),
    sliderInput(inputId = "Trainee_perdi", label = "Perdiem for trainee",value = 5, min = 0, max = 30, ticks = FALSE),
    sliderInput(inputId = "Train_venue", label = "Cost of training venue per day",value = 30, min = 0, max = 100, ticks = FALSE),
    sliderInput(inputId = "Train_aid", label = "Cost of learning aid per person",value = 10, min = 0, max = 100, ticks = FALSE),
    
    div(class = 'validation-checkbox',
        prettyCheckbox(inputId = "common_program_training", label = "Okay", icon = icon("check"), animation = "pulse", bigger = TRUE, status = "success")
    )
)