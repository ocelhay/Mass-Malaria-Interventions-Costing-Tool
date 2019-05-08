bsModal("MSAT", "Parameters for Mass Screening and Treatment", "par_msat", size = "large",
        fluidRow(
          column(4,
                 div(class = 'section',
                     h4('Baseline'),
                     sliderInput(inputId = "prop_vilMSAT",label = "Percentage of villages to perform mass screening and treatment", value = 100, min = 0, max = 100, ticks = FALSE),
                     sliderInput(inputId = "MSATround",label = "Number of rounds for mass screening and treatment in a year", value = 3, min = 0, max = 6, ticks = FALSE),
                     sliderInput(inputId = "MSATcoverage",label = "Average population coverage for mass screening and treatment in a round (%)", value = 50, min = 0, max = 100, ticks = FALSE),
                     sliderInput(inputId = "hrdt_pos",label = "Average test positivity rate by hypersensitive RDT in a round (%)", value = 20, min = 0, max = 50, ticks = FALSE)
                 ),
                 
                 div(class = 'section',
                     h4(icon('users'), 'Personnel'),
                     sliderInput(inputId = "MSATDays",label = h5("Number of days spent in a village for mass screening and treatment activity"),value = 5, min = 0, max = 10, step = 0.5, ticks = FALSE)
                 ),
                 
                 div(class = 'section',
                     h4(icon('dollar-sign'), "Incentive"),
                     sliderInput(inputId = "c_incen_MSAT",label = "Incentive for one participant in a round for mass screening and treatment activity (US$)",value = 0.64, min = 0, max = 10, ticks = FALSE)
                 ),
                 
                 div(class = 'section',
                     h4(icon('motorcycle'), 'Travel'),
                     h5("Field visit for mass screening and treatment activity"),
                     sliderInput(inputId = "tripMSAT", label= "Number of trips to a village for mass screening and treatment activity (1 round)", value = 1, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "vehicle_rent_MSAT", label = "Number of trips for car rental during mass screening and treatment activity(one round)", min = 0, max = 15, value = 0, ticks = FALSE)
                     
                 )
                 
          ),
          column(4,
                 div(class = 'section',
                     h4(icon('box'), "Equipment"),
                     sliderInput(inputId = "c_equip_MSAT",label = "Equipment cost per village for mass screening and treatment activity (US$)",value = 50, min = 0, max = 100, ticks = FALSE)
                 ),
                 div(class = 'section',
                     h4(icon('tablets'), "Consumable"),
                     sliderInput(inputId = "Consum_MSAT",label = "Cost of screening for a person by appropriate RDT for mass screening and treatment activity (US$)",value = 0.9, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "Consum_ACT",label = "Cost of treatment with artemisinin based combination therapy (ACT) per person (US$)",value = 2, min = 0, max = 5, ticks = FALSE)
                     
                 )
          ),
          column(4,
                 div(class = 'section',
                     h4(icon('chalkboard-teacher'), 'Training'),
                     sliderInput(inputId = "Train_MSAT_session",label = "Number of training sessions for mass screening and treatment activity",value = 1, min = 0, max = 10, ticks = FALSE),
                     sliderInput(inputId = "Trainee_MSAT",label = "Number of participants attend in one training session for mass screening and treatment activity",value = 10, min = 0, max = 50, ticks = FALSE),
                     sliderInput(inputId = "Trainer_MSAT",label = "Number of trainers in one training session for mass screening and treatment activity",value = 3, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "Train_day_MSAT",label = "Duration of a training session for mass screening and treatment activity",value = 3, min = 0, max = 10, ticks = FALSE)
                 ),
                 div(class = 'section',
                     h4(icon('clipboard-check'), 'Monitoring and Supervision'),
                     sliderInput(inputId = "MonittripMSAT", label= "Number of monitoring trips for mass screening and treatment activity in one round", value = 1, min = 0, max = 3, ticks = FALSE),
                     sliderInput(inputId = "MonitdayMSAT", label= "Duration of monitoring trip for mass screening and treatment activity in one round", value = 10, min = 0, max = 30, ticks = FALSE)
                 )
          )
        )
)