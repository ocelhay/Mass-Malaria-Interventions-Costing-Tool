bsModal("MVDA", "Parameters for Mass Drug Administration + Mass Vaccination", "par_mvda", size = "large",
        fluidRow(
          column(4,
                 div(class = 'section',
                     h4(icon('cog'), 'Baseline'),
                     sliderInput(inputId = "prop_vilMVDA",label = "Percentage of villages that are offered Mass drug administration and mass vaccination activity",value = 100, min = 0, max = 100, ticks = FALSE),
                     sliderInput(inputId = "MVDAround",label = "Number of mass drug administration and mass vaccination rounds in a year",value = 3, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "MVDAcoverage",label = "Average population coverage for mass drug administration and mass vaccination activity in a round (%)",value = 50, min = 0, max = 100, ticks = FALSE),
                     checkboxInput(inputId = "MVDAboosteron", label = "Booster dose after one year", value = FALSE),
                     conditionalPanel(
                       condition = "input.MVDAboosteron == true",
                       sliderInput(inputId = "MVDA_booster_coverage", label = "Booster dose coverage based on the population who has previously complete dose of vaccination (%)", value = 50, min = 0, max = 100, ticks = FALSE)
                     )
                 ),
                 
                 div(class = 'section',
                     h4(icon('users'), 'Personnel'),
                     sliderInput(inputId = "MVDADays",label = h5("Number of days spent in a village for mass drug administration and mass vaccination activity"),value = 7, min = 0, max = 10, step = 0.5, ticks = FALSE)
                 ),
                 
                 div(class = 'section',
                     h4(icon('dollar-sign'), "Incentive"),
                     sliderInput(inputId = "c_incen_MVDA",label = "Incentive for one participant in a round for MVDA (US$)",value = 0.64, min = 0, max = 10, ticks = FALSE)
                 ),
                 
                 div(class = 'section',
                     h4(icon('motorcycle'), 'Travel'),
                     h5("Field visit for mass drug administration and mass vaccination activity"),
                     sliderInput(inputId = "tripMVDA", label= "Number of trips to a village for mass drug administration plus mass vaccination activity (1 round)", value = 1, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "vehicle_rent_MVDA", label = "Number of trips for car rental during mass drug administration activity and mass vaccination activity(one round)", min = 0, max = 15, value = 0, ticks = FALSE)
                 )
                 
          ),
          column(4,
                 div(class = 'section',
                     h4(icon('box'), "Equipment"),
                     sliderInput(inputId = "c_equip_MVDA",label = "Equipment cost per village for mass drug administration and mass screening activity (US$)",value = 50, min = 0, max = 100, ticks = FALSE)
                 ),
                 div(class = 'section',
                     h4(icon('tablets'), "Consumable"),
                     sliderInput(inputId = "Consum_MVDA",label = "Consumable cost per village for mass drug administration and mass vaccination activity (US$)",value = 80, min = 0, max = 1000, ticks = FALSE),
                     
                     sliderInput(inputId = "MVDA_child", label = "Cost of antimalarial drug + vaccine for child (one round)", value = 4, min = 0, max= 10, ticks = FALSE),
                     sliderInput(inputId = "MVDA_youth", label = "Cost of antimalarial drug + vaccine for  youth (one round)", value = 5, min = 0, max= 10, ticks = FALSE),
                     sliderInput(inputId = "MVDA_adult", label = "Cost of antimalarial drug + vaccine for adult (one round)", value = 6, min = 0, max= 10, ticks = FALSE),
                     sliderInput(inputId = "MVDA_side_effect", label = "Cost of medicine for treatment of side effect per village (one round)", value = 100, min = 0, max= 200, ticks = FALSE),
                     sliderInput(inputId = "MVDA_wastage", label = "antimalarial drug wastage (%)", value = 10, min = 0, max= 30, ticks = FALSE)
                 )
          ),
          column(4,
                 div(class = 'section',
                     h4(icon('chalkboard-teacher'), 'Training'),
                     sliderInput(inputId = "Train_MVDA_session",label = "Number of training sessions for mass drug administration and mass vaccination activity",value = 1, min = 0, max = 10, ticks = FALSE),
                     sliderInput(inputId = "Trainee_MVDA",label = "Number of participants for mass drug administration and mass vaccination training",value = 10, min = 0, max = 50, ticks = FALSE),
                     sliderInput(inputId = "Trainer_MVDA",label = "Number of trainers for mass drug administration and mass vaccination training",value = 3, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "Train_day_MVDA",label = "Duration of a training session for mass drug administration and mass vaccination activity",value = 3, min = 0, max = 10, ticks = FALSE)
                 ),
                 div(class = 'section',
                     h4(icon('clipboard-check'), 'Monitoring and Supervision'),
                     sliderInput(inputId = "MonittripMVDA", label= "Number of monitoring trips for mass drug administration activity (1 round)", value = 1, min = 0, max = 3, ticks = FALSE),
                     sliderInput(inputId = "MonitdayMVDA", label= "Duration of monitoring trip for mass drug administration activity (1 round)", value = 10, min = 0, max = 30, ticks = FALSE)
                 )
          )
        )
)