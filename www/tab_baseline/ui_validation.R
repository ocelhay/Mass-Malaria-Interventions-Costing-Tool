div(class= 'section_validation',
    hr(),
    p('(Optionnal) Track settings that have been validated by checking all ', icon("check-square"), 'Okay boxes:'),
    
    conditionalPanel(condition = "input.common_program_valid == true",
                     div(class= 'validation-text', span(icon('check'), 'Programme Assumptions & Existing Interventions'))
    ),
    conditionalPanel(condition = "input.common_program_valid != true",
                     span(icon('question-circle'), 'Programme Assumptions & Existing Interventions')
    ),
    
    conditionalPanel(condition = "input.common_field_visit_valid == true",
                     div(class= 'validation-text', span(icon('check'), 'Field Visits for Various Activities'))
    ),
    conditionalPanel(condition = "input.common_field_visit_valid != true",
                     span(icon('question-circle'), 'Field Visits for Various Activities')
    ),
    
    conditionalPanel(condition = "input.common_access_valid == true",
                     div(class= 'validation-text', span(icon('check'), 'Villages Accessibility'))
    ),
    conditionalPanel(condition = "input.common_access_valid != true",
                     span(icon('question-circle'), 'Villages Accessibility')
    ),
    
    
    conditionalPanel(condition = "input.common_central_valid == true",
                     div(class= 'validation-text', span(icon('check'), 'Central Office'))
    ),
    conditionalPanel(condition = "input.common_central_valid != true",
                     span(icon('question-circle'), 'Central Office')
    ),
    
    conditionalPanel(condition = "input.common_sal_management == true",
                     div(class= 'validation-text', span(icon('check'), 'Salaries for Central Staff'))
    ),
    conditionalPanel(condition = "input.common_sal_management != true",
                     span(icon('question-circle'), 'Salaries for Central Staff')
    ),
    
    conditionalPanel(condition = "input.common_field_valid == true",
                     div(class= 'validation-text', span(icon('check'), 'Field Office'))
    ),
    conditionalPanel(condition = "input.common_field_valid != true",
                     span(icon('question-circle'), 'Field Office')
    ),
    
    conditionalPanel(condition = "input.common_sal_field == true",
                     div(class= 'validation-text', span(icon('check'), 'Salaries for Field Staff'))
    ),
    conditionalPanel(condition = "input.common_sal_field != true",
                     span(icon('question-circle'), 'Salaries for Field Staff')
    ),
    conditionalPanel(condition = "input.common_program_travel == true",
                     div(class= 'validation-text', span(icon('check'), 'Travel Costs'))
    ),
    conditionalPanel(condition = "input.common_program_travel != true",
                     span(icon('question-circle'), 'Travel Costs')
    ),
    conditionalPanel(condition = "input.common_program_training == true",
                     div(class= 'validation-text', span(icon('check'), 'Training'))
    ),
    conditionalPanel(condition = "input.common_program_training != true",
                     span(icon('question-circle'), 'Training')
    ),
    
    conditionalPanel(condition = "input.chw_valid == true",
                     div(class= 'validation-text', span(icon('check'), 'Community Health Workers'))
    ),
    conditionalPanel(condition = "input.CHWon == true && input.chw_valid != true",
                     span(icon('question-circle'), 'Community Health Workers')
    ),
    conditionalPanel(condition = "input.ui_itn_valid == true",
                     div(class= 'validation-text', span(icon('check'), 'Distribution of ITNs'))
    ),
    conditionalPanel(condition = "input.ITNon == true && input.ui_itn_valid != true",
                     span(icon('question-circle'), 'Distribution of ITNs')
    ),
    hr()
)