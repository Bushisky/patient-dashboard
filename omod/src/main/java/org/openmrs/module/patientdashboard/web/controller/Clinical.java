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

import java.util.Date;

public class Clinical {

	private Integer id;
	private Date dateOfVisit;
	private String typeOfVisit;
	private String treatingDoctor;
	private String diagnosis;
	//UnderLined Condition
    private String underlinedCondition;
    //signs
    private String signs;
    //differential diagnosis
    private String differentialdiagnosis;
    //working diagnosis
    private String workingdiagnosis;
    
	private String procedures ;
	private String visitOutcomes;
	private String linkedVisit;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getDateOfVisit() {
		return dateOfVisit;
	}
	public void setDateOfVisit(Date dateOfVisit) {
		this.dateOfVisit = dateOfVisit;
	}
	public String getTypeOfVisit() {
		return typeOfVisit;
	}
	public void setTypeOfVisit(String typeOfVisit) {
		this.typeOfVisit = typeOfVisit;
	}
	public String getTreatingDoctor() {
		return treatingDoctor;
	}
	public void setTreatingDoctor(String treatingDoctor) {
		this.treatingDoctor = treatingDoctor;
	}
	public String getDiagnosis() {
		return diagnosis;
	}
	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}
	public String getProcedures() {
		return procedures;
	}
	public void setProcedures(String procedures) {
		this.procedures = procedures;
	}
	public String getLinkedVisit() {
		return linkedVisit;
	}
	public void setLinkedVisit(String linkedVisit) {
		this.linkedVisit = linkedVisit;
	}
//	Sagar Bele Date:29-12-2012 Add field of visit outcome for Bangladesh requirement #552	
	public String getVisitOutcomes() {
		return visitOutcomes;
	}
	public void setVisitOutcomes(String visitOutcomes) {
		this.visitOutcomes = visitOutcomes;
	}
	public String getUnderlinedCondition() {
		return underlinedCondition;
	}
	public void setUnderlinedCondition(String underlinedCondition) {
		this.underlinedCondition = underlinedCondition;
	}
	public String getSigns() {
		return signs;
	}
	public void setSigns(String signs) {
		this.signs = signs;
	}
	public String getDifferentialdiagnosis() {
		return differentialdiagnosis;
	}
	public void setDifferentialdiagnosis(String differentialdiagnosis) {
		this.differentialdiagnosis = differentialdiagnosis;
	}
	public String getWorkingdiagnosis() {
		return workingdiagnosis;
	}
	public void setWorkingdiagnosis(String workingdiagnosis) {
		this.workingdiagnosis = workingdiagnosis;
	}
	

}
