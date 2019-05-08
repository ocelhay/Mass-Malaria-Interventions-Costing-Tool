bsModal("ITN", "Parameters for Epidemiology Studies", "par_epistudyon",
        fluidRow(
          column(6,
                     sliderInput(inputId = "ResearchDays",label = "Number of days spent in a village for epidemiological study activity",value = 1, min = 0, max = 10, step = 0.5, ticks = FALSE),
                     
                     h4("Staff involved in epidemiological study activity"),
                     sliderInput(inputId = "StaffResearchTL", label = "Team Leader/ Program manager/ Supervisor", value= 1, min= 0, max= 3, ticks = FALSE),
                     sliderInput(inputId = "StaffResearchCEC", label = "Program manager assistant/ logistics assistant/ medic", value= 3, min= 0, max= 3, ticks = FALSE),
                     sliderInput(inputId = "StaffResearchHelper", label = "Helper/ Community Health Worker/ Volunteer", value= 3, min= 0, max= 3, ticks = FALSE),
                     sliderInput(inputId = "StaffResearchFieLog", label = "Logistics (field)", value= 1, min= 0, max= 3, ticks = FALSE)
          ),
          column(6,
                 h4("Activities to include in the epidemiology study"),
                 switchInput(inputId = "censuson", value = TRUE, inline = TRUE, size = "small"), HTML("Census/Mapping"),
                 conditionalPanel(condition = "input.censuson == true",
                                  sliderInput(inputId = "census_no", label = "How many times do you collect GIS data/census per year", min = 0, max = 3, value = 1, ticks = FALSE),
                                  sliderInput(inputId = "prop_vilcensus", label = "Percentage of villages to collect census (%)", min = 0, max = 100, value = 50, ticks = FALSE)
                 ),
                 switchInput(inputId = "fgdon", value = FALSE, inline = TRUE, size = "small"), HTML("Focus group discussion"),
                 conditionalPanel(condition = "input.fgdon == true",
                                  sliderInput(inputId = "fgd_no", label = "How many times do you perform focus group discussion per year", min= 0, max= 3, value = 2, ticks = FALSE),
                                  sliderInput(inputId = "prop_vilfgd", label = "Percentage of villages to conduct focus group discussion (%)", min = 0, max = 100, value = 20, ticks = FALSE)
                 ),
                 switchInput(inputId = "id_interviewon", value = FALSE, inline = TRUE, size = "small"), HTML("Indepth interview"),
                 conditionalPanel(condition = "input.id_interviewon == true",
                                  sliderInput(inputId = "id_interview_no", label = "How many times perform indept interview", min = 0, max = 12, value = 1, ticks = FALSE),
                                  sliderInput(inputId = "prop_vil_id_interview", label = "Percentage of villages to perform indept interview (%)", min = 0, max = 100, value = 20, ticks = FALSE)
                 ),
                 switchInput(inputId = "extraqPCRon", value = TRUE, inline = TRUE, size = "small"), HTML("Extra qPCR round for epidemiology survey"),
                 conditionalPanel(condition = "input.extraqPCRon == true",
                                  sliderInput(inputId = "eqPCR_no", label = "Number of extra qPCR rounds per year", value = 3, min = 0, max = 4, ticks = FALSE),
                                  sliderInput(inputId = "prop_vilextraqPCR", label = "Percentage of villages to perform extra qPCR rounds", min = 0, max = 100, value = 50, ticks = FALSE),
                                  sliderInput(inputId = "eqPCR_samplesize", label = "Sample size", min = 0, max = 100, value = 50, ticks = FALSE)
                 )
          )
        )
)