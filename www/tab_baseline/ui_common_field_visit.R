div(class = 'section',
    h4("Field Visits for Various Activities"),
    sliderInputSplit(inputId = "fie_visit", label =  "Monthly Visits", min = 0, max = 30, value = 0, post = ' visits', ticks = FALSE),
    sliderInputSplit(inputId = "fie_days", label = "Average number of days stayed in the field", min = 0, max = 20, value = 10, ticks = FALSE, post = ' days'),
    sliderInputSplit(inputId = "perdium", label = "Perdiem", min = 0, max = 30, value = 7, ticks = FALSE, post = ' US$'),
    sliderInputSplit(inputId = "accom", label = "Cost of accommodation", min = 0, max = 40, value = 30, ticks = FALSE, post = ' US$'),
    
    div(class = 'validation-checkbox',
        prettyCheckbox(inputId = "common_field_visit_valid", label = "Okay", icon = icon("check"), animation = "pulse", bigger = TRUE, status = "success")
    )
)