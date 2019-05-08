ui <- function(request) { fluidPage(
  theme = shinytheme("flatly"),
  # Link to CSS
  includeCSS("./www/styles.css"),
  
  # Change default slider
  chooseSliderSkin('HTML5'),
  
  # Application title
  
  htmlOutput("total_cost"),
  navbarPage("Mass Malaria Interventions Costing Tool",
             tabPanel("Welcome", 
                      includeMarkdown("www/intro.md"),
                      fluidRow(
                        column(6, includeMarkdown("www/intro_2.md")),
                        column(6, includeMarkdown("www/intro_3.md"))
                      )
             ),
             
             # Baseline ----
             tabPanel("Baseline", 
                      fluidRow(
                        column(4, source("./www/tab_baseline/ui_common_program.R", local = TRUE)$value),
                        column(3, source("./www/tab_baseline/ui_common_access.R", local = TRUE)$value),
                        column(3, source("./www/tab_baseline/ui_common_field_visit.R", local = TRUE)$value),
                        column(2, source("./www/tab_baseline/ui_validation.R", local = TRUE)$value)),
                      br(), br(),
                      
                      h4('Costs and Salaries (in US$):'),
                      fluidRow(
                        column(2, source("./www/tab_baseline/ui_common_central.R", local = TRUE)$value),
                        column(2, source("./www/tab_baseline/ui_common_sal_management.R", local = TRUE)$value),
                        column(2, source("./www/tab_baseline/ui_common_field.R", local = TRUE)$value),
                        column(2, source("./www/tab_baseline/ui_common_sal_field.R", local = TRUE)$value),
                        column(2, source("./www/tab_baseline/ui_common_travel.R", local = TRUE)$value),
                        column(2, source("./www/tab_baseline/ui_common_training.R", local = TRUE)$value)
                      )
             ),
             
             # Interventions ----
             tabPanel("Mass Interventions",
                      fluidRow(column(4,
                                      h3('Preparation'),
                                      p("Community engagement is an essential intervention to encourage villages and communities to participate in all mass interventions related activities."), 
                                      switchInput(inputId = "CEon", value = FALSE, inline = TRUE, size = "small"), HTML("Community Engagement"),
                                      br(),
                                      conditionalPanel(condition = "input.CEon == true",
                                                       actionButton("par_ce", span(icon("gear"), "Settings")),
                                                       source("./www/tab_mass/ui_ce.R", local = TRUE)$value
                                      ),
                                      
                                      h3("Targeting Strategy"),
                                      prettyRadioButtons(inputId = "qPCRon", label = h5("Select a strategy for the selection of villages:"), 
                                                         choices = c("Mass Blood Survey with quantitative PCR (qPCR)" = "qPCR",
                                                                     "Hotspot Villages Based on Surveillance System" = "sur",
                                                                     "No Targeting (all villages)" = "full"), selected = "full"),
                                      
                                      
                                      conditionalPanel(condition = "input.qPCRon == 'qPCR'",
                                                       actionButton("par_qpcr", span(icon("gear"), "Parameters specific to qPCR")),
                                                       source("./www/tab_mass/ui_qpcr.R", local = TRUE)$value
                                      ),
                                      conditionalPanel(condition = "input.qPCRon == 'sur'",
                                                       sliderInputSplit(inputId = "prop_vilsur", label = h5("Percentage of Villages Selected"),
                                                                        value = 50, min = 0, max = 100, step = 1, post = '%', ticks = FALSE)
                                      )
                      ),
                      column(4,
                             h3('Malaria Mass Intervention'),
                             prettyRadioButtons(inputId = "interventions", label = h5('Select one Mass Intervention:'), 
                                                choices = c("None" = "no",
                                                            "Mass Drug Administration (MDA)" = "MDAon",
                                                            "Mass Screening and Treatment (MSAT)" = "MSATon",
                                                            "Mass Vaccination" = "Vaccineon",
                                                            "Mass Vaccination + MDA" = "MVDAon",
                                                            "Mass Vaccination + MSAT" = "MVSATon"), 
                                                selected = "no"),
                             
                             conditionalPanel(condition = "input.interventions!='no'",
                                              actionButton("par_mass", span(icon("gear"), "Settings Common to All Mass Intervention")),
                                              source("./www/tab_mass/ui_mass.R", local = TRUE)$value
                             ),
                             br(),
                             # Conditional MDAon ----
                             conditionalPanel(condition = "input.interventions=='MDAon'",
                                              actionButton("par_mda", span(icon("gear"), "Mass Drug Administration (MDA)")),
                                              source("./www/tab_mass/ui_mda.R", local = TRUE)$value
                             ),
                             
                             # Conditional MSATon ----
                             conditionalPanel(condition = "input.interventions=='MSATon'",
                                              actionButton("par_msat", span(icon("gear"), "Mass Screening and Treatment (MSAT)")),
                                              source("./www/tab_mass/ui_msat.R", local = TRUE)$value
                             ),
                             
                             # Conditional Vaccineon ----
                             conditionalPanel(condition = "input.interventions=='Vaccineon'",
                                              actionButton("par_vaccine", span(icon("gear"), "Mass Vaccination")),
                                              source("./www/tab_mass/ui_vaccine.R", local = TRUE)$value
                             ),
                             
                             # Conditional MVDAon ----
                             conditionalPanel(condition = "input.interventions=='MVDAon'",
                                              actionButton("par_mvda", span(icon("gear"), "Mass Vaccination + MDA")),
                                              source("./www/tab_mass/ui_mvda.R", local = TRUE)$value
                             ),
                             
                             # Conditional MVSATon ----
                             conditionalPanel(condition = "input.interventions=='MVSATon'",
                                              actionButton("par_mvsat", span(icon("gear"), "Mass Vaccination + MSAT")),
                                              source("./www/tab_mass/ui_mvsat.R", local = TRUE)$value
                             )
                      ),
                      column(4,
                             h3('Evaluation'),
                             
                             p('Evaluate the impact of the Mass Intervention with epidemiological studies'),
                             
                             switchInput(inputId = "epistudyon", value = FALSE, inline = TRUE, size = "small"), HTML("Epidemiological studies"),
                             conditionalPanel(condition = "input.epistudyon == true",
                                              actionButton("par_epistudyon", span(icon("gear"), "Settings")),
                                              source("./www/tab_mass/ui_epistudyon.R", local = TRUE)$value
                             )
                      )
                      )
             ),
             tabPanel("(Optional) Extra Costs",
                      h3("(Optional) Extra Costs"),
                      p("You can include any additional costs here."),
                      
                      fluidRow(
                        column(4,
                               textInput(inputId = "t1_name", label = "Name of item"),
                               textInput(inputId = "t2_name", label = NULL),
                               textInput(inputId = "t3_name", label = NULL),
                               textInput(inputId = "t4_name", label = NULL),
                               textInput(inputId = "t5_name", label = NULL),
                               textInput(inputId = "t6_name", label = NULL)
                        ),
                        column(2,
                               numericInput(inputId = "t1_no", label = "Number of item", value = 0),
                               numericInput(inputId = "t2_no", label = NULL, value = 0),
                               numericInput(inputId = "t3_no", label = NULL, value = 0),
                               numericInput(inputId = "t4_no", label = NULL, value = 0),
                               numericInput(inputId = "t5_no", label = NULL, value = 0),
                               numericInput(inputId = "t6_no", label = NULL, value = 0)
                        ),
                        column(2,
                               numericInput(inputId = "t1_value", label = "Price per item", value = 0),
                               numericInput(inputId = "t2_value", label = NULL, value = 0),
                               numericInput(inputId = "t3_value", label = NULL, value = 0),
                               numericInput(inputId = "t4_value", label = NULL, value = 0),
                               numericInput(inputId = "t5_value", label = NULL, value = 0),
                               numericInput(inputId = "t6_value", label = NULL, value = 0)
                        )
                      )
             ),
             tabPanel("Detailed Costs",
                      
                      div(class= "float-save",
                          p("Save State of the App:"),
                          bookmarkButton(),
                          br(), br(),
                          p('File of Summary Costs:'),
                          downloadButton("downloadData", "Download")
                      ),
                      
                      
                      # Breakdown of program costs ----
                      h3(icon('chart-pie'), 'Breakdown of Operation Costs'),
                      fluidRow(column(4,
                                      p('What is the estimated breakdown of operatonal costs which include costs for central office and salaries of central/management staff.'),
                                      p('It can add-up to 100% or less if the structural costs are also used for operations that are not part of this App')
                      ),
                      column(4,
                             # p('Existing Interventions:'),
                             conditionalPanel(condition = "input.CHWon == true",
                                              sliderInputSplit(inputId = "program_CHW",label = "Community health worker program",value = 36, min = 0, max = 100, step = 1, post = '%', ticks= FALSE)
                             ),
                             
                             conditionalPanel(condition = "input.ITNon == true",
                                              sliderInputSplit(inputId = "program_ITN",label = "Distribution of insecticide treated bed nets",value = 10, min = 0, max = 100, step = 1, post = '%', ticks= FALSE)
                             ),
                             # p('Mass Interventions:'),
                             conditionalPanel(condition = "input.CEon == true",
                                              sliderInputSplit(inputId = "program_CE",label = "Community engagement",value = 10, min = 0, max = 100, step = 1, post = '%', ticks= FALSE)
                             ),
                             conditionalPanel(condition = "input.qPCRon == 'qPCR'",
                                              sliderInputSplit(inputId = "program_qPCR",label = "Mass Blood Survey with qPCR", value = 6, min = 0, max = 100, step = 1, post = '%', ticks= FALSE)
                             ),
                             conditionalPanel(condition = "input.interventions == 'MDAon'",
                                              sliderInputSplit(inputId = "program_MDA", label = 'Mass Drug Administration',value = 20, min = 0, max = 100, step = 1,post = '%', ticks= FALSE)
                             ),
                             conditionalPanel(condition = "input.interventions == 'MSATon'",
                                              sliderInputSplit(inputId = "program_MSAT", label = 'Mass Screening and Treatment', value = 10, min = 0, max = 100, step = 1, post = '%', ticks= FALSE)
                             ),
                             
                             conditionalPanel(condition = "input.interventions == 'Vaccineon'",
                                              sliderInputSplit(inputId = "program_Vaccine", label = 'Mass Vaccination', value = 10, min = 0, max = 100, step = 1, post = '%', ticks= FALSE)
                             ),
                             
                             conditionalPanel(condition = "input.interventions == 'MVDAon'",
                                              sliderInputSplit(inputId = "program_MVDA",label = "Mass Vaccination + MDA",value = 20, min = 0, max = 100, step = 1, post = '%', ticks= FALSE)
                             ),
                             
                             conditionalPanel(condition = "input.interventions== 'MVSATon'",
                                              sliderInputSplit(inputId = "program_MVSAT", label = 'Mass Vaccination + MSAT', value = 10, min = 0, max = 100, step = 1, post = '%', ticks= FALSE)
                             ),
                             conditionalPanel(condition = "input.epistudyon == true",
                                              sliderInputSplit(inputId = "program_research",label = "Epidemiological study",value = 18, min = 0, max = 100, step = 1,post = '%', ticks= FALSE)
                             ),
                             htmlOutput("check_pct")
                      )
                      ),
                      
                      
                      # Server outputs
                      
                      fluidRow(column(12,
                                      h2("Summary of Costs"),
                                      dataTableOutput("table_costs"),
                                      p("All figures are in US$")
                      )
                      ),
                      fluidRow(
                        column(6, plotOutput("plot_cost_category", height = '500px')),
                        column(6, plotOutput("plot_cost_activity", height = '500px'))
                      ),
                      fluidRow(
                        column(6, dataTableOutput("unit_costs_1")),
                        column(6, dataTableOutput("unit_costs_2"))
                      ),
                      br(), br(), br(),
                      actionLink('advanced_panel', 'Advanced (beta)'),
                      source("./www/tab_costs/ui_advanced.R", local = TRUE)$value
             )
  )
)
}