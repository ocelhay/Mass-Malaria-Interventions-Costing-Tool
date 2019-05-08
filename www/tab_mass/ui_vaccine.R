bsModal("Vaccine", "Parameters for Mass Vaccination", "par_vaccine", size = "large",
        fluidRow(
          column(4,
                 div(class = 'section',
                     h4('Baseline'),
                     sliderInput(inputId = "prop_vilVaccine",label = "Percentage of villages to implement mass vaccination activity", value = 100, min = 0, max = 100, ticks = FALSE),
                     sliderInput(inputId = "Vaccineround",label = "Number of rounds for mass vaccination in a year", value = 3, min = 0, max = 6, ticks = FALSE),
                     sliderInput(inputId = "Vaccinecoverage",label = "Average population coverage for mass vaccination in a round (%)", value = 50, min = 0, max = 100, ticks = FALSE),
                     checkboxInput(inputId = "Vaccineboosteron", label = "Booster dose after one year", value = FALSE),
                     conditionalPanel(
                       condition = "input.Vaccineboosteron == true",
                       sliderInput(inputId = "Vaccine_booster_coverage", label = "Booster dose coverage based on the population who has previously completed dose of vaccination (%)", value = 50, min = 0, max = 100, ticks = FALSE)
                     )
                 ),
                 
                 div(class = 'section',
                     h4(icon('users'), 'Personnel'),
                     sliderInput(inputId = "VaccineDays",label = h5("Number of days spent in a village for mass vaccination activity"),value = 5, min = 0, max = 10, step = 0.5, ticks = FALSE)
                 ),
                 
                 div(class = 'section',
                     h4(icon('dollar-sign'), "Incentive"),
                     h5("Refreshment per village for mass vaccination activity"),
                     sliderInput(inputId = "c_incen_Vaccine",label = "Refreshment for a person in a round for mass vaccination activity (US$)",value = 0.5, min = 0, max = 100, ticks = FALSE)
                 ),
                 
                 div(class = 'section',
                     h4(icon('motorcycle'), 'Travel'),
                     sliderInput(inputId = "tripVaccine", label= "Number of trips to a village for mass vaccination activity (1 round)", value = 1, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "vehicle_rent_Vaccine", label = "Number of trips for car rental during mass vaccination activity (one round)", min = 0, max = 15, value = 0, ticks = FALSE)
                 )
                 
          ),
          column(4,
                 div(class = 'section',
                     h4(icon('box'), "Equipment"),
                     sliderInput(inputId = "c_equip_Vaccine",label = "Equipment cost per village for mass vaccination activity (US$)",value = 200, min = 0, max = 100, ticks = FALSE)
                 ),
                 div(class = 'section',
                     h4(icon('tablets'), "Consumable"),
                     sliderInput(inputId = "Consum_Vaccine",label = "Consumable cost per dose for mass vaccination activity (US$)",value = 1, min = 0, max = 10, ticks = FALSE),
                     sliderInput(inputId = "Vaccine_cost",label = "Vaccine cost per dose for mass vaccination activity (US$)",value = 5, min = 0, max = 50, ticks = FALSE),
                     sliderInput(inputId = "Vaccine_wastage",label = "Vaccine wastage per village for mass vaccination activity (%)",value = 5, min = 0, max = 100, ticks = FALSE)
                 )
          ),
          column(4,
                 div(class = 'section',
                     h4(icon('chalkboard-teacher'), 'Training'),
                     sliderInput(inputId = "Train_Vaccine_session",label = "Number of training sessions for mass vaccination activity",value = 1, min = 0, max = 10, ticks = FALSE),
                     sliderInput(inputId = "Trainee_Vaccine",label = "Number of participants attend in one training session for mass vaccination activity",value = 10, min = 0, max = 50, ticks = FALSE),
                     sliderInput(inputId = "Trainer_Vaccine",label = "Number of trainers in one training session for mass vaccination activity",value = 3, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "Train_day_Vaccine",label = "Duration of a training session for mass vaccination activity",value = 3, min = 0, max = 10, ticks = FALSE)
                 ),
                 div(class = 'section',
                     h4(icon('clipboard-check'), 'Monitoring and Supervision'),
                     sliderInput(inputId = "MonittripVaccine", label= "Number of monitoring trips for mass vaccination activity in one round", value = 1, min = 0, max = 3, ticks = FALSE),
                     sliderInput(inputId = "MonitdayVaccine", label= "Duration of monitoring trip for mass vaccination activity in one round", value = 10, min = 0, max = 30, ticks = FALSE)
                 )
          )
        )
)