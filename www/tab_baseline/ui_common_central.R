div(class = 'section',
    h4(icon('building'), 'Central Office'),
    p('All costs below are for the central office, in US$ and per month.'), hr(),
    sliderInput(inputId = "Cen_off", label = "Rental fees", value = 835, min = 0, max= 1500, ticks = FALSE),
    sliderInput(inputId = "Cen_electric", label = "Electricity", value = 72, min = 0, max= 500, ticks = FALSE),
    sliderInput(inputId = "Cen_water", label = "Water bill", value = 3, min = 0, max= 500, ticks = FALSE),
    sliderInput(inputId = "Cen_communication", label = "Communication charges", value = 60, min = 0, max= 500, ticks = FALSE),
    sliderInput(inputId = "Cen_maintenance", label = "Office maintenance", value = 45, min = 0, max= 500, ticks = FALSE),
    sliderInput(inputId = "Cen_stationery", label = "Stationery", value = 0, min = 0, max= 500, ticks = FALSE),
    sliderInput(inputId = "Cen_mis", label = "Miscellaneous", value = 0, min = 0, max= 500, ticks = FALSE),
    
    div(class = 'validation-checkbox',
        prettyCheckbox(inputId = "common_central_valid", label = "Okay", icon = icon("check"), animation = "pulse", bigger = TRUE, status = "success")
    )
)