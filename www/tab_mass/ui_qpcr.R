bsModal("qPCR", "Parameters for Mass Blood Survey with quantitative PCR (qPCR)", "par_qpcr", size = "large",
        fluidRow(
          column(4,
                 div(class = 'section',
                     h4('Baseline'),
                     sliderInputSplit(inputId = "prop_vilqPCR", label = h5("Percentage of villages surveyed to identify hotspot villages"),value = 76, min = 0, max = 100, step = 1, post = '%', tick = FALSE)
                 ),
                 div(class = 'section',
                     h4(icon('users'), 'Personnel'),
                     conditionalPanel(condition = "input.qPCRon == 'qPCR'",
                                      sliderInput(inputId = "qPCRDays",label = h5("Number of days spent in a village for mass blood survey activity to identify hotspot villages"),value = 1, min = 0, max = 10, step= 0.5, tick = FALSE),
                                      h5("Staff involved in mass blood survey activity"),
                                      sliderInput(inputId = "StaffqPCRTL", label = "Team Leader/ Program manager/ Supervisor", value = 0, min = 0, max = 3, tick = FALSE),
                                      sliderInput(inputId = "StaffqPCRCEC", label = "Program manager assistant/ logistics assistant/ medic", value = 2, min = 0, max = 5, tick = FALSE),
                                      sliderInput(inputId = "StaffqPCRLab", label = "Laboratory person", value = 0, min = 0, max = 5, tick = FALSE),
                                      sliderInput(inputId = "StaffqPCRHelper", label = "Helper/ Community Health Worker/ Volunteer", value = 2, min = 0, max = 5, tick = FALSE)
                     )
                 ),
                 
                 div(class = 'section',
                     h4(icon('dollar-sign'), "Incentive"),
                     conditionalPanel(condition = "input.qPCRon == 'qPCR'",
                                      h5("Incentive for mass blood survey activity to identify hotspot villages"),
                                      sliderInput(inputId = "c_incen_qPCR",label = "Incentive for a participant for blood donation (US$)",value = 1.44, min = 0, max = 3, tick = FALSE)
                     )
                     
                 )
                 
                 
                 
          ),
          column(4,
                 div(class = 'section',
                     h4(icon('box'), "Equipment"),
                     conditionalPanel(condition = "input.qPCRon == 'qPCR'",
                                      h5("Equipment cost for mass blood survey activity"),
                                      sliderInput(inputId = "c_equip_qPCR",label = "Equipment cost per village for mass blood survey activity (US$)",value = 13, min = 0, max = 100, tick = FALSE)
                     )
                 ),
                 div(class = 'section',
                     h4(icon('tablets'), "Consumable"),
                     conditionalPanel(condition = "input.qPCRon == 'qPCR'",
                                      h5("Mass blood screening activity to identify hotspot villages"),
                                      sliderInput(inputId = "Consum_qPCR",label = "Consumable cost for qPCR per test (US$)",value = 0.6, min = 0, max = 5, tick = FALSE),
                                      sliderInput(inputId = "c_qPCRanalysis",label = "qPCR analysis cost per test (US$)",value = 40, min = 0, max = 150, tick = FALSE)
                     )
                     
                 ),
                 div(class = 'section',
                     h4(icon('motorcycle'), 'Travel'),
                     conditionalPanel(condition = "input.qPCRon == 'qPCR'",
                                      h5("Field visit for mass blood survey activity"),
                                      sliderInput(inputId = "tripqPCR", label= "Number of trips to a village for mass blood survey activity to identify hotspot villages", value = 1, min = 0, max = 5, tick = FALSE),
                                      sliderInput(inputId = "vehicle_rent_qPCR", label = "Number of trips for car rental during qPCR", min = 0, max = 10, value = 0, tick = FALSE)
                     )
                     
                 )
          ),
          column(4,
                 div(class = 'section',
                     h4(icon('chalkboard-teacher'), 'Training'),
                     conditionalPanel(condition = "input.qPCRon == 'qPCR'",
                                      h5("Training for mass blood survey to identify hotspot villages"),
                                      sliderInput(inputId = "Train_qPCR_session",label = "Number of training sessions for qPCR method",value = 1, min = 0, max = 10, tick = FALSE),
                                      sliderInput(inputId = "Trainee_qPCR",label = "Number of participants for qPCR training",value = 10, min = 0, max = 50, tick = FALSE),
                                      sliderInput(inputId = "Trainer_qPCR",label = "Number of trainers for qPCR training",value = 2, min = 0, max = 5, tick = FALSE),
                                      sliderInput(inputId = "Train_day_qPCR",label = "Duration of a training session for qPCR method",value = 1, min = 0, max = 10, tick = FALSE)
                     )
                 ),
                 div(class = 'section',
                     h4(icon('clipboard-check'), 'Monitoring and Supervision'),
                     conditionalPanel(condition = "input.qPCRon == 'qPCR'",
                                      h5("Monitoring for mass blood survey activity"), 
                                      sliderInput(inputId = "MonittripqPCR", label= "Number of trips for monitoring qPCR activity", value = 1, min = 0, max = 2, tick = FALSE),
                                      sliderInput(inputId = "MonitdayqPCR", label= "Number of days spent on monitoring qPCR activity", value = 5, min = 0, max = 20, tick = FALSE)
                     )
                     
                 )
          )
        )
)