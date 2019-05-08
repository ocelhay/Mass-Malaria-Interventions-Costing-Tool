bsModal("CE", "Parameters for Community Engagement", "par_ce", size = "large",
        fluidRow(
          column(4,
                 div(class = 'section',
                     h4(icon('users'), 'Personnel'),
                     sliderInput(inputId = "CEDays", label = h5("Number of days spent in a village for community engagement activity"), value = 1, min = 0, max= 10, step = 0.5, ticks = FALSE),
                     h5("Staff involved in community engagement activity"),
                     sliderInput(inputId = "StaffCETL", label = "Team Leader/ Program manager/ Supervisor", value= 1, min= 0, max= 3, ticks = FALSE),
                     sliderInput(inputId = "StaffCECEC", label = "Program manager assistant/ logistics assistant/ medic", value= 1, min= 0, max= 5, ticks = FALSE),
                     sliderInput(inputId = "StaffCEHelper", label = "Helper/ Community Health Worker/ Volunteer", value= 0, min= 0, max= 5, ticks = FALSE)
                 )
          ),
          column(4,
                 div(class = 'section',
                     h4(icon('box'), "Equipment"),
                     sliderInput(inputId = "c_equip_CE",label = "Equipment cost per village for community engagement activity (US$)",value = 3, min = 0, max = 100, ticks = FALSE)
                 ),
                 div(class = 'section',
                     h4(icon('tablets'), "Consumable"),
                     sliderInput(inputId = "Consum_CE",label = "Consumable cost per village for community engagement activity (US$)",value = 38, min = 0, max = 350, ticks = FALSE)
                 ),
                 div(class = 'section',
                     h4(icon('dollar-sign'), "Incentive"),
                     sliderInput(inputId = "c_incen_CE",label = "Refreshment cost per village during community engagement activity (US$)",value = 8.8, min = 0, max = 100, ticks = FALSE),
                     h5("Community incentive"),
                     sliderInput(inputId = "c_incen_commu_CE",label = "Costs for community incentive (US$)",value = 0, min = 0, max = 5000, ticks = FALSE),
                     sliderInput(inputId = "Vil_commu_incen",label = "Number of villages provide for community incentive",value = 0, min = 0, max = 200, ticks = FALSE),
                     h5("Community Engagement"),
                     
                     sliderInput(inputId = "prop_vilCE",label = "Out of all villages, percentage of villages visited for community engagement",value = 100, min = 0, max = 100, ticks = FALSE)
                 )
          ),
          column(4,
                 div(class = 'section',
                     h4(icon('chalkboard-teacher'), 'Training'),
                     sliderInput(inputId = "Train_CE_session",label = "Number of training sessions for community engagement activity",value = 1, min = 0, max = 10, ticks = FALSE),
                     sliderInput(inputId = "Trainee_CE",label = "Number of participants for community engagement training",value = 3, min = 0, max = 50, ticks = FALSE),
                     sliderInput(inputId = "Trainer_CE",label = "Number of trainers for community engagement training",value = 2, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "Train_day_CE",label = "Duration for a training session community engagement activity",value = 3, min = 0, max = 10, ticks = FALSE)
                     
                 ),
                 div(class = 'section',
                     h4("Field visit for community engagement activity"),
                     sliderInput(inputId = "tripCE", label= "Number of trips to a village for community engagement activity", value = 3, min = 0, max = 7, ticks = FALSE),
                     sliderInput(inputId = "vehicle_rent_CE", label = "Number of trips for car rental during community engagement activity", min = 0, max = 10, value = 0, ticks = FALSE)
                 ),
                 div(class = 'section',    
                     h4("Monitoring for community engagement activity"),
                     sliderInput(inputId = "MonittripCE", label= "Number of trips for monitoring CE activity", value = 1, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "MonitdayCE", label= "Number of days spent on monitoring CE activity", value = 3, min = 0, max = 10, ticks = FALSE)
                 )
          )
        )
)