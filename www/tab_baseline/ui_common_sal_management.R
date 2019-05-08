div(class = 'section',
    h4(icon('users'), 'Salaries for Central Staff'),
    p('All costs below are monthly salaries in US$'), hr(),
    sliderInput(inputId = "StaffDir",label = "General Director",value = 1000, min = 0, max = 20000, ticks = FALSE),
    sliderInput(inputId = "StaffP_Dir",label = "Programme manager",value = 0, min = 0, max = 15000, ticks = FALSE),
    sliderInput(inputId = "StaffHR",label = "Programme coordinator",value = 0, min = 0, max = 10000, ticks = FALSE),
    sliderInput(inputId = "StaffFinance",label = "Financial Manager",value = 0, min = 0, max = 10000, ticks = FALSE),
    sliderInput(inputId = "StaffLogist",label = "Logistic coordinator",value = 0, min = 0, max = 10000, ticks = FALSE),
    sliderInput(inputId = "Staff_research",label = "Research coordinator",value = 0, min = 0, max = 10000, ticks = FALSE),
    
    div(class = 'validation-checkbox',
        prettyCheckbox(inputId = "common_sal_management", label = "Okay", icon = icon("check"), animation = "pulse", bigger = TRUE, status = "success")
    )
)