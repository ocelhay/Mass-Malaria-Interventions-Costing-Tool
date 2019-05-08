bsModal("MDA", "Parameters for Mass Drug Administration", "par_mda", size = "large",
        fluidRow(
          column(4,
                 div(class = 'section',
                     h4('Baseline'),
                     sliderInput(inputId = "prop_vilMDA",label = "Percentage of villages that are offered MDA activity",value = 22, min = 0, max = 100, ticks = FALSE),
                     p("In one MDA round, full course of daily DHA/PPQ for 3 days and primaquine for day 1"),
                     sliderInput(inputId = "rounds",label = "Number of mass drug administration rounds in a year",value = 3, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "MDA_uptake",label = "Average population coverage for mass drug administration in a round (%)",value = 85, min = 0, max = 100, ticks = FALSE)
                 ),
                 
                 div(class = 'section',
                     h4(icon('users'), 'Personnel'),
                     sliderInput(inputId = "MDADays",label = "Number of days spent in a village for mass drug administration activity",value = 5, min = 0, max = 10, step = 0.5, ticks = FALSE)
                 ),
                 
                 div(class = 'section',
                     h4(icon('dollar-sign'), "Incentive"),
                     sliderInput(inputId = "c_incen_MDA",label = "Incentive for one participant in a round for mass drug administration activity (US$)",value = 0.64, min = 0, max = 10, ticks = FALSE)
                 ),
                 
                 div(class = 'section',
                     h4(icon('motorcycle'), 'Travel'),
                     h5("Field visit for mass drug administration activity"),
                     sliderInput(inputId = "tripMDA", label= "Number of trips to a village for mass drug administration activity (1 round)", value = 1, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "vehicle_rent_MDA", label = "Number of trips for car rental during mass drug administration activity (one round)", min = 0, max = 15, value = 11, ticks = FALSE)
                 )
                 
          ),
          column(4,
                 div(class = 'section',
                     h4(icon('box'), "Equipment"),
                     sliderInput(inputId = "c_equip_MDA",label = "Equipment cost per village for mass drug administration activity (US$)",value = 50, min = 0, max = 100, ticks = FALSE)
                 ),
                 div(class = 'section',
                     h4(icon('tablets'), "Consumable"),
                     sliderInput(inputId = "Consum_MDA",label = "Consumable cost per village for mass drug administration activity (US$)",value = 50, min = 0, max = 1000, ticks = FALSE),
                     sliderInput(inputId = "Drug_child", label = "Cost of DIHYDROARTEMISININ 20 mg + PIPERAQUINE 160 mg, 3x1 tab, blister child (Band 2)", value = 0.93, min = 0, max= 1.5, ticks = FALSE),
                     sliderInput(inputId = "Drug_youth", label = "Cost of DIHYDROARTEMISININ 20 mg + PIPERAQUINE 160 mg, 3x1 tab, blister youth (Band 3)", value = 1.46, min = 0, max= 2.5, ticks = FALSE),
                     sliderInput(inputId = "Drug_adult", label = "Cost of DIHYDROARTEMISININ 20 mg + PIPERAQUINE 160 mg, 3x1 tab, blister adult (Band 4)", value = 1.98, min = 0, max= 2.5, ticks = FALSE),
                     sliderInput(inputId = "Drug_prim", label = "Cost of primaquine 7.5mg base tablet", value = 0.01, min = 0, max= 0.1, ticks = FALSE),
                     sliderInput(inputId = "Drug_side_effect", label = "Cost of medicine for treatment of side effect per village", value = 100, min = 0, max= 200, ticks = FALSE),
                     sliderInput(inputId = "Drug_wastage", label = "antimalarial drug wastage (%)", value = 10, min = 0, max= 30, ticks = FALSE)
                 )
          ),
          column(4,
                 div(class = 'section',
                     h4(icon('chalkboard-teacher'), 'Training'),
                     sliderInput(inputId = "Train_MDA_session",label = "Number of training sessions for mass drug administration",value = 1, min = 0, max = 10, ticks = FALSE),
                     sliderInput(inputId = "Trainee_MDA",label = "Number of participants for mass drug administration training",value = 10, min = 0, max = 50, ticks = FALSE),
                     sliderInput(inputId = "Trainer_MDA",label = "Number of trainers for mass drug administration training",value = 3, min = 0, max = 5, ticks = FALSE),
                     sliderInput(inputId = "Train_day_MDA",label = "Duration of a training session for mass drug administration",value = 3, min = 0, max = 10, ticks = FALSE)
                 ),
                 div(class = 'section',
                     h4(icon('clipboard-check'), 'Monitoring and Supervision'),
                     sliderInput(inputId = "MonittripMDA", label= "Number of monitoring trips for mass drug administration activity (1 round)", value = 1, min = 0, max = 3, ticks = FALSE),
                     sliderInput(inputId = "MonitdayMDA", label= "Duration of monitoring trip for mass drug administration activity (1 round)", value = 10, min = 0, max = 30, ticks = FALSE)
                 )
          )
        )
)