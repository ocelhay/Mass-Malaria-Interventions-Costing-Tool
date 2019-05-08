function(input, output, session) {
  
  # Computations of a cost matrix ----
  total_costs <- reactive({
    
    # Normalisation ----
    program_CE           <- input$program_CE/100
    program_qPCR         <- input$program_qPCR/100
    program_MDA          <- input$program_MDA/100
    program_MSAT_norm    <- input$program_MSAT/100
    program_Vaccine_norm <- input$program_Vaccine/100
    program_MVDA_norm    <- input$program_MVDA/100
    program_MVSAT_norm   <- input$program_MVSAT/100
    program_CHW          <- input$program_CHW/100
    program_ITN          <- input$program_ITN/100
    program_research     <- input$program_research/100

    MDA_uptake                   <- input$MDA_uptake/100
    MSATcoverage_norm            <- input$MSATcoverage/100
    MVDAcoverage_norm            <- input$MVDAcoverage/100
    MVSATcoverage_norm           <- input$MSATcoverage/100
    Vaccinecoverage_norm         <- input$Vaccinecoverage/100
    MVDA_booster_coverage_norm   <- input$MVDA_booster_coverage/100
    MVSAT_booster_coverage_norm  <- input$MVSAT_booster_coverage/100
    Vaccine_booster_coverage_norm<- input$Vaccine_booster_coverage/100
    hrdt_pos_norm                <- input$hrdt_pos/100
    MVSAT_pos                    <- input$MVSAT_pos/100
    wastage                      <- input$Drug_wastage/100
    Vaccine_wastage              <- input$Vaccine_wastage/100
    MVSAT_wastage                <- input$MVSAT_wastage/100

    CEVil             <- ceiling(input$No_villages * (input$prop_vilCE / 100))



    if(input$qPCRon == "qPCR"){
      qPCRVil <- ceiling(input$No_villages * (input$prop_vilqPCR / 100))
      MDAVil <- ceiling(input$No_villages * (input$prop_vilMDA / 100) * (input$prop_vilqPCR / 100))
      MSATvil <- ceiling(input$No_villages * (input$prop_vilMSAT/100) * (input$prop_vilqPCR/ 100))
      Vaccinevil <- ceiling(input$No_villages * (input$prop_vilVaccine/100) * (input$prop_vilqPCR/ 100))
      MVDAvil <- ceiling(input$No_villages * (input$prop_vilMVDA/100) * (input$prop_vilqPCR/ 100))
      MVSATvil <- ceiling(input$No_villages * (input$prop_vilMVSAT/100) * (input$prop_vilqPCR/ 100))
    }

    if(input$qPCRon == "sur"){
      qPCRVil <- 0
      MDAVil <- ceiling(input$No_villages * (input$prop_vilMDA / 100) *(input$prop_vilsur / 100))
      MSATvil <- ceiling(input$No_villages * (input$prop_vilMSAT/100) * (input$prop_vilsur/ 100))
      Vaccinevil <- ceiling(input$No_villages * (input$prop_vilVaccine/100) * (input$prop_vilsur/ 100))
      MVDAvil <- ceiling(input$No_villages * (input$prop_vilMVDA/100) * (input$prop_vilsur/ 100))
      MVSATvil <- ceiling(input$No_villages * (input$prop_vilMVSAT/100) * (input$prop_vilsur/ 100))
    }

    if(input$qPCRon == "full"){
      qPCRVil <- 0
      MDAVil <- input$No_villages
      MSATvil <- input$No_villages
      Vaccinevil <- input$No_villages
      MVDAvil <- input$No_villages
      MVSATvil <- input$No_villages
    }

    census_vil        <- ceiling(input$No_villages * (input$prop_vilcensus/100))
    eqPCR_vil         <- ceiling(input$No_villages * (input$prop_vilextraqPCR/100))
    fgd_vil           <- ceiling(input$No_villages * (input$prop_vilfgd/100))
    id_interview_vil  <- ceiling(input$No_villages * (input$prop_vil_id_interview/100))
    #ceiling((input$prop_vilMVSAT/100) * input$No_villages))
    CHW_exist_No      <- ceiling((input$prop_vilexistCHW/100) * input$No_villages)
    ITNvil            <- ceiling(input$No_villages * (input$prop_vilITN / 100))
    censuson          <- input$censuson
    census_no         <- input$census_no
    fgdon             <- input$fgdon
    fgd_no            <- input$fgd_no
    
    id_interviewon    <- input$id_interviewon
    id_interview_no   <- input$id_interview_no
    
    extraqPCRon       <- input$extraqPCRon
    eqPCR_no          <- input$eqPCR_no
    
    eqPCR_samplesize  <- input$eqPCR_samplesize
    CEon              <- input$CEon
    qPCRon            <- switch(input$qPCRon, qPCR = 1, sur = 0, full = 0)
    MDAon             <- ifelse(input$interventions == "MDAon", 1, 0)
    MSATon            <- ifelse(input$interventions == "MSATon", 1, 0)
    Vaccineon         <- ifelse(input$interventions == "Vaccineon", 1, 0)
    MVDAon            <- ifelse(input$interventions == "MVDAon", 1, 0)
    MVSATon           <- ifelse(input$interventions == "MVSATon", 1, 0)
    Vaccineboosteron  <- input$Vaccineboosteron
    MVDAboosteron     <- input$MVDAboosteron
    MVSATboosteron    <- input$MVSATboosteron
    CHWon             <- input$CHWon
    ITNon             <- input$ITNon
    Trainingon        <- input$Trainingon
    Monitoringon      <- input$Monitoringon
    Managementon      <- input$Managementon
    epistudyon        <- input$epistudyon

    inf               <- input$inf/100
    sal_increase      <- input$sal_increase/100
    MDA_rounds        <- input$rounds

    ResearchDays           <- input$ResearchDays
    StaffResearchTL        <- input$StaffResearchTL
    StaffResearchCEC       <- input$StaffResearchCEC
    StaffResearchHelper    <- input$StaffResearchHelper
    StaffResearchFieLog    <- input$StaffResearchFieLog

    tripCE                 <- input$tripCE
    tripqPCR               <- input$tripqPCR
    tripMDA                <- input$tripMDA

    c_motorbike            <- input$c_motorbike
    c_rentedcar            <- input$c_rentedcar
    c_owncar               <- input$c_owncar
    c_boat                 <- input$c_boat
    c_foot                 <- 0
    c_travel_central_field <- input$c_travel_central_field

    prop_vil_bike     <- input$prop_vil_bike/100
    prop_vil_rentedcar<- input$prop_vil_rentedcar/100
    prop_vil_owncar   <- input$prop_vil_owncar/100
    prop_vil_boat     <- input$prop_vil_boat/100
    prop_vil_foot     <- input$prop_vil_foot/100

    vehicle_rent_CE   <- input$vehicle_rent_CE
    vehicle_rent_qPCR <- input$vehicle_rent_qPCR
    vehicle_rent_MDA  <- input$vehicle_rent_MDA

    fie_visit         <- input$fie_visit
    perdium           <- input$perdium
    accom             <- input$accom
    fie_days          <- input$fie_days

    Train_CHW_session <- input$Train_CHW_session
    Trainee_CHW       <- input$Trainee_CHW
    Trainer_CHW       <- input$Trainer_CHW
    Train_day_CHW     <- input$Train_day_CHW

    Train_CE_session  <- input$Train_CE_session
    Trainee_CE        <- input$Trainee_CE
    Trainer_CE        <- input$Trainer_CE
    Train_day_CE      <- input$Train_day_CE

    Train_qPCR_session <- input$Train_qPCR_session
    Trainee_qPCR       <- input$Trainee_qPCR
    Trainer_qPCR       <- input$Trainer_qPCR
    Train_day_qPCR     <- input$Train_day_qPCR

    Train_MDA_session  <- input$Train_MDA_session
    Trainee_MDA       <- input$Trainee_MDA
    Trainer_MDA       <- input$Trainer_MDA
    Train_day_MDA     <- input$Train_day_MDA

    Trainer_travel    <- input$Trainer_travel
    Trainee_travel    <- input$Trainee_travel
    Trainer_accom     <- input$Trainer_accom
    Trainee_accom     <- input$Trainee_accom

    Trainer_perdi     <- input$Trainer_perdi
    Trainee_perdi     <- input$Trainee_perdi
    Train_venue       <- input$Train_venue
    Train_aid         <- input$Train_aid

    StaffTMTMonitP_Dir    <- input$StaffTMTMonitP_Dir
    StaffTMTMonitMonitor  <- input$StaffTMTMonitMonitor
    StaffTMTMonitTL       <- input$StaffTMTMonitTL

    StaffMonitMonitor   <- input$StaffMonitMonitor
    StaffMonitTL        <- input$StaffMonitTL
    StaffMonitCEC       <- input$StaffMonitCEC
    StaffMonitHelper    <- input$StaffMonitHelper

    #CHW_exist_No         <- input$CHW_exist_No
    CHW_monit_Freq       <- input$CHW_monit_Freq
    CHW_monit_dayspertrip<- input$CHW_monit_dayspertrip
    CHW_vilpertrip       <- input$CHW_vilpertrip

    c_equip_CE_input     <- input$c_equip_CE * (input$length/12)
    c_equip_qPCR_input   <- input$c_equip_qPCR * (input$length/12)
    c_equip_MDA_input    <- input$c_equip_MDA
    c_equip_CHW_input    <- input$c_equip_CHW

    costprogram_fie   <- input$Fie_off + input$Fie_electric + input$Fie_water + input$Fie_communication + input$Fie_maintenance + input$Fie_stationery + input$Fie_mis + input$Fie_staffhouse + input$Fie_furniture + input$Fie_IT + input$Fie_running + input$Fie_vehicle + input$Fie_vehicle_mainta
    costprogram_cen   <- input$Cen_off + input$Cen_electric + input$Cen_water + input$Cen_communication + input$Cen_maintenance + input$Cen_stationery + input$Cen_mis
    costprogram_all   <- (costprogram_fie + costprogram_cen) * input$length
    c_program_CE      <- costprogram_all * program_CE
    c_program_qPCR    <- costprogram_all * program_qPCR
    c_program_MDA     <- costprogram_all * program_MDA
    c_program_MSAT    <- costprogram_all * program_MSAT_norm
    c_program_Vaccine <- costprogram_all * program_Vaccine_norm
    c_program_MVDA    <- costprogram_all * program_MVDA_norm
    c_program_MVSAT   <- costprogram_all * program_MVSAT_norm
    c_program_CHW     <- costprogram_all * program_CHW
    c_program_ITN     <- costprogram_all * program_ITN
    c_program_research<- costprogram_all * (program_research
    * ((censuson * census_vil) + (extraqPCRon * eqPCR_vil) + (fgdon * fgd_vil) + (id_interviewon * id_interview_vil)) )
    c_program_all     <- (CEon * c_program_CE)
    + (qPCRon * c_program_qPCR)
    + (MDAon * c_program_MDA)
    + (MSATon * c_program_MSAT)
    + (Vaccineon * c_program_Vaccine)
    + (MVDAon * c_program_MVDA)
    + (MVSATon * c_program_MVSAT)
    + (CHWon * c_program_CHW)
    + (ITNon * c_program_ITN)
    + (epistudyon * c_program_research)

    

    WD                <- (5*52)-13-10
    c_TLperday        <- (input$StaffTL*12)/WD
    c_CECperday       <- (input$StaffCEC*12)/WD
    c_Labperday       <- (input$StaffLab*12)/WD
    c_Helperperday    <- (input$StaffHelper*12)/WD
    c_FieLogperday    <- (input$StaffFieLog*12)/WD
    c_Trainerperday   <- (input$StaffTrainer*12)/WD
    c_Monitperday     <- (input$StaffMonit*12)/WD
    c_Dirperday       <- (input$StaffDir*12)/WD
    c_P_Dirperday     <- (input$StaffP_Dir*12)/WD
    c_HRperday        <- (input$StaffHR*12)/WD
    c_Financeperday   <- (input$StaffFinance*12)/WD
    c_Logistperday    <- (input$StaffLogist*12)/WD
    c_Researchperday  <- (input$Staff_research*12)/WD

    c_StaffCE              <-(input$travel_Days + input$CEDays) * CEVil * tripCE * ((input$StaffCETL * c_TLperday) + (input$StaffCECEC *c_CECperday) + (input$StaffCEHelper *c_Helperperday))
    
    c_StaffqPCR            <-(input$travel_Days + input$qPCRDays) * qPCRVil * tripqPCR * ((input$StaffqPCRTL * c_TLperday) + (input$StaffqPCRCEC *c_CECperday) + (input$StaffqPCRHelper * c_Helperperday) + (input$StaffqPCRLab *c_Labperday))
    c_StaffMDA             <-(input$travel_Days + input$MDADays) *  MDA_rounds * tripMDA * MDAVil * ((input$StaffMDATL * c_TLperday) + (input$StaffMDACEC *c_CECperday) + (input$StaffMDAHelper *c_Helperperday) + (input$StaffMDAFieLog *c_FieLogperday))
    c_StaffMSAT            <-(input$travel_Days + input$MSATDays) * input$MSATround * input$tripMSAT * MSATvil * ((input$StaffMDATL * c_TLperday) + (input$StaffMDACEC *c_CECperday) + (input$StaffMDAHelper *c_Helperperday) + (input$StaffMDAFieLog *c_FieLogperday))
    c_StaffVaccine         <-(input$travel_Days + input$VaccineDays) * input$Vaccineround * input$tripVaccine * Vaccinevil * ((input$StaffMDATL * c_TLperday) + (input$StaffMDACEC *c_CECperday) + (input$StaffMDAHelper *c_Helperperday) + (input$StaffMDAFieLog *c_FieLogperday)
                                                                                                                              + (Vaccineboosteron * (input$travel_Days + input$VaccineDays) * input$tripVaccine * Vaccinevil * ((input$StaffMDATL * c_TLperday) + (input$StaffMDACEC *c_CECperday) + (input$StaffMDAHelper *c_Helperperday) + (input$StaffMDAFieLog *c_FieLogperday))))

    c_StaffMVDA            <-(input$travel_Days + input$MVDADays) * input$MVDAround * input$tripMVDA * MVDAvil * ((input$StaffMDATL * c_TLperday) + (input$StaffMDACEC *c_CECperday) + (input$StaffMDAHelper *c_Helperperday) + (input$StaffMDAFieLog *c_FieLogperday))
    + (MVDAboosteron * (input$travel_Days + input$MVDADays) * MVDAvil *input$tripMVDA* ((input$StaffMDATL * c_TLperday) + (input$StaffMDACEC *c_CECperday) + (input$StaffMDAHelper *c_Helperperday) + (input$StaffMDAFieLog *c_FieLogperday)))

    c_StaffMVSAT           <-(input$travel_Days + input$MVSATDays) * input$MVSATround * input$tripMVSAT * MVSATvil * ((input$StaffMDATL * c_TLperday) + (input$StaffMDACEC *c_CECperday) + (input$StaffMDAHelper *c_Helperperday) + (input$StaffMDAFieLog *c_FieLogperday))
    + (MVSATboosteron * (input$travel_Days + input$MVSATDays) * input$tripMVSAT * MVSATvil * ((input$StaffMDATL * c_TLperday) + (input$StaffMDACEC *c_CECperday) + (input$StaffMDAHelper *c_Helperperday) + (input$StaffMDAFieLog *c_FieLogperday)))

    c_StaffITN             <-(input$travel_Days + input$ITNDays) * ITNvil * input$tripITN * ((input$StaffITNTL * c_TLperday) + (input$StaffITNCEC *c_CECperday) + (input$StaffITNHelper *c_Helperperday))
    ResearchStaff          <-(StaffResearchTL * c_TLperday) + (StaffResearchCEC *c_CECperday) + (StaffResearchHelper *c_Helperperday) + (StaffResearchFieLog * c_FieLogperday)
    c_StaffResearch        <-((input$travel_Days + ResearchDays)
                              * ((censuson* census_no * census_vil) + (fgdon * fgd_no * fgd_vil) + (id_interviewon * id_interview_no * id_interview_vil) + (extraqPCRon * eqPCR_no * eqPCR_vil))
                              * ResearchStaff) +(c_Researchperday * WD)

    c_StaffP_manage        <-Managementon * input$length*(input$StaffDir+input$StaffP_Dir+ input$StaffHR + input$StaffFinance + input$StaffLogist)
    c_StaffCEP_manage      <-c_StaffP_manage * program_CE
    c_StaffqPCRP_manage    <-c_StaffP_manage * program_qPCR
    c_StaffMDAP_manage     <-c_StaffP_manage * program_MDA
    c_StaffMSATP_manage    <-c_StaffP_manage * program_MSAT_norm
    c_StaffVaccineP_manage <-c_StaffP_manage * program_Vaccine_norm
    c_StaffMVDAP_manage    <-c_StaffP_manage * program_MVDA_norm
    c_StaffMVSATP_manage   <-c_StaffP_manage * program_MVSAT_norm
    c_StaffCHWP_manage     <-c_StaffP_manage * program_CHW
    c_StaffresearchP_manage<-c_StaffP_manage * (program_research
    * ((censuson * census_vil) + (extraqPCRon * eqPCR_vil) + (fgdon * fgd_vil) + (id_interviewon * id_interview_vil)) )
    c_StaffCEtrain         <-Trainingon * Train_day_CE * Train_CE_session * ((Trainer_CE * c_Trainerperday) + (Trainee_CE * c_CECperday))
    c_StaffqPCRtrain       <-Trainingon * Train_day_qPCR * Train_qPCR_session * ((Trainer_qPCR * c_Trainerperday) + (Trainee_qPCR * c_Labperday))
    c_StaffMDAtrain        <-Trainingon * Train_day_MDA * Train_MDA_session * ((Trainer_MDA * c_Trainerperday) + (Trainee_MDA * c_TLperday))
    c_StaffMSATtrain       <-Trainingon * input$Train_day_MSAT * input$Train_MSAT_session * ((input$Trainer_MSAT * c_Trainerperday) + (input$Trainee_MSAT * c_TLperday))
    c_StaffVaccinetrain    <-Trainingon * input$Train_day_Vaccine * input$Train_Vaccine_session * ((input$Trainer_Vaccine * c_Trainerperday) + (input$Trainee_Vaccine * c_TLperday))
    c_StaffMVDAtrain       <-Trainingon * input$Train_day_MVDA * input$Train_MVDA_session * ((input$Trainer_MVDA * c_Trainerperday) + (input$Trainee_MVDA * c_TLperday))
    c_StaffMVSATtrain      <-Trainingon * input$Train_day_MVSAT * input$Train_MVSAT_session * ((input$Trainer_MVSAT * c_Trainerperday) + (input$Trainee_MVSAT * c_TLperday))
    c_StaffCHWtrain        <-Trainingon * Train_day_CHW*Train_CHW_session*Trainer_CHW*c_Trainerperday

    c_CHWMonitTeamperday   <-((StaffMonitMonitor * c_Monitperday) + (StaffMonitTL * c_TLperday) + (StaffMonitCEC *c_CECperday) + (StaffMonitHelper *c_Helperperday))
    CHWMonitDays           <-CHW_exist_No * CHW_monit_Freq/12 * (CHW_monit_dayspertrip / CHW_vilpertrip)
    c_StaffCHWMonit        <-Monitoringon * c_CHWMonitTeamperday * CHWMonitDays * input$length

    c_TMTMonitTeamperday   <-(StaffTMTMonitP_Dir * c_P_Dirperday) + (StaffTMTMonitMonitor * c_Monitperday) + (StaffTMTMonitTL * c_TLperday)
    c_StaffTMTMonitCE      <-Monitoringon * c_TMTMonitTeamperday * input$MonittripCE * input$MonitdayCE
    c_StaffTMTMonitqPCR    <-Monitoringon * c_TMTMonitTeamperday * input$MonittripqPCR * input$MonitdayqPCR
    c_StaffTMTMonitMDA     <-Monitoringon * c_TMTMonitTeamperday * input$MonittripMDA * input$MonitdayMDA * MDA_rounds
    c_StaffTMTMonitMSAT    <-Monitoringon * c_TMTMonitTeamperday * input$MonittripMSAT * input$MonitdayMSAT * input$MSATround
    c_StaffTMTMonitVaccine <-Monitoringon * c_TMTMonitTeamperday * input$MonittripVaccine * input$MonitdayVaccine * input$Vaccineround
    c_StaffTMTMonitMVDA    <-Monitoringon * c_TMTMonitTeamperday * input$MonittripMVDA * input$MonitdayMVDA * input$MVDAround
    c_StaffTMTMonitMVSAT   <-Monitoringon * c_TMTMonitTeamperday * input$MonittripMVSAT * input$MonitdayMVSAT * input$MVSATround
    c_StaffTMTMonitoring   <-Monitoringon * c_StaffTMTMonitCE + c_StaffTMTMonitqPCR + c_StaffTMTMonitMDA + c_StaffTMTMonitMSAT

    c_Staff_all            <- (CEon *(c_StaffCE + c_StaffCEtrain + c_StaffTMTMonitCE + c_StaffCEP_manage))
    + (qPCRon * (c_StaffqPCR + c_StaffqPCRtrain + c_StaffTMTMonitqPCR + c_StaffqPCRP_manage))
    + (MDAon * (c_StaffMDA + c_StaffMDAtrain + c_StaffTMTMonitMDA + c_StaffMDAP_manage))
    + (MSATon * (c_StaffMSAT + c_StaffMSATtrain + c_StaffTMTMonitMSAT + c_StaffMSATP_manage))
    + (Vaccineon * (c_StaffVaccine + c_StaffVaccinetrain + c_StaffTMTMonitVaccine + c_StaffVaccineP_manage))
    + (MVDAon * (c_StaffMVDA + c_StaffMVDAtrain + c_StaffTMTMonitMVDA + c_StaffMVDAP_manage))
    + (MVSATon * (c_StaffMVSAT + c_StaffMVSATtrain + c_StaffTMTMonitMVSAT + c_StaffMVSATP_manage))
    + (CHWon * (c_StaffCHWtrain + c_StaffCHWMonit + c_StaffCHWP_manage))
    + (ITNon * c_StaffITN )
    + (epistudyon * (c_StaffResearch + c_StaffresearchP_manage))

    Viltravelmode           <- (c_motorbike* prop_vil_bike)+(c_rentedcar* prop_vil_rentedcar)+(c_owncar* prop_vil_owncar)+(c_boat*prop_vil_boat)+(c_foot*prop_vil_foot)
    c_CEtravel              <- CEon * tripCE * Viltravelmode * CEVil
    c_qPCRtravel            <- qPCRon * tripqPCR * Viltravelmode * qPCRVil
    c_MDAtravel             <- MDAon * tripMDA * Viltravelmode * MDAVil * MDA_rounds
    c_MSATtravel            <- MSATon * input$tripMSAT * Viltravelmode * MSATvil * input$MSATround
    c_Vaccinetravel         <- Vaccineon * input$tripVaccine * Viltravelmode * Vaccinevil * input$Vaccineround
    + (Vaccineboosteron * input$tripVaccine * Viltravelmode * Vaccinevil )
    c_MVDAtravel            <- MVDAon * input$tripMVDA * Viltravelmode * MVDAvil * MDA_rounds
    + (MVDAboosteron * input$tripMVDA * Viltravelmode * MVDAvil )
    c_MVSATtravel           <- MVSATon * input$tripMVSAT * Viltravelmode * MVSATvil * input$MSATround
    + (MVSATboosteron * input$tripMVSAT * Viltravelmode * MVSATvil )
    c_ITNtravel             <- ITNon * input$tripITN * Viltravelmode * ITNvil
    c_CHWtraintravel        <- CHWon * Trainingon * Train_CHW_session * (((Trainer_CHW * Trainer_travel) + (Trainee_CHW * Trainee_travel))+(Trainer_CHW*Trainer_accom*Train_day_CHW)+(Trainee_CHW*Trainee_accom*Train_day_CHW)+(Trainer_CHW*Trainer_perdi*Train_day_CHW)+(Trainee_CHW*Trainee_perdi*Train_day_CHW)+(Train_venue*Train_day_CHW+(Train_aid*Trainee_CHW)))
    c_CEtraintravel         <- CEon * Trainingon * Train_CE_session * (((Trainer_CE * Trainer_travel) + (Trainee_CE * Trainee_travel))+(Trainer_CE*Trainer_accom*Train_day_CE)+(Trainee_CE*Trainee_accom*Train_day_CE)+(Trainer_CE*Trainer_perdi*Train_day_CE)+(Trainee_CE*Trainee_perdi*Train_day_CE)+(Train_venue*Train_day_CE+(Train_aid*Trainee_CE)))
    c_qPCRtraintravel       <- qPCRon * Trainingon * Train_qPCR_session * (((Trainer_qPCR * Trainer_travel) + (Trainee_qPCR * Trainee_travel))+(Trainer_qPCR*Trainer_accom*Train_day_qPCR)+(Trainee_qPCR*Trainee_accom*Train_day_qPCR)+(Trainer_qPCR*Trainer_perdi*Train_day_qPCR)+(Trainee_qPCR*Trainee_perdi*Train_day_qPCR)+(Train_venue*Train_day_qPCR+(Train_aid*Trainee_qPCR)))
    c_MDAtraintravel        <- MDAon * Trainingon * Train_MDA_session * (((Trainer_MDA * Trainer_travel) + (Trainee_MDA * Trainee_travel))+(Trainer_MDA*Trainer_accom*Train_day_MDA)+(Trainee_MDA*Trainee_accom*Train_day_MDA)+(Trainer_MDA*Trainer_perdi*Train_day_MDA)+(Trainee_MDA*Trainee_perdi*Train_day_MDA)+(Train_venue*Train_day_MDA+(Train_aid*Trainee_MDA)))
    c_MSATtraintravel       <- MSATon * Trainingon * input$Train_MSAT_session * (((input$Trainer_MSAT * Trainer_travel) + (input$Trainee_MSAT * Trainee_travel))+(input$Trainer_MSAT * Trainer_accom*input$Train_day_MSAT)+(input$Trainee_MSAT*Trainee_accom*input$Train_day_MSAT)+(input$Trainer_MSAT * Trainer_perdi*input$Train_day_MSAT)+(input$Trainee_MSAT * Trainee_perdi*input$Train_day_MSAT)+(Train_venue*input$Train_day_MSAT+(Train_aid*input$Trainee_MSAT)))
    c_Vaccinetraintravel    <- Vaccineon * Trainingon * input$Train_Vaccine_session * (((input$Trainer_Vaccine * Trainer_travel) + (input$Trainee_Vaccine * Trainee_travel))+(input$Trainer_Vaccine * Trainer_accom * input$Train_day_Vaccine)+(input$Trainee_Vaccine * Trainee_accom * input$Train_day_Vaccine)+(input$Trainer_Vaccine * Trainer_perdi * input$Train_day_Vaccine) + (input$Trainee_Vaccine * Trainee_perdi * input$Train_day_Vaccine) + (Train_venue * input$Train_day_Vaccine + (Train_aid * input$Trainee_Vaccine)))
    c_MVDAtraintravel       <- MVDAon * Trainingon * input$Train_MVDA_session * (((input$Trainer_MVDA * Trainer_travel) + (input$Trainee_MVDA * Trainee_travel))+(input$Trainer_MVDA*Trainer_accom*input$Train_day_MVDA)+(input$Trainee_MVDA*Trainee_accom*input$Train_day_MVDA)+(input$Trainer_MVDA*Trainer_perdi*input$Train_day_MVDA)+(input$Trainee_MVDA*Trainee_perdi*input$Train_day_MVDA)+(Train_venue*input$Train_day_MVDA+(Train_aid*input$Trainee_MVDA)))
    c_MVSATtraintravel      <- MVSATon * Trainingon * input$Train_MVSAT_session * (((input$Trainer_MVSAT * Trainer_travel) + (input$Trainee_MVSAT * Trainee_travel))+(input$Trainer_MVSAT * Trainer_accom*input$Train_day_MVSAT)+(input$Trainee_MVSAT*Trainee_accom*input$Train_day_MVSAT)+(input$Trainer_MVSAT * Trainer_perdi*input$Train_day_MVSAT)+(input$Trainee_MVSAT * Trainee_perdi*input$Train_day_MVSAT)+(Train_venue*input$Train_day_MVSAT+(Train_aid*input$Trainee_MVSAT)))
    c_CHWMonittravel        <- CHWon * Monitoringon * ((CHW_exist_No * CHW_monit_Freq)/ CHW_vilpertrip/12) * Viltravelmode * input$length
    c_TMTMonitTeam          <- Managementon * (StaffTMTMonitP_Dir+StaffTMTMonitMonitor + StaffTMTMonitTL)
    c_TMTMonittravelCE      <- CEon * Monitoringon * input$MonittripCE * ((c_travel_central_field * c_TMTMonitTeam) + (Viltravelmode * CEVil))
    c_TMTMonittravelqPCR    <- qPCRon * Monitoringon * input$MonittripqPCR * ((c_travel_central_field * c_TMTMonitTeam) + (Viltravelmode * qPCRVil))
    c_TMTMonittravelMDA     <- MDAon * Monitoringon * input$MonittripMDA * MDA_rounds * ((c_travel_central_field * c_TMTMonitTeam) + (Viltravelmode * MDAVil))
    c_TMTMonittravelMSAT    <- MSATon * Monitoringon * input$MonittripMSAT * input$MSATround * ((c_travel_central_field * c_TMTMonitTeam) + (Viltravelmode * MSATvil))
    c_TMTMonittravelVaccine <- Vaccineon * Monitoringon * input$MonittripVaccine * input$Vaccineround * ((c_travel_central_field * c_TMTMonitTeam) + (Viltravelmode * Vaccinevil))
    c_TMTMonittravelMVDA    <- MVDAon * Monitoringon * input$MonittripMVDA * input$MVDAround * ((c_travel_central_field * c_TMTMonitTeam) + (Viltravelmode * MVDAvil))
    c_TMTMonittravelMVSAT   <- MVSATon * Monitoringon * input$MonittripMVSAT * input$MVSATround * ((c_travel_central_field * c_TMTMonitTeam) + (Viltravelmode * MVSATvil))
    c_research_travel       <- epistudyon * ((censuson* census_no * census_vil) + (fgdon * fgd_no * fgd_vil) + (id_interviewon * id_interview_no * id_interview_vil) + (extraqPCRon * eqPCR_no * eqPCR_vil)) * c_motorbike
    c_travel_all            <- CEon * (c_CEtravel + c_CEtraintravel + c_TMTMonittravelCE)
    + (qPCRon * c_qPCRtravel + c_qPCRtraintravel + c_TMTMonittravelqPCR)
    + (MDAon * (c_MDAtravel + c_MDAtraintravel + c_TMTMonittravelMDA))
    + (MSATon *(c_MSATtravel + c_MSATtraintravel + c_TMTMonittravelMSAT))
    + (Vaccineon * (c_Vaccinetravel + c_Vaccinetraintravel + c_TMTMonittravelVaccine))
    + (MVDAon * (c_MVDAtravel + c_MVDAtraintravel + c_TMTMonittravelMVDA))
    + (MVSATon * (c_MVSATtravel + c_MVSATtraintravel + c_TMTMonittravelMVSAT))
    + (CHWon * c_CHWtraintravel + c_CHWMonittravel)
    + (ITNon *c_ITNtravel)
    + (epistudyon * c_research_travel)

    MTrans_CE           <- CEon * vehicle_rent_CE * c_rentedcar
    MTrans_qPCR         <- qPCRon * vehicle_rent_qPCR * c_rentedcar
    MTrans_MDA          <- MDAon * vehicle_rent_MDA * c_rentedcar * MDA_rounds
    MTrans_MSAT         <- MSATon * input$vehicle_rent_MSAT * c_rentedcar * input$MSATround
    MTrans_Vaccine      <- Vaccineon * input$vehicle_rent_Vaccine * c_rentedcar * input$Vaccineround
    MTrans_MVDA         <- MVDAon * input$vehicle_rent_MVDA * c_rentedcar * input$MVDAround
    MTrans_MVSAT        <- MVSATon * input$vehicle_rent_MVSAT * c_rentedcar * input$MVSATround
    MTrans_ITN          <- ITNon * input$vehicle_rent_ITN * c_rentedcar * ITNvil
    MTrans_research     <- epistudyon * vehicle_rent_qPCR * c_rentedcar * extraqPCRon
    MTrans_all          <- MTrans_CE + MTrans_qPCR + MTrans_MDA + MTrans_MSAT + MTrans_Vaccine + MTrans_MVDA + MTrans_MVSAT + MTrans_ITN + MTrans_research

    c_fie_visit         <- fie_visit * input$length * ((c_travel_central_field + c_motorbike) + (perdium * fie_days) + (accom * fie_days))
    c_fie_visit_CE      <- Monitoringon * CEon * c_fie_visit * program_CE
    c_fie_visit_qPCR    <- Monitoringon * qPCRon * c_fie_visit * program_qPCR
    c_fie_visit_MDA     <- Monitoringon * MDAon * c_fie_visit * program_MDA
    c_fie_visit_MSAT    <- Monitoringon * MSATon * c_fie_visit * program_MSAT_norm
    c_fie_visit_Vaccine <- Monitoringon * Vaccineon * c_fie_visit * program_Vaccine_norm
    c_fie_visit_MVDA    <- Monitoringon * MVDAon * c_fie_visit * program_MVDA_norm
    c_fie_visit_MVSAT   <- Monitoringon * MVSATon * c_fie_visit * program_MVSAT_norm
    c_fie_visit_CHW     <- Monitoringon * CHWon * c_fie_visit * program_CHW
    c_fie_visit_research<- Monitoringon * epistudyon * c_fie_visit * program_research
    c_fie_visit_all     <- c_fie_visit_CE + c_fie_visit_qPCR + c_fie_visit_MDA + c_fie_visit_MSAT + c_fie_visit_Vaccine + c_fie_visit_MVDA + c_fie_visit_MVSAT + c_fie_visit_CHW + c_fie_visit_research

    c_travel_trans_all  <- c_travel_all + MTrans_all + c_fie_visit_all

    c_child           <-  (1 + wastage) * MDA_rounds * MDA_uptake * (MDAVil * input$vilSize * 0.05 * (input$Drug_child + input$Drug_prim))
    c_youth           <-  (1 + wastage) * MDA_rounds * MDA_uptake * (MDAVil * input$vilSize * 0.1 * (input$Drug_youth + input$Drug_prim))
    c_adult           <-  (1 + wastage) * MDA_rounds * MDA_uptake * (MDAVil * input$vilSize * 0.85 * (input$Drug_adult + input$Drug_prim))
    c_side_effect     <-  input$Drug_side_effect * MDA_rounds * MDAVil
    c_drug_all        <-  c_child + c_youth + c_adult + c_side_effect

    c_Consum_CE       <- input$Consum_CE * CEVil
    c_Consum_qPCR     <- 63 * ((input$Consum_qPCR * qPCRVil) + (input$c_qPCRanalysis * qPCRVil))
    c_Consum_MDA      <- (input$Consum_MDA * MDAVil * MDA_rounds) + c_drug_all
    c_Consum_MSAT     <- (input$Consum_MSAT * MSATvil * input$MSATround * MSATcoverage_norm * input$vilSize) + ( hrdt_pos_norm * input$Consum_ACT * MSATvil * input$MSATround * MSATcoverage_norm * input$vilSize  )
    c_Consum_Vaccine  <- (Vaccinevil * input$Vaccineround
                          *(input$Consum_Vaccine + (input$Vaccine_cost *(1+Vaccine_wastage))) *  Vaccinecoverage_norm * input$vilSize)
    + (Vaccineboosteron * (Vaccinevil *(input$Consum_Vaccine + (input$Vaccine_cost *(1+Vaccine_wastage))) * Vaccine_booster_coverage_norm * Vaccinecoverage_norm * input$vilSize))

    c_Consum_MVDA      <- (MVDAvil * input$MVDAround
                           * (input$Consum_MVDA + input$MVDA_side_effect +  ((1 + wastage) * MVDAcoverage_norm *((input$vilSize *0.05 * input$MVDA_child) + (input$vilSize * 0.1 * input$MVDA_youth) + (input$vilSize * 0.85 * input$MVDA_adult)))) )
    + (MVDAboosteron * MVDAvil * (input$Consum_MVDA + input$MVDA_side_effect +  ((1 + wastage) * MVDA_booster_coverage_norm * MVDAcoverage_norm * ((input$vilSize *0.05 * input$MVDA_child) + (input$vilSize * 0.1 * input$MVDA_youth) + (input$vilSize * 0.85 * input$MVDA_adult)))))

    c_Consum_MVSAT     <- (MVSATvil * input$MVSATround* MVSATcoverage_norm * input$vilSize
                           * ((input$Consum_MVSATVaccine + ((1+ MVSAT_wastage)* input$MVSAT_Vaccine_cost)) + (input$Consum_MVSAT + (input$MVSAT_ACT * MVSAT_pos))))
    + (MVSATboosteron * MVSATvil* MVSATcoverage_norm * input$vilSize
       * (input$Consum_MVSATVaccine + ((1+ MVSAT_wastage)* input$MVSAT_Vaccine_cost)) * MVSAT_booster_coverage_norm )

    c_Consum_CHW      <- input$Consum_CHW * CHW_exist_No * input$length
    c_Consum_research <- (input$Consum_qPCR + input$c_qPCRanalysis) * (eqPCR_no * eqPCR_vil * eqPCR_samplesize *extraqPCRon)
    c_Consum_all      <- (CEon * c_Consum_CE)
    + (qPCRon * c_Consum_qPCR)
    + (MDAon * c_Consum_MDA)
    + (MSATon * c_Consum_MSAT )
    + (Vaccineon * c_Consum_Vaccine)
    + (MVDAon * c_Consum_MVDA )
    + (MVSATon * c_Consum_MVSAT)
    + (CHWon * c_Consum_CHW)
    + (epistudyon * c_Consum_research)

    c_Train_CHW        <- (((Trainee_travel + ((Trainee_accom + Trainee_perdi) * Train_day_CHW)) * Trainee_CHW)+
                             ((Trainer_travel + ((Trainer_accom + Trainer_perdi) * Train_day_CHW)) * Trainer_CHW)+
                             (Train_venue * Train_day_CHW)+
                             (Train_aid * Trainee_CHW)) * Train_CHW_session+c_StaffCHWtrain

    c_Train_CE        <- (((Trainee_travel + ((Trainee_accom + Trainee_perdi) * Train_day_CE)) * Trainee_CE)+
                            ((Trainer_travel + ((Trainer_accom + Trainer_perdi) * Train_day_CE)) * Trainer_CE)+
                            (Train_venue * Train_day_CE)+
                            (Train_aid * Trainee_CE)) * Train_CE_session+ c_StaffCEtrain

    c_Train_qPCR      <- (((Trainee_travel + ((Trainee_accom + Trainee_perdi) * Train_day_qPCR)) * Trainee_qPCR)+
                            ((Trainer_travel + ((Trainer_accom + Trainer_perdi) * Train_day_qPCR)) * Trainer_qPCR)+
                            (Train_venue * Train_day_qPCR)+
                            (Train_aid * Trainee_qPCR)) * Train_qPCR_session+ c_StaffqPCRtrain

    c_Train_MDA       <- (((Trainee_travel + ((Trainee_accom + Trainee_perdi) * Train_day_MDA)) * Trainee_MDA)+
                            ((Trainer_travel + ((Trainer_accom + Trainer_perdi) * Train_day_MDA)) * Trainer_MDA)+
                            (Train_venue * Train_day_MDA)+
                            (Train_aid * Trainee_MDA)) * Train_MDA_session+ c_StaffMDAtrain
    c_Train_MSAT       <- (((Trainee_travel + ((Trainee_accom + Trainee_perdi) * input$Train_day_MSAT)) * input$Trainee_MSAT)+
                             ((Trainer_travel + ((Trainer_accom + Trainer_perdi) * input$Train_day_MSAT)) * input$Trainer_MSAT)+
                             (Train_venue * input$Train_day_MSAT)+
                             (Train_aid * input$Trainee_MSAT)) * input$Train_MSAT_session+ c_StaffMSATtrain
    c_Train_Vaccine    <- (((Trainee_travel + ((Trainee_accom + Trainee_perdi) * input$Train_day_Vaccine)) * input$Trainee_Vaccine)+
                             ((Trainer_travel + ((Trainer_accom + Trainer_perdi) * input$Train_day_Vaccine)) * input$Trainer_Vaccine)+
                             (Train_venue * input$Train_day_Vaccine)+
                             (Train_aid * input$Trainee_Vaccine)) * input$Train_Vaccine_session+ c_StaffVaccinetrain
    c_Train_MVDA       <- (((Trainee_travel + ((Trainee_accom + Trainee_perdi) * input$Train_day_MVDA)) * input$Trainee_MVDA)+
                             ((Trainer_travel + ((Trainer_accom + Trainer_perdi) * input$Train_day_MVDA)) * input$Trainer_MVDA)+
                             (Train_venue * input$Train_day_MVDA)+
                             (Train_aid * input$Trainee_MVDA)) * input$Train_MVDA_session+ c_StaffMVSATtrain
    c_Train_MVSAT       <- (((Trainee_travel + ((Trainee_accom + Trainee_perdi) * input$Train_day_MVSAT)) * input$Trainee_MVSAT)+
                              ((Trainer_travel + ((Trainer_accom + Trainer_perdi) * input$Train_day_MVSAT)) * input$Trainer_MVSAT)+
                              (Train_venue * input$Train_day_MVSAT)+
                              (Train_aid * input$Trainee_MVSAT)) * input$Train_MVSAT_session+ c_StaffMVSATtrain
    c_Train_all        <- (CEon * c_Train_CE) + (qPCRon * c_Train_qPCR) + (MDAon * c_Train_MDA) + (CHWon * c_Train_CHW)

    c_equip_CE        <- CEon * c_equip_CE_input * CEVil
    c_equip_qPCR      <- qPCRon * c_equip_qPCR_input * qPCRVil
    c_equip_MDA       <- MDAon * c_equip_MDA_input * MDAVil * MDA_rounds
    c_equip_MSAT      <- MSATon * input$c_equip_MSAT * MSATvil * input$MSATround
    c_equip_Vaccine   <- Vaccineon * input$c_equip_Vaccine * Vaccinevil * input$Vaccineround
    c_equip_MVDA      <- MVDAon * input$c_equip_MVDA * MVDAvil * input$MVDAround
    c_equip_MVSAT     <- MVSATon * input$c_equip_MVSAT * MVSATvil * input$MVSATround
    c_equip_CHW       <- CHWon * c_equip_CHW_input * CHW_exist_No
    c_equip_ITN       <- ITNon * input$c_equip_ITN * ITNvil * input$vilSize/2
    c_equip_research  <- epistudyon * c_equip_qPCR_input * eqPCR_no * eqPCR_vil * extraqPCRon
    c_equip_all       <- c_equip_CE
    + c_equip_qPCR
    + c_equip_MDA
    + c_equip_MSAT
    + c_equip_Vaccine
    + c_equip_MVDA
    + c_equip_MVSAT
    + c_equip_CHW
    + c_equip_ITN
    + c_equip_research

    c_incen_CE        <- input$c_incen_CE * CEVil * tripCE
    c_incen_commu_CE  <- input$c_incen_commu_CE * input$Vil_commu_incen
    c_incen_qPCR      <- input$c_incen_qPCR * qPCRVil * 50  # 50 is number of qPCR volunteer as a default
    c_incen_MDA       <- input$c_incen_MDA * MDAVil * MDA_rounds * MDA_uptake * input$vilSize
    c_incen_MSAT      <- input$c_incen_MSAT * MSATvil * input$MSATround * MSATcoverage_norm * input$vilSize
    c_incen_Vaccine   <- input$c_incen_Vaccine * Vaccinevil * input$Vaccineround * Vaccinecoverage_norm * input$vilSize
    c_incen_MVDA      <- input$c_incen_MVDA * MVDAvil * input$MVDAround * MVDAcoverage_norm * input$vilSize
    c_incen_MVSAT     <- input$c_incen_MVSAT * MVSATvil * input$MVSATround * MVSATcoverage_norm * input$vilSize
    c_incen_CHW       <- input$c_incen_CHW * CHW_exist_No * input$length
    c_incen_research  <- input$c_incen_qPCR * extraqPCRon * eqPCR_no * eqPCR_vil * eqPCR_samplesize
    #c_incen_all      <- c_incen_CE + c_incen_qPCR + c_incen_MDA + c_incen_CHW)
    c_incen_all       <- (CEon * (c_incen_CE + c_incen_commu_CE))
    + (qPCRon * c_incen_qPCR)
    + (MDAon * c_incen_MDA)
    + (MSATon * c_incen_MSAT )
    + (Vaccineon * c_incen_Vaccine )
    + (MVDAon * c_incen_MVDA)
    + (MVSATon * c_incen_MVSAT )
    + (CHWon * c_incen_CHW)
    + (epistudyon * c_incen_research)







    # All costs that will be used in outputs are added to a dataframe ----

    d <- tibble(
      category = rep(c("Staff", "Travel", "Consumable", "Training", "Program", "Equipment", "Incentive", "Uncategorised"), 11),
      activity = rep(c("Community Engagement",
                       "qPCR",
                       "Mass Drug Administration",
                       "Mass Screening and Treatment",
                       "Mass Vaccination",
                       "Mass Vaccination + MDA",
                       "Mass Vaccination + MSAT",
                       "CHWs Program",
                       "Distribution of ITNs",
                       "Epidemiological studies",
                       "Extra"), each = 8),
      cost = 0
    )

    # Filling the dataframe with costs
    # Staff
    d[d$category == "Staff" & d$activity == "Community Engagement", "cost"] <- c_StaffCE + c_StaffCEP_manage + c_StaffTMTMonitCE
    d[d$category == "Staff" & d$activity == "qPCR", "cost"] <- c_StaffqPCR + c_StaffqPCRP_manage + c_StaffTMTMonitqPCR
    d[d$category == "Staff" & d$activity == "Mass Drug Administration", "cost"] <- c_StaffMDA + c_StaffMDAP_manage + c_StaffTMTMonitMDA
    d[d$category == "Staff" & d$activity == "Mass Screening and Treatment", "cost"] <- c_StaffMSAT + c_StaffMSATP_manage + c_StaffTMTMonitMSAT
    d[d$category == "Staff" & d$activity == "Mass Vaccination", "cost"] <- c_StaffVaccine + c_StaffVaccineP_manage + c_StaffTMTMonitVaccine
    d[d$category == "Staff" & d$activity == "Mass Vaccination + MDA", "cost"] <- c_StaffMVDA + c_StaffMVDAP_manage + c_StaffTMTMonitMVDA
    d[d$category == "Staff" & d$activity == "Mass Vaccination + MSAT", "cost"] <- c_StaffMVSAT + c_StaffMVSATP_manage + c_StaffTMTMonitMVSAT
    d[d$category == "Staff" & d$activity == "CHWs Program", "cost"] <- c_StaffCHWP_manage + c_StaffCHWMonit
    d[d$category == "Staff" & d$activity == "Distribution of ITNs", "cost"] <- c_StaffITN
    d[d$category == "Staff" & d$activity == "Epidemiological studies", "cost"] <- c_StaffResearch + c_StaffresearchP_manage

    # Travel
    d[d$category == "Travel" & d$activity == "Community Engagement", "cost"] <- c_CEtravel + MTrans_CE + c_fie_visit_CE + c_TMTMonittravelCE
    d[d$category == "Travel" & d$activity == "qPCR", "cost"] <- c_qPCRtravel + MTrans_qPCR + c_fie_visit_qPCR + c_TMTMonittravelqPCR
    d[d$category == "Travel" & d$activity == "Mass Drug Administration", "cost"] <- c_MDAtravel + MTrans_MDA + c_fie_visit_MDA + c_TMTMonittravelMDA
    d[d$category == "Travel" & d$activity == "Mass Screening and Treatment", "cost"] <- c_MSATtravel + MTrans_MSAT + c_fie_visit_MSAT + c_TMTMonittravelMSAT
    d[d$category == "Travel" & d$activity == "Mass Vaccination", "cost"] <- c_Vaccinetravel + MTrans_Vaccine + c_fie_visit_Vaccine + c_TMTMonittravelVaccine
    d[d$category == "Travel" & d$activity == "Mass Vaccination + MDA", "cost"] <- c_MVDAtravel + MTrans_MVDA + c_fie_visit_MVDA + c_TMTMonittravelMVDA
    d[d$category == "Travel" & d$activity == "Mass Vaccination + MSAT", "cost"] <- c_MVSATtravel + MTrans_MVSAT + c_fie_visit_MVSAT + c_TMTMonittravelMVSAT
    d[d$category == "Travel" & d$activity == "CHWs Program", "cost"] <- c_fie_visit_CHW + c_CHWMonittravel
    d[d$category == "Travel" & d$activity == "Distribution of ITNs", "cost"] <- c_ITNtravel + MTrans_ITN
    d[d$category == "Travel" & d$activity == "Epidemiological studies", "cost"] <- c_research_travel + MTrans_research + c_fie_visit_research

    # Consumable
    d[d$category == "Consumable" & d$activity == "Community Engagement", "cost"] <- c_Consum_CE
    d[d$category == "Consumable" & d$activity == "qPCR", "cost"] <- c_Consum_qPCR
    d[d$category == "Consumable" & d$activity == "Mass Drug Administration", "cost"] <- c_Consum_MDA
    d[d$category == "Consumable" & d$activity == "Mass Screening and Treatment", "cost"] <- c_Consum_MSAT
    d[d$category == "Consumable" & d$activity == "Mass Vaccination", "cost"] <- c_Consum_Vaccine
    d[d$category == "Consumable" & d$activity == "Mass Vaccination + MDA", "cost"] <- c_Consum_MVDA
    d[d$category == "Consumable" & d$activity == "Mass Vaccination + MSAT", "cost"] <- c_Consum_MVSAT
    d[d$category == "Consumable" & d$activity == "CHWs Program", "cost"] <- c_Consum_CHW
    d[d$category == "Consumable" & d$activity == "Distribution of ITNs", "cost"] <- 0
    d[d$category == "Consumable" & d$activity == "Epidemiological studies", "cost"] <- c_Consum_research

    # Training
    d[d$category == "Training" & d$activity == "Community Engagement", "cost"] <- Trainingon * c_Train_CE
    d[d$category == "Training" & d$activity == "qPCR", "cost"] <- Trainingon * c_Train_qPCR
    d[d$category == "Training" & d$activity == "Mass Drug Administration", "cost"] <- Trainingon * c_Train_MDA
    d[d$category == "Training" & d$activity == "Mass Screening and Treatment", "cost"] <- Trainingon * c_Train_MSAT
    d[d$category == "Training" & d$activity == "Mass Vaccination", "cost"] <- Trainingon * c_Train_Vaccine
    d[d$category == "Training" & d$activity == "Mass Vaccination + MDA", "cost"] <- Trainingon * c_Train_MVDA
    d[d$category == "Training" & d$activity == "Mass Vaccination + MSAT", "cost"] <- Trainingon * c_Train_MVSAT
    d[d$category == "Training" & d$activity == "CHWs Program", "cost"] <- c_Consum_CHW
    d[d$category == "Training" & d$activity == "Distribution of ITNs", "cost"] <- 0
    d[d$category == "Training" & d$activity == "Epidemiological studies", "cost"] <- c_Consum_research

    # Program
    d[d$category == "Program" & d$activity == "Community Engagement", "cost"] <- c_program_CE
    d[d$category == "Program" & d$activity == "qPCR", "cost"] <- c_program_qPCR
    d[d$category == "Program" & d$activity == "Mass Drug Administration", "cost"] <- c_program_MDA
    d[d$category == "Program" & d$activity == "Mass Screening and Treatment", "cost"] <- c_program_MSAT
    d[d$category == "Program" & d$activity == "Mass Vaccination", "cost"] <- c_program_Vaccine
    d[d$category == "Program" & d$activity == "Mass Vaccination + MDA", "cost"] <- c_program_MVDA
    d[d$category == "Program" & d$activity == "Mass Vaccination + MSAT", "cost"] <- c_program_MVSAT
    d[d$category == "Program" & d$activity == "CHWs Program", "cost"] <- c_program_CHW
    d[d$category == "Program" & d$activity == "Distribution of ITNs", "cost"] <- c_program_ITN
    d[d$category == "Program" & d$activity == "Epidemiological studies", "cost"] <- c_program_research

    # Equipment
    d[d$category == "Equipment" & d$activity == "Community Engagement", "cost"] <- c_equip_CE
    d[d$category == "Equipment" & d$activity == "qPCR", "cost"] <- c_equip_qPCR
    d[d$category == "Equipment" & d$activity == "Mass Drug Administration", "cost"] <- c_equip_MDA
    d[d$category == "Equipment" & d$activity == "Mass Screening and Treatment", "cost"] <- c_equip_MSAT
    d[d$category == "Equipment" & d$activity == "Mass Vaccination", "cost"] <- c_equip_Vaccine
    d[d$category == "Equipment" & d$activity == "Mass Vaccination + MDA", "cost"] <- c_equip_MVDA
    d[d$category == "Equipment" & d$activity == "Mass Vaccination + MSAT", "cost"] <- c_equip_MVSAT
    d[d$category == "Equipment" & d$activity == "CHWs Program", "cost"] <- c_equip_CHW
    d[d$category == "Equipment" & d$activity == "Distribution of ITNs", "cost"] <- c_equip_ITN
    d[d$category == "Equipment" & d$activity == "Epidemiological studies", "cost"] <- c_equip_research

    # Incentive
    d[d$category == "Incentive" & d$activity == "Community Engagement", "cost"] <- c_incen_CE + c_incen_commu_CE
    d[d$category == "Incentive" & d$activity == "qPCR", "cost"] <- c_incen_qPCR
    d[d$category == "Incentive" & d$activity == "Mass Drug Administration", "cost"] <- c_incen_MDA
    d[d$category == "Incentive" & d$activity == "Mass Screening and Treatment", "cost"] <- c_incen_MSAT
    d[d$category == "Incentive" & d$activity == "Mass Vaccination", "cost"] <- c_incen_Vaccine
    d[d$category == "Incentive" & d$activity == "Mass Vaccination + MDA", "cost"] <- c_incen_MVDA
    d[d$category == "Incentive" & d$activity == "Mass Vaccination + MSAT", "cost"] <- c_incen_MVSAT
    d[d$category == "Incentive" & d$activity == "CHWs Program", "cost"] <- c_incen_CHW
    d[d$category == "Incentive" & d$activity == "Distribution of ITNs", "cost"] <- 0
    d[d$category == "Incentive" & d$activity == "Epidemiological studies", "cost"] <- c_incen_research

    d[d$category == "Uncategorised" & d$activity == "Extra", "cost"] <- (input$t1_no * input$t1_value) + (input$t2_no * input$t2_value) + (input$t3_no * input$t3_value) + (input$t4_no * input$t4_value) + (input$t5_no * input$t5_value) + (input$t6_no * input$t6_value)



    # Set cost to 0 when the activity is not selected
    if(input$CEon == FALSE) d[d$activity == "Community Engagement", "cost"] <- 0
    if(input$qPCRon != 'qPCR') d[d$activity == "qPCR", "cost"] <- 0
    if(input$interventions != 'MDAon') d[d$activity == "Mass Drug Administration", "cost"] <- 0
    if(input$interventions != 'MSATon') d[d$activity == "Mass Screening and Treatment", "cost"] <- 0
    if(input$interventions != 'Vaccineon') d[d$activity == "Mass Vaccination", "cost"] <- 0
    if(input$interventions != 'MVDAon') d[d$activity == "Mass Vaccination + MDA", "cost"] <- 0
    if(input$interventions != 'MVSATon') d[d$activity == "Mass Vaccination + MSAT", "cost"] <- 0
    if(input$CHWon == FALSE) d[d$activity == "CHWs Program", "cost"] <- 0
    if(input$ITNon == FALSE) d[d$activity == "Distribution of ITNs", "cost"] <- 0
    if(input$epistudyon == FALSE) d[d$activity == "Epidemiological studies", "cost"] <- 0
    # this should be removed as there is no switch for extra cost:
    # if(input$extraon == FALSE) d[d$activity == "Extra", "cost"] <- 0
    
    
    # unit costs
    unit_activity <- tibble(
      activity = c('Mass Drug Administration', 'Mass Screening and Treatment', 'Mass Vaccination', 
                   'Mass Vaccination + MDA', 'Mass Vaccination + MSAT', 'Community Engagement', 'qPCR'),
      villages = c(MDAVil, MSATvil, Vaccinevil, MVDAvil, MVSATvil, CEVil, qPCRVil),
      rounds = c(MDA_rounds, input$MSATround, input$Vaccineround, input$MVDAround, input$MVSATround, 1, 1),
      coverage = c(MDA_uptake, MSATcoverage_norm, Vaccinecoverage_norm, MVDAcoverage_norm, MVSATcoverage_norm, 1, 50)
    )
    
    unit_activity_2 <- tibble(
      activity = c('CHWs Program', 'Distribution of ITNs'),
      villages = c(CHW_exist_No, ITNvil)
    )
    
    return(list(d = d, unit_activity = unit_activity, unit_activity_2 = unit_activity_2))

  })  # end of the reactive expression
  
  
  
  
  # Check that all percentages add up to a
  output$check_pct <- renderText({
    sum_pct <- ((input$interventions == 'MDAon') * input$program_MDA) +
      ((input$interventions == 'MSATon') * input$program_MSAT) +
      ((input$interventions == 'Vaccineon') * input$program_Vaccine) +
      ((input$interventions == 'MVDAon') * input$program_MVDA) +
      ((input$interventions == 'MVSATon') * input$program_MVSAT) +
      ((input$qPCRon == 'qPCR') * input$program_qPCR) +
      ((input$CEon == TRUE) * input$program_CE) +
      ((input$CHWon == TRUE) * input$program_CHW) +
      ((input$ITNon == TRUE) * input$program_ITN) +
      ((input$epistudyon == TRUE) * input$program_research)
    
    if(sum_pct == 0) return(NULL)
    
    ifelse(sum_pct == 100,
           paste0(div(class = "green-text", p(icon('check'), 'Percentages add-up to 100%'))),
           paste0(div(class = "red-text", p(icon('exclamation-circle'), 'Percentages add-up to ', sum_pct, '%')))
    )
  })
  
  output$total_population <- renderText({
    paste0('(Total population is ', format(input$No_villages * input$vilSize, big.mark=","), ' people.)')
  })
  
  
  output$transport_pct <- renderText({
    sum_pct <- input$prop_vil_foot + input$prop_vil_boat + input$prop_vil_owncar + input$prop_vil_rentedcar + input$prop_vil_bike
    ifelse(sum_pct == 100,
           paste0(div(class = "green-text", p(icon('check'), 'Percentages add-up to 100%'))),
           paste0(div(class = "red-text", p(icon('exclamation-circle'), 'Percentages add-up to ', sum_pct, '%')))
           )
  })
  
  
  output$total_cost <- renderText({
    paste0(div(class = 'float-validation', 
         span("Total of all costs is ", format(round(sum(total_costs()$d$cost), 0), big.mark=','), 
         " US$")
    )
    )
  })
  
  
  output$table_costs <- renderDataTable({
    d <- rbind(
      total_costs()$d, 
      total_costs()$d %>%
        group_by(activity) %>%
        summarise(cost = sum(cost)) %>%
        transmute(category = 'zTotal', activity, cost)) %>%
      spread(category, cost) %>%
      rename(Activity = activity, Total = zTotal) %>%
      filter(Total != 0)

    datatable(d, options = list(dom = 't'), rownames = FALSE) %>%
      formatCurrency(names(d), digits = 0)
  })
  
  
  output$unit_costs_1 <- renderDataTable({
    d <- left_join(
      total_costs()$unit_activity,
      total_costs()$d %>%
        group_by(activity) %>%
        summarise(cost = sum(cost)) %>%
        transmute(category = 'Total', activity, cost),
      by = 'activity') %>%
      transmute(Activity = activity, 
                `Cost per village in one round` = cost / (villages * rounds),
                `Cost per person reached in one round` = cost / (input$No_villages * rounds * input$vilSize),
                `Cost per person treated in one round` = cost / (villages * input$vilSize * rounds * coverage)) %>%
      filter(`Cost per village in one round` != 0)

    datatable(d, options = list(dom = 't'), rownames = FALSE) %>%
      formatCurrency(names(d), digits = 0)
  })
  
  
  
  
  output$unit_costs_2 <- renderDataTable({
    d <- left_join(
      total_costs()$unit_activity_2,
      total_costs()$d %>%
      group_by(activity) %>%
      summarise(total_cost = sum(cost)),
      by = 'activity') %>%
      transmute(
        Activity = activity,
        `Cost per village in one year` = total_cost / (villages * input$length/12),
        `Cost per person reached in one year` = total_cost / (villages * input$length/12 * input$vilSize))
    
    datatable(d, options = list(dom = 't'), rownames = FALSE) %>%
      formatCurrency(names(d), digits = 0)
  })

  output$plot_cost_category <- renderPlot({
    ggplot(data = total_costs()$d %>% filter(cost > 0), 
           aes(x = category, weight = cost)) +
      geom_bar() +
      labs(title = "Costs by Category", y = "Cost (US$)", x= "") +
      theme_minimal() +
      theme(axis.text=element_text(size = 15), text = element_text(size = 15), axis.text.x = element_text(angle = 45, vjust = 0.5))
  })

  output$plot_cost_activity   <- renderPlot({
    ggplot(data = total_costs()$d %>% filter(cost > 0), 
           aes(x = activity, weight = cost)) +
      geom_bar() +
      labs(title = "Costs by Activity", y = "Cost (US$)", x = "") +
      theme_minimal() +
      theme(axis.text=element_text(size = 15), text = element_text(size = 15), axis.text.x = element_text(angle = 45, vjust = 0.5))

  })
  
  
  # Downloadable csv of selected dataset ----
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("Costs", ".csv", sep = "")
    },
    content = function(file) {
      write.csv(total_costs()$d, file, row.names = FALSE)
    }
  )
  
  
}  # end of the server function