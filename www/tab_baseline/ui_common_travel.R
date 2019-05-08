div(class = 'section',
    h4(icon('route'), 'Travel Costs'),
    p('All travel costs below are in US$'), hr(),
    
    sliderInput(inputId = "c_motorbike",label = "Travel cost per village by motorbike",value = 20, min = 0, max = 500, ticks = FALSE),
    sliderInput(inputId = "c_rentedcar",label = "Travel cost per village by rented car",value = 66, min = 0, max = 500, ticks = FALSE),
    sliderInput(inputId = "c_owncar",label = "Travel cost per village by own car",value = 50, min = 0, max = 300, ticks = FALSE),
    sliderInput(inputId = "c_boat",label = "Travel cost per village by boat",value = 1.5, min = 0, max = 100, ticks = FALSE),
    em("Traveling to a village on foot is considered cost-free."), br(),
    
    sliderInput(inputId = "c_travel_central_field", label= "Travel cost from central office to field office (US$)", value = 50, min = 0, max = 300, ticks = FALSE),
    
    div(class = 'validation-checkbox',
        prettyCheckbox(inputId = "common_program_travel", label = "Okay", icon = icon("check"), animation = "pulse", bigger = TRUE, status = "success")
    )
)