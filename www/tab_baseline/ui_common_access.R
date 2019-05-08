div(class = 'section',
    h4(icon('car'), icon('motorcycle'), icon('shoe-prints'), 'Villages Accessibility'),
    sliderInputSplit(inputId = "travel_Days",label = h5("Average travel days to a village"),value = 0.5, min = 0, max = 10, step= 0.5, 
                     ticks = FALSE, post = ' days', l = 4),
    
    p("Mode of transport to go to the targeted villages"),

    sliderInputSplit(inputId = "prop_vil_bike",label = "Motorbike", value = 100, min = 0, max = 100, ticks = FALSE, post = '% ', l = 4),
    sliderInputSplit(inputId = "prop_vil_rentedcar",label = "Rented car", value = 0, min = 0, max = 100, ticks = FALSE, post = '% ', l = 4),
    sliderInputSplit(inputId = "prop_vil_owncar",label = "Office Car", value = 0, min = 0, max = 100, ticks = FALSE, post = '% ', l = 4),
    sliderInputSplit(inputId = "prop_vil_boat",label = "Boat", value = 0, min = 0, max = 100, ticks = FALSE, post = '% ', l = 4),
    sliderInputSplit(inputId = "prop_vil_foot",label = "On foot", value = 0, min = 0, max = 100, ticks = FALSE, post = '% ', l = 4),
    
    htmlOutput('transport_pct'),
    
    div(class = 'validation-checkbox',
        prettyCheckbox(inputId = "common_access_valid", label = "Okay", icon = icon("check"), animation = "pulse", bigger = TRUE, status = "success")
    )
)
    