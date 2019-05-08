bsModal("MASS", "Staff Involved in Any Mass Intervention", "par_mass",
        h5("Team for monitoring of mass drug administration"),
        sliderInputSplit(inputId = "StaffTMTMonitP_Dir", label = "Program manager", value = 1, min = 0, max = 3, ticks = FALSE),
        sliderInputSplit(inputId = "StaffTMTMonitMonitor", label = "Monitor", value = 1, min = 0, max = 3, ticks = FALSE),
        sliderInputSplit(inputId = "StaffTMTMonitTL", label = "Team Leader/ Medical Officer/ Supervisor", value = 1, min = 0, max = 3, ticks = FALSE),
        sliderInputSplit(inputId = "StaffMDATL", label = "Team Leader/ Program manager/ Supervisor", value= 1, min= 0, max= 3, ticks = FALSE),
        sliderInputSplit(inputId = "StaffMDACEC", label = "Program manager assistant/ logistics assistant/ medic", value= 1, min= 0, max= 3, ticks = FALSE),
        sliderInputSplit(inputId = "StaffMDAHelper", label = "Helper/ Community Health Worker/ Volunteer", value= 2, min= 0, max= 3, ticks = FALSE),
        sliderInputSplit(inputId = "StaffMDAFieLog", label = "Logistics (field)", value= 0, min= 0, max= 3, ticks = FALSE)
)