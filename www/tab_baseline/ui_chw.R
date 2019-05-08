bsModal("CHW", "Parameters for Community Health Worker", "par_chw", size = "large",
        fluidRow(
          column(4,
                 div(class = 'section',
                     h4(icon('cog'), 'Baseline'),
                     sliderInput(inputId = "prop_vilexistCHW",label = "Percentage of villages that have trained community health workers", value = 80, min = 0, max = 100, ticks = FALSE),
                     sliderInput(inputId = "prop_vilnewCHW",label = "Percentage of villages with CHW to be trained",value = 20, min = 0, max = 100, ticks = FALSE)
                 ),
                 div(class = 'section',
                     h4(icon('dollar-sign'), "Incentive"),
                     sliderInput(inputId = "c_incen_CHW",label = "Incentive for a Community Health Worker per month (US$)",value = 15, min = 0, max = 100, ticks = FALSE)
                 ),
                 div(class = 'section',
                     h4(icon('box'), "Equipment"),
                     sliderInput(inputId = "c_equip_CHW",label = "Equipment cost for one community health worker (US$)",value = 20, min = 0, max = 100, ticks = FALSE)
                 ),
                 div(class = 'section',
                     h4(icon('tablets'), "Consumable"),
                     sliderInput(inputId = "Consum_CHW",label = "Consumable cost for one community health worker (US$)",value = 10, min = 0, max = 100, ticks = FALSE)
                 )
          ),
          column(4,
                 div(class = 'section',
                     h4(icon('chalkboard-teacher'), 'Training'),
                     h5("Training for community health worker"), 
                     sliderInput(inputId = "Train_CHW_session",label = "Number of CHW training sessions per year",value = 1, min = 0, max = 10, ticks = FALSE),
                     sliderInput(inputId = "Trainee_CHW",label = "Number of participants in one CHW training",value = 30, min = 1, max = 50, ticks = FALSE),
                     sliderInput(inputId = "Trainer_CHW",label = "Number of trainers in one CHW training",value = 2, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "Train_day_CHW",label = "Number of training days for one training",value = 5, min = 0, max = 10, ticks = FALSE)
                 )
          ),
          column(4,
                 div(class = 'section',
                     h4(icon('clipboard-check'), 'Monitoring and Supervision'),
                     h5("Mornitoring for community health worker"),
                     
                     h5("Team for Community Health Worker monitoring"),
                     sliderInput(inputId = "StaffMonitMonitor", label = "Monitor", value = 1, min = 0, max = 3, ticks = FALSE),
                     sliderInput(inputId = "StaffMonitTL", label = "Team Leader/ Medical Officer/ Supervisor", value = 1, min = 0, max = 3, ticks = FALSE),
                     sliderInput(inputId = "StaffMonitCEC", label = "Community Engagement Coordinator/ Health Educator", value = 1, min = 0,max = 3, ticks = FALSE),
                     sliderInput(inputId = "StaffMonitHelper", label = "Helper/ Community Health Worker/ Volunteer", value = 1, min = 0, max = 3, ticks = FALSE),
                     
                     sliderInput(inputId = "CHW_monit_Freq", label = "Frequency of CHW monitoring visit in a village per year", value = 12, min = 0, max = 24, ticks = FALSE),
                     sliderInput(inputId = "CHW_monit_dayspertrip", label = "Number of days spent in one monitoring trip", value = 1, min = 0, max = 6, ticks = FALSE),
                     sliderInput(inputId = "CHW_vilpertrip", label = "Number of village can visit in one monitoring trip", value = 3, min = 0, max = 6, ticks = FALSE)
                 )
          )
        ),
        div(class = 'validation-checkbox',
            prettyCheckbox(inputId = "chw_valid", label = "Okay", icon = icon("check"), animation = "pulse", bigger = TRUE, status = "success")
        )
)