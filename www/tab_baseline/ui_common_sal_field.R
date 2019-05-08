div(class = 'section',
    h4(icon('users'), 'Salaries for Field Staff'),
    p('All costs below are monthly salaries in US$'), hr(),
    sliderInput(inputId = "StaffTL",label = "Team Leader/ Program manager/ Supervisor/ Nurse",value = 500, min = 0, max = 5000, ticks = FALSE),
    sliderInput(inputId = "StaffCEC",label = "Program manager assistant/ logistics assistant/ medic",value = 150, min = 0, max = 900, ticks = FALSE),
    sliderInput(inputId = "StaffLab",label = "Lab person",value = 250, min = 0, max = 800, ticks = FALSE),
    sliderInput(inputId = "StaffHelper",label = "Helper/ Community Health Worker/ Volunteer",value = 15, min = 0, max = 500, ticks = FALSE),
    sliderInput(inputId = "StaffFieLog",label = "Logistics (field)",value = 200, min = 0, max = 1000, ticks = FALSE),
    sliderInput(inputId = "StaffTrainer",label = "Trainer",value = 800, min = 0, max = 1000, ticks = FALSE),
    sliderInput(inputId = "StaffMonit",label = "Monitor",value = 800, min = 0, max = 1000, ticks = FALSE),
    
    div(class = 'validation-checkbox',
        prettyCheckbox(inputId = "common_sal_field", label = "Okay", icon = icon("check"), animation = "pulse", bigger = TRUE, status = "success")
    )
)