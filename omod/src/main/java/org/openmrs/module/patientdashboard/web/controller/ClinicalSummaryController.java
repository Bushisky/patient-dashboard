/**
 *  Copyright 2010 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Patient-dashboard module.
 *
 *  Patient-dashboard module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Patient-dashboard module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Patient-dashboard module.  If not, see <http://www.gnu.org/licenses/>.
 *
 **/

package org.openmrs.module.patientdashboard.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.openmrs.Concept;
import org.openmrs.Encounter;
import org.openmrs.EncounterType;
import org.openmrs.Location;
import org.openmrs.Obs;
import org.openmrs.Patient;
import org.openmrs.api.AdministrationService;
import org.openmrs.api.ConceptService;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.PatientDashboardService;
import org.openmrs.module.hospitalcore.util.PatientDashboardConstants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("ClinicalSummaryController")
@RequestMapping("/module/patientdashboard/clinicalSummary.htm")
public class ClinicalSummaryController {
	
	@RequestMapping(method=RequestMethod.GET)
	public String firstView(@RequestParam("patientId") Integer patientId,Model model){
		
		PatientDashboardService dashboardService =  Context.getService(PatientDashboardService.class);
        String orderLocationId = "1";
        Location location = Context.getLocationService().getLocation(Integer.parseInt(orderLocationId)) ;
		
        Patient patient = Context.getPatientService().getPatient(patientId);
        
        String gpOPDEncType = Context.getAdministrationService().getGlobalProperty(PatientDashboardConstants.PROPERTY_OPD_ENCOUTNER_TYPE);
        EncounterType labOPDType = Context.getEncounterService().getEncounterType(gpOPDEncType);
        
        ConceptService conceptService = Context.getConceptService();
        AdministrationService administrationService = Context.getAdministrationService();
        String gpDiagnosis = administrationService.getGlobalProperty(PatientDashboardConstants.PROPERTY_PROVISIONAL_DIAGNOSIS);
        
        String gpProcedure = administrationService.getGlobalProperty(PatientDashboardConstants.PROPERTY_POST_FOR_PROCEDURE);
        //	Sagar Bele Date:29-12-2012 Add field of visit outcome for Bangladesh requirement #552
        String gpVisitOutcome = administrationService.getGlobalProperty(PatientDashboardConstants.PROPERTY_VISIT_OUTCOME);
         
        //Signs
     
        String gpSigns = administrationService
				.getGlobalProperty(PatientDashboardConstants.PROPERTY_SIGNS_CONCEPT);
        
        //Differential Diagnosis
     
        String gpDifferentialDiagnosis = administrationService
				.getGlobalProperty(PatientDashboardConstants.PROPERTY_DIFFERENTIAL_DIAGNOSIS);
        //Working Diagnosis
        
        String gpWorkingDiagnosis = administrationService
				.getGlobalProperty(PatientDashboardConstants.PROPERTY_WORKING_DIAGNOSIS);
        //UnderLine Condition
        String gpUnderlinedCondition = administrationService
				.getGlobalProperty(PatientDashboardConstants.PROPERTY_UNDERLINED_CONDITION);
		//String gpInternalReferral = administrationService.getGlobalProperty(PatientDashboardConstants.PROPERTY_INTERNAL_REFERRAL);
        
		Concept conDiagnosis  = conceptService.getConcept(gpDiagnosis);
		
		Concept conProcedure  = conceptService.getConcept(gpProcedure);
//		Sagar Bele Date:29-12-2012 Add field of visit outcome for Bangladesh requirement #552
		Concept conOutcome  = conceptService.getConcept(gpVisitOutcome);
	
		//UnderLined Condition
				Concept conUnderlinedCondition = conceptService.getConcept(gpUnderlinedCondition);
		//Signs
				Concept conSigns = conceptService.getConcept(gpSigns);
		List<Encounter> encounters = dashboardService.getEncounter(patient, location, labOPDType, null);
          //Differential Diagnosis
		Concept conDifferentialDiagnosis = conceptService.getConcept(gpDifferentialDiagnosis);
		 //Working Diagnosis
		Concept conWorkingDiagnosis = conceptService.getConcept(gpWorkingDiagnosis);
		//  condiagnosis  
		// 
		// command
		String diagnosis = "";
		String procedure="";
		String outcome="";
		//UnderLined Condition
		String underlinedcondition = "";
		//Signs
		String signs = "";
		//Differential Diagnosis
		String differentialdiagnosis = "";
		//Working diagnosis
		String workingdiagnosis = "";
		List<Clinical> clinicalSummaries = new ArrayList<Clinical>();
		for( Encounter enc: encounters ){
			diagnosis = "";
			String note ="";
			procedure="";
			outcome="";
			//UnderLined Condition
			underlinedcondition = "";
			//signs
			signs = "";
			//Differential Diagnosis
			differentialdiagnosis = "";
			//Working diagnosis
			workingdiagnosis = "";
			Clinical clinical = new Clinical();
			for( Obs obs : enc.getAllObs()){
				//diagnosis
				if( obs.getConcept().getConceptId().equals(conDiagnosis.getConceptId()) ){
//					obs.getV
					if(obs.getValueCoded() != null){
						diagnosis +=obs.getValueCoded().getName()+", ";
					}
					if(StringUtils.isNotBlank(obs.getValueText())){
						note = "Note: "+obs.getValueText();
					}
					//System.out.println(obs.getva);
			
				}
				//procedure
				if( obs.getConcept().getConceptId().equals(conProcedure.getConceptId()) ){
//					obs.getV
					if(obs.getValueCoded() != null){
						procedure +=obs.getValueCoded().getName()+", ";
					}
					if(StringUtils.isNotBlank(obs.getValueText())){
						procedure +=obs.getValueText()+", ";
					}
				}
				
				//UnderLined Condition
				if( obs.getConcept().getConceptId().equals(conUnderlinedCondition.getConceptId()) ){
					
					if(obs.getValueCoded() != null){
						underlinedcondition +=obs.getValueCoded().getName()+", ";
					}
					if(StringUtils.isNotBlank(obs.getValueText())){
						underlinedcondition += obs.getValueText();
					}
					
			
				}
				//Signs
				if( obs.getConcept().getConceptId().equals(conSigns.getConceptId()) ){
					
					if(obs.getValueCoded() != null){
						signs +=obs.getValueCoded().getName()+", ";
					}
					if(StringUtils.isNotBlank(obs.getValueText())){
						signs += obs.getValueText();
					}
					
			
				}
				//Differential Diagnosis
				if( obs.getConcept().getConceptId().equals(conDifferentialDiagnosis.getConceptId()) ){
					
					if(obs.getValueCoded() != null){
						differentialdiagnosis +=obs.getValueCoded().getName()+", ";
					}
					if(StringUtils.isNotBlank(obs.getValueText())){
						differentialdiagnosis += obs.getValueText();
					}
					
			
				}
				//Working Diagnosis
				if( obs.getConcept().getConceptId().equals(conWorkingDiagnosis.getConceptId()) ){
					
					if(obs.getValueCoded() != null){
						workingdiagnosis +=obs.getValueCoded().getName()+", ";
					}
					if(StringUtils.isNotBlank(obs.getValueText())){
						workingdiagnosis += obs.getValueText();
					}
					
			
				}
//				Sagar Bele Date:29-12-2012 Add field of visit outcome for Bangladesh requirement #552
				//visit outcome
				if( obs.getConcept().getConceptId().equals(conOutcome.getConceptId()) ){
//					obs.getV
					if(obs.getValueCoded() != null){
						outcome +=obs.getValueCoded().getName()+", ";
					}
					if(StringUtils.isNotBlank(obs.getValueText())){
						outcome += obs.getValueText();
					}
					//System.out.println(obs.getva);
			
				}  
				
			}
			diagnosis += note;
			if( StringUtils.endsWith(diagnosis, ", ")){
				diagnosis = StringUtils.removeEnd(diagnosis, ", ");
			}
			if( StringUtils.endsWith(procedure, ", ")){
				procedure = StringUtils.removeEnd(procedure, ", ");
			}
			
			//Underlined Condition
			if( StringUtils.endsWith(underlinedcondition, ", ")){
				underlinedcondition = StringUtils.removeEnd(underlinedcondition, ", ");
			}
			
			//Signs
			
			if( StringUtils.endsWith(signs, ", ")){
				signs= StringUtils.removeEnd(signs, ", ");
			}
             //Differential diagnosis
			
			if( StringUtils.endsWith(differentialdiagnosis, ", ")){
				differentialdiagnosis= StringUtils.removeEnd(differentialdiagnosis, ", ");
			}
		     //Working diagnosis
			
			if( StringUtils.endsWith(workingdiagnosis, ", ")){
						workingdiagnosis= StringUtils.removeEnd(workingdiagnosis, ", ");
			}
//			Sagar Bele Date:29-12-2012 Add field of visit outcome for Bangladesh requirement #552
			if( StringUtils.endsWith(outcome, ", ")){
				outcome = StringUtils.removeEnd(outcome, ", ");
			} 	
			
			//${patient.givenName}&nbsp;&nbsp;${patient.middleName}&nbsp;&nbsp; ${patient.familyName}

			if(enc.getCreator().getPerson().getMiddleName()!=null)
			{	
				if(enc.getCreator().getPerson().getFamilyName()!=null){
					clinical.setTreatingDoctor(enc.getCreator().getPerson().getGivenName()+" "+enc.getCreator().getPerson().getFamilyName()+" "+enc.getCreator().getPerson().getMiddleName());
				}
				else{
					clinical.setTreatingDoctor(enc.getCreator().getPerson().getGivenName()+" "+enc.getCreator().getPerson().getMiddleName());
				}
			}
			else
			{
				if(enc.getCreator().getPerson().getFamilyName()!=null){
					clinical.setTreatingDoctor(enc.getCreator().getPerson().getGivenName()+" "+enc.getCreator().getPerson().getFamilyName());
				}
				else{
					clinical.setTreatingDoctor(enc.getCreator().getPerson().getGivenName());
				}
			}

			clinical.setDateOfVisit(enc.getDateCreated());
			clinical.setId(enc.getId());
			clinical.setDiagnosis(diagnosis);
			clinical.setProcedures(procedure);
			clinical.setVisitOutcomes(outcome);
			//UnderLined Condition
			clinical.setUnderlinedCondition(underlinedcondition);
			//signs
			clinical.setSigns(signs);
			//differential diagnosis
			clinical.setDifferentialdiagnosis(differentialdiagnosis);
			//differential diagnosis
			clinical.setWorkingdiagnosis(workingdiagnosis);
			clinicalSummaries.add(clinical);
			
			// set value to command object
			// add command to list
		};
		//System.out.println("clinicalSummaries: "+clinicalSummaries);
		model.addAttribute("patient", patient);
		model.addAttribute("clinicalSummaries", clinicalSummaries);
		return "module/patientdashboard/clinicalSummary";
	}
	
	public static void main(String[] args) {
		String a = "asfsf, dsf, ";
		a = StringUtils.removeEnd(a, ", ");
		System.out.println(a);
	}
}
