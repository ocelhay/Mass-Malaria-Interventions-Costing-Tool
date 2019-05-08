bsModal("Epi", "Parameters for Distribution of ITNs", "par_itn", size = "large",
        fluidRow(
          column(4,
                 div(class = 'section',
                     h4(icon('cog'), 'Baseline'),
                     sliderInput(inputId = "prop_vilITN",label = "Percentage of villages to distribute insecticide treated bednets",value = 100, min = 0, max = 100, ticks = FALSE)
                 ),
                 div(class = 'section',
                     h4(icon('motorcycle'), 'Travel'),
                     h5("Field visit for distribution of insecticide treated bed nets distribution activity"),
                     sliderInput(inputId = "tripITN", label= "Number of trips to a village for insecticide treated bed nets distribution activity", value = 0, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "vehicle_rent_ITN", label = "Number of trips for car rental to deliver insecticide treated bed nets", min = 0, max = 5, value = 1, ticks = FALSE)
                 )
                 
          ),
          column(4,
                 div(class = 'section',
                     h4(icon('users'), 'Personnel'),
                     sliderInput(inputId = "ITNDays", label = h5("Number of days spent in a village for distribution of insecticide treated bed nets activity"), value = 3.5, min = 0, max= 10, step = 0.5, ticks = FALSE),
                     h5("Staff involved in distribution of insecticide treated bed nets activity"),
                     sliderInput(inputId = "StaffITNTL", label = "Team Leader/ Program manager/ Supervisor", value= 0, min= 0, max= 3, ticks = FALSE),
                     sliderInput(inputId = "StaffITNCEC", label = "Program manager assistant/ logistics assistant/ medic", value= 0, min= 0, max= 5, ticks = FALSE),
                     sliderInput(inputId = "StaffITNHelper", label = "Helper/ Community Health Worker/ Volunteer", value= 0, min= 0, max= 5, ticks = FALSE)
                 )
          ),
          column(4,
                 div(class = 'section',
                     h4(icon('box'), "Equipment"),
                     sliderInput(inputId = "c_equip_ITN",label = "Cost of insecticide treated bed net one piece (US$)",value = 3, min = 0, max = 10, ticks = FALSE)
                 )
          )
        ),
        div(class = 'validation-checkbox',
            prettyCheckbox(inputId = "ui_itn_valid", label = "Okay", icon = icon("check"), animation = "pulse", bigger = TRUE, status = "success")
        )
)