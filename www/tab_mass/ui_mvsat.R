bsModal("MVSAT", "Parameters for Mass screening and treatment and mass vaccination activity", "par_mvsat", size = "large",
        fluidRow(
          column(4,
                 div(class = 'section',
                     h4('Baseline'),
                     sliderInput(inputId = "prop_vilMVSAT",label = "Percentage of villages that are offered Mass screening and treatment and mass vaccination activity",value = 100, min = 0, max = 100, ticks = FALSE),
                     sliderInput(inputId = "MVSATround",label = "Number of mass screening and treatment and mass vaccination rounds in a year",value = 3, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "MVSATcoverage",label = "Average population coverage for mass screening and treatment and mass vaccination activity in a round (%)",value = 50, min = 0, max = 100, ticks = FALSE),
                     sliderInput(inputId = "MVSAT_pos",label = "Average test positivity rate by hypersensitive RDT in a round (%)", value = 20, min = 0, max = 50, ticks = FALSE),
                     checkboxInput(inputId = "MVSATboosteron", label = "Booster dose after one year", value = FALSE),
                     conditionalPanel(
                       condition = "input.MVSATboosteron == true",
                       sliderInput(inputId = "MVSAT_booster_coverage", label = "Booster dose coverage based on the population who has previously complete dose of vaccination (%)", value = 50, min = 0, max = 100, ticks = FALSE)
                     )
                 ),
                 
                 div(class = 'section',
                     h4(icon('users'), 'Personnel'),
                     sliderInput(inputId = "MVSATDays",label = h5("Number of days spent in a village for mass screening and treatment and mass vaccination activity"),value = 5, min = 0, max = 10, step = 0.5, ticks = FALSE)
                 ),
                 
                 div(class = 'section',
                     h4(icon('dollar-sign'), "Incentive"),
                     sliderInput(inputId = "c_incen_MVSAT",label = "Incentive for one participant in a round for mass screening and treatment activity (US$)",value = 0.64, min = 0, max = 10, ticks = FALSE)
                 ),
                 
                 div(class = 'section',
                     h4(icon('motorcycle'), 'Travel'),
                     h5("Field visit for mass screening and treatment and mass vaccination activity"),
                     sliderInput(inputId = "tripMVSAT", label= "Number of trips to a village for mass screening and treatment and mass vaccination activity (1 round)", value = 1, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "vehicle_rent_MVSAT", label = "Number of trips for car rental during mass screening and treatment and mass vaccination activity (one round)", min = 0, max = 15, value = 0, ticks = FALSE)
                 )
                 
          ),
          column(4,
                 div(class = 'section',
                     h4(icon('box'), "Equipment"),
                     sliderInput(inputId = "c_equip_MVSAT",label = "Equipment cost per village for mass screening and treatment and mass vaccination activity (US$)",value = 50, min = 0, max = 100, ticks = FALSE)
                 ),
                 div(class = 'section',
                     h4(icon('tablets'), "Consumable"),
                     sliderInput(inputId = "Consum_MVSAT",label = "Cost of screening for a person by appropriate RDT for mass screening and treatment (US$)",value = 0.9, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "MVSAT_ACT",label = "Cost of treatment with artemisinin based combination therapy (ACT) per person (US$)",value = 2, min = 0, max = 5, ticks = FALSE),
                     hr(),
                     sliderInput(inputId = "Consum_MVSATVaccine",label = "Consumable cost per dose for mass vaccination activity (US$)",value = 1, min = 0, max = 10, ticks = FALSE),
                     sliderInput(inputId = "MVSAT_Vaccine_cost",label = "Vaccine cost per dose for mass vaccination activity (US$)",value = 5, min = 0, max = 50, ticks = FALSE),
                     sliderInput(inputId = "MVSAT_wastage",label = "Vaccine wastage per villages for mass vaccination activity (%)",value = 5, min = 0, max = 100, ticks = FALSE)
                 )
          ),
          column(4,
                 div(class = 'section',
                     h4(icon('chalkboard-teacher'), 'Training'),
                     sliderInput(inputId = "Train_MVSAT_session",label = "Number of training sessions for mass screening and treatment and mass vaccination activity",value = 1, min = 0, max = 10, ticks = FALSE),
                     sliderInput(inputId = "Trainee_MVSAT",label = "Number of participants attend in one training session for mass screening and treatment and mass vaccination activity",value = 10, min = 0, max = 50, ticks = FALSE),
                     sliderInput(inputId = "Trainer_MVSAT",label = "Number of trainers in one training session for mass screening and treatment and mass vaccination activity",value = 3, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "Train_day_MVSAT",label = "Duration of a training session for mass screening and treatment and mass vaccination activity",value = 3, min = 0, max = 10, ticks = FALSE)
                 ),
                 div(class = 'section',
                     h4(icon('clipboard-check'), 'Monitoring and Supervision'),
                     sliderInput(inputId = "MonittripMVSAT", label= "Number of monitoring trips for mass screening and treatment activity in one round", value = 1, min = 0, max = 3, ticks = FALSE),
                     sliderInput(inputId = "MonitdayMVSAT", label= "Duration of monitoring trip for mass screening and treatment activity in one round", value = 10, min = 0, max = 30, ticks = FALSE)
                 )
          )
        )
)