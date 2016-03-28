
<%--
 *  Copyright 2009 Society for Health Information Systems Programmes, India (HISP India)
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
--%>
<%@ include file="/WEB-INF/template/include.jsp"%>
<openmrs:require privilege="View PatientDashboard"
	otherwise="/login.htm" redirect="index.htm" />

<style type="text/css">
.drug-order {
	width: 100%;
}

.drugs {
	width: 16%;
	height: 10%;
	float: left;
}

.formulation {
	width: 23%;
	height: 10%;
	float: left;
}

.frequency {
	width: 23%;
	height: 10%;
	float: left;
}

.no-of-days {
	width: 13%;
	height: 10%;
	float: left;
}

.ui-button {
	margin-left: -1px;
}

.ui-button-icon-only .ui-button-text {
	padding: 0.35em;
}

.ui-autocomplete-input {
	margin: 0;
	padding: 0.48em 0 0.47em 0.45em;
}

.floatLeft {
	width: 80%;
	float: left;
}

.floatRight {
	width: 20%;
	float: right;
}

.container {
	overflow: hidden;
}

#history {
    resize: none;
}

</style>
<script type="text/javascript">
function getContextPath(){		
		pn = location.pathname;
		len = pn.indexOf("/", 1);				
		cp = pn.substring(0, len);
		return cp;
	}
</script>
<script type="text/javascript">
function validateTriage(){

var intRegex=/^(?:[1-9]\d*(?:\.\d\d?)?|0\.[1-9]\d?|0\.0[1-9])$/;


if(!StringUtils.isBlank(jQuery("#weight").val())) {
      if (!jQuery("#weight").val().match(intRegex)) {
	  alert("Please enter weight in correct format");
	  return false;
	  }
}

if(!StringUtils.isBlank(jQuery("#height").val())) {
      if (!jQuery("#height").val().match(intRegex)) {
	  alert("Please enter height in correct format");
	  return false;
	  }
}

if(!StringUtils.isBlank(jQuery("#mua").val())) {
      if (!jQuery("#mua").val().match(intRegex)) {
	  alert("Please enter MUA Circumference in correct format");
	  return false;
	  }
}

if(!StringUtils.isBlank(jQuery("#chest").val())) {
      if (!jQuery("#chest").val().match(intRegex)) {
	  alert("Please enter Chest Circumference in correct format");
	  return false;
	  }
}

if(!StringUtils.isBlank(jQuery("#abdominal").val())) {
      if (!jQuery("#abdominal").val().match(intRegex)) {
	  alert("Please enter Abdominal Circumference in correct format");
	  return false;
	  }
}

if(!StringUtils.isBlank(jQuery("#temperature").val())) {
      if (!jQuery("#temperature").val().match(intRegex)) {
	  alert("Please enter temperature in correct format");
	  return false;
	  }
}

if(!StringUtils.isBlank(jQuery("#systolic").val())) {
      if (!jQuery("#systolic").val().match(intRegex)) {
	  alert("Please enter Systolic B.P in correct format");
	  return false;
	  }
}

if(!StringUtils.isBlank(jQuery("#daistolic").val())) {
      if (!jQuery("#daistolic").val().match(intRegex)) {
	  alert("Please enter Diastolic B.P in correct format");
	  return false;
	  }
}

if(!StringUtils.isBlank(jQuery("#respiratoryRate").val())) {
      if (!jQuery("#respiratoryRate").val().match(intRegex)) {
	  alert("Please enter Respiratory Rate in correct format");
	  return false;
	  }
}

if(!StringUtils.isBlank(jQuery("#pulsRate").val())) {
      if (!jQuery("#pulsRate").val().match(intRegex)) {
	  alert("Please enter Pulse Rate in correct format");
	  return false;
	  }
}


			
 re = /^\d{1,2}\/\d{1,2}\/\d{4}$/; 
 if(jQuery("#lastMenstrualPeriod").val() != '' && !jQuery("#lastMenstrualPeriod").val().match(re))  
 {
 alert("Invalid date format");
 jQuery("#lastMenstrualPeriod").val('');
 return false; 
 } 					
jQuery("#rhesusFactor").removeAttr("disabled");
jQuery("#lastMenstrualPeriod").removeAttr("disabled");


}
</script>
<script type="text/javascript">
function enableAndDisable(){
jQuery("#bloodGroup").click(function() {
				if (StringUtils.isBlank(jQuery("#bloodGroup").val())) {
				jQuery("#rhesusFactor").attr("disabled", "disabled");
				}
				else if (jQuery("#bloodGroup").val()=="Not Known"){
				jQuery("#rhesusFactor").attr("disabled", "disabled");
				}
                else{
              jQuery("#rhesusFactor").removeAttr("disabled");
			}
		});
}
</script>
<script type="text/JavaScript">
function calculateBmi(){
var weight = jQuery("#weight").val();
var height = jQuery("#height").val();	
var Bmi =  jQuery("#weight").val()/((jQuery("#height").val()/100)*(jQuery("#height").val()/100));

var b=Math.round(Bmi);
jQuery("#BMI").val(b);
}

</script>
<script type="text/javascript">
	jQuery(document).ready( 
			function() {
			jQuery("#abc").hide();
			jQuery("#divAvailableSymptomList").hide();
			jQuery("#symp").hide();jQuery("#selectedSymptomList").hide();
			jQuery("#but").hide();
			jQuery("#divAvailableExaminationList").hide();
			 jQuery("#selectedExaminationList").hide();
			 jQuery("#exm").hide();
			 jQuery("#buttns").hide();
			 
			 jQuery("#divAvailableSignsList").hide();
			 jQuery("#selectedSignsList").hide();
		    	jQuery("#sn").hide();
		    	jQuery("#sgn").hide();
		    	
		    	jQuery("#divAvailableDiagnosisList").hide();
		    	jQuery("#selectedDiagnosisList").hide();
		    	jQuery("#dgn").hide();
		    	jQuery("#diag").hide();
		    	
		    	jQuery("#divAvailableProcedureList").hide();
		    	jQuery("#pop").hide();
				jQuery("#procedre").hide();
				jQuery("#drgs").hide();
		    	jQuery("#drug").hide();
		    	jQuery("#other").hide();
				jQuery("#othrins").hide();
		    	jQuery("#dd").hide();
		    	jQuery("#pro").hide();
		    	jQuery("#headerValue").hide();
		    	jQuery("#add").hide();
		    	jQuery("#pop").hide();
		    	jQuery("#pp").hide();
		    	jQuery("#note").hide();
		    	jQuery("#selectedProcedureList").hide();
		    	jQuery("#btns").hide();
		    	 jQuery("#diff").hide();
		    	jQuery("#divAvailableDifferentialDiagnosisList").hide();
		    	jQuery("#selectedDifferentialList").hide();
		    	jQuery("#dfnbut").hide();
		    	jQuery("#wrknd").hide();
		    	jQuery("#divAvailableWorkingDiagnosisList").hide();
		    	jQuery("#wrkngdig").hide();
		    	jQuery("#selectedWorkingList").hide();
		    	jQuery("#interref").hide();
				jQuery("#externalref").hide();
				jQuery("#outcome").hide();
		    	jQuery("#divAvailableUnderLinedConditionList").hide();
		    	jQuery("#under").hide();
		    	jQuery("#selectedUnderLinedList").hide();
		    	jQuery("#undr").hide();
		    	jQuery("#divAvailableInvestigationList").hide();
		    	jQuery("#investing").hide();
				jQuery("#invest").hide();
		    	jQuery("#selectedInvestigationList").hide();
		    	jQuery("#current").hide();
		    	
		    	
		    	jQuery("#abcd").hide();
		    	jQuery("#xyz").hide();
		    	jQuery("#ex").hide();
				jQuery("#histry").click(function()
						{
					     jQuery("#abc").toggle();
					    
						});
				jQuery("#syptom").click(function(){
					jQuery("#xyz").toggle();
					
				jQuery("#divAvailableSymptomList").toggle();
				jQuery("#symp").toggle();
				jQuery("#selectedSymptomList").toggle();
				jQuery("#but").toggle();
				});
			    
				jQuery("#exmntion").click(function(){ jQuery("#ex").toggle();jQuery("#divAvailableExaminationList").toggle();
			    jQuery("#selectedExaminationList").toggle();
			    jQuery("#exm").toggle();
			    jQuery("#buttns").toggle();
			    
				});
			    
			    
			    
			    jQuery("#sins").click(function(){ jQuery("#sgn").toggle();
			    	jQuery("#divAvailableSignsList").toggle();
			    	jQuery("#selectedSignsList").toggle();
			    	jQuery("#sn").toggle();
			    	
			    });
			    jQuery("#dig").click(function(){jQuery("#diag").toggle();
			    	jQuery("#divAvailableDiagnosisList").toggle();
			    	jQuery("#selectedDiagnosisList").toggle();
			    	jQuery("#dgn").toggle();
			    });
			    jQuery("#treatment").click(function()
			    		{
			    	jQuery("#procedre").toggle();
			    	jQuery("#drgs").toggle();
			    	
			    	jQuery("#othrins").toggle();
					
			    	
			    	
			    	
			    });
			    jQuery("#drgs").click(function()
			    		{
			    	 jQuery("#drug").toggle();
			    	jQuery("#dd").toggle();
			    	jQuery("#headerValue").toggle();
			    	jQuery("#add").toggle();
			    	
			    });
			    jQuery("#procedre").click(function()
			    		{
			    	
			    	jQuery("#divAvailableProcedureList").toggle();
			    	jQuery("#pop").toggle();
			    	jQuery("#pp").toggle();
			    	jQuery("#selectedProcedureList").toggle();
			    	jQuery("#btns").toggle();
			    		});
						
			    
			    jQuery("#othrins").click(function()
			    		{
							jQuery("#other").toggle();
			    	jQuery("#note").toggle();
			    	
			    	
			    });
			    jQuery("#difrntial").click(function()
			    		{
							 jQuery("#diff").toggle();
			    	
			    	jQuery("#divAvailableDifferentialDiagnosisList").toggle();
			    	jQuery("#selectedDifferentialList").toggle();
			    	jQuery("#dfnbut").toggle();
			    	
			    });
			    jQuery("#wrking").click(function()
			    		{
			    	jQuery("#wrknd").toggle();
			    	jQuery("#divAvailableWorkingDiagnosisList").toggle();
			    	jQuery("#wrkngdig").toggle();
			    	jQuery("#selectedWorkingList").toggle();
			    		});
			    
			    jQuery("#underlned").click(function()
			    		{
			    	jQuery("#undr").toggle();
			    	jQuery("#divAvailableUnderLinedConditionList").toggle();
			    	jQuery("#under").toggle();
			    	jQuery("#selectedUnderLinedList").toggle();
			    		});
			    
			    jQuery("#investgtion").click(function()
			    		{
			    	jQuery("#invest").toggle();
			    	jQuery("#divAvailableInvestigationList").toggle();
			    	jQuery("#investing").toggle();
			    	jQuery("#selectedInvestigationList").toggle();
			    		});
			    
			     jQuery("#triageDiv").click(function()
			    		{
			    	jQuery("#current").toggle();
			    	
			    	
			    		});
			     
			     jQuery("#intrnal").click(function()
			    		{jQuery("#interref").toggle();
			    	
			    	
			    		});
			    
			     jQuery("#extrnal").click(function()
				    		{ jQuery("#externalref").toggle();
				    	
				    	
				    		});
			     jQuery("#outcum").click(function()
				    		{
						jQuery("#outcome").toggle();
				    	jQuery("#abcd").toggle();
				    	
				    		});  
			    
				var href = window.top.location.href;
				
				if (StringUtils.isBlank(jQuery("#bloodGroup").val())) {
				jQuery("#rhesusFactor").attr("disabled", "disabled");
				}
				if (href.indexOf('Referred') > -1) 
				{
				  $("#triageDiv").hide();
				} 
				
				var $dia = $('input:radio[name=radio_dia]');
	    		if($dia.is(':checked') === false) {
	    		
	        		$dia.filter('[value=prov_dia]').attr('checked', true);
	    		}
				jQuery('#lastMenstrualPeriod').datepicker({
					yearRange : 'c-100:c+100',
					dateFormat : 'dd/mm/yy',
					changeMonth : true,
					changeYear : true
				});
				jQuery("#calendarButton").click(function() {
					jQuery("#lastMenstrualPeriod").datepicker("show");
				});	
				
				if("${patient.gender }"=="M"){
			    jQuery("#lastMenstrualPeriod").attr("disabled", "disabled");
			   	jQuery("#calendarButton").hide();
			    }
				
				$("#lblPrompt").hide();
				
				
	function loadSelectedSymptomList()
	{
		if(${symptomIdSet}.length > 0)
		{

		var symIdToBeAdded = ('${symptomIdSet}')
		var symNameToBeAdded = ('${symNameSet}')
		symIdToBeAdded = symIdToBeAdded.substr(1);
		symIdToBeAdded = symIdToBeAdded.substr(0,symIdToBeAdded.length - 1);	
		symNameToBeAdded = symNameToBeAdded.substr(1);
		symNameToBeAdded = symNameToBeAdded.substring(0, symNameToBeAdded.length - 1);	
		var sIdArr = symIdToBeAdded.split(",");
		var sNameArr = symNameToBeAdded.split(",");
		
		var ssl = $("#selectedSymptomList");
		var abc="";
		var selectedSymptom = new Array();
		for (var i = 0; i < sIdArr.length; i++)
		{ 	
			 sNameArr[i] = sNameArr[i].replaceAll("@", ",");
			 ssl.append("<option value='"+sIdArr[i].trim()+"'>"+sNameArr[i].trim()+"</option>");
		     var n = sIdArr[i].trim().toString(); 
		     selectedSymptom.push(n);
			 abc = abc.concat(n);
			 abc = abc.concat(",");
		}  
	
	
	     
	   	 jQuery.ajax({
			type : "GET",	
			url : getContextPath() + "/module/patientdashboard/getQuestion.htm",
			data : ({
				selectedSymptom			: abc
			}),
			success : function(data) {
				jQuery("#questionDiv").html(data);	
				
			}
			
			
			});
		}		
			
}
	//Examination
	function loadSelectedExaminationList()
	{
		if(${examinationIdSet}.length > 0)
		{

		var exmIdToBeAdded = ('${examinationIdSet}')
		var exmNameToBeAdded = ('${exmNameSet}')
		exmIdToBeAdded = exmIdToBeAdded.substr(1);
		exmIdToBeAdded = exmIdToBeAdded.substr(0,exmIdToBeAdded.length - 1);	
		exmNameToBeAdded = exmNameToBeAdded.substr(1);
		exmNameToBeAdded = exmNameToBeAdded.substring(0, exmNameToBeAdded.length - 1);	
		var eIdArr = exmIdToBeAdded.split(",");
		var eNameArr = exmNameToBeAdded.split(",");
		
		var sel = $("#selectedExaminationList");
		var abc="";
		var selectedExamination = new Array();
		for (var i = 0; i < eIdArr.length; i++)
		{ 	
			 eNameArr[i] = eNameArr[i].replaceAll("@", ",");
			 sel.append("<option value='"+eIdArr[i].trim()+"'>"+eNameArr[i].trim()+"</option>");
		     var n = eIdArr[i].trim().toString(); 
		     selectedExamination.push(n);
			 abc = abc.concat(n);
			 abc = abc.concat(",");
		}  
	
	
	     
	   	 jQuery.ajax({
			type : "GET",	
			url : getContextPath() + "/module/patientdashboard/getQuest.htm",
			data : ({
				selectedExamination		: abc
			}),
			success : function(data) {
				jQuery("#questDiv").html(data);	
				
			}
			
			
			});
		}		
			
}
//signs
function loadSelectedSignsList()
{
	if(${signsIdSet}.length > 0)
	{
	var signIdToBeAdded = ('${signsIdSet}');
	
	var signNameToBeAdded = ('${signedNameSet}');
	
	signIdToBeAdded = signIdToBeAdded.substr(1);

	signIdToBeAdded = signIdToBeAdded.substring(0, signIdToBeAdded.length - 1);	
	
	signNameToBeAdded = signNameToBeAdded.substr(1);

	signNameToBeAdded = signNameToBeAdded.substring(0, signNameToBeAdded.length - 1);	
	
	var sgnIdArr = signIdToBeAdded.split(",");
	
	var sgnNameArr = signNameToBeAdded.split(",");
	
	var sgndl = $("#selectedSignsList");
		for (var i = 0; i < sgnIdArr.length; i++)
		{
			sgnNameArr[i] = sgnNameArr[i].replaceAll("@", ",");
		     sgndl.append("<option value='" +sgnIdArr[i]+ "'>" +  sgnNameArr[i] + "</option>");
	   	}
   	}
}
//diagnosis
function loadSelectedDiagnosisList()
{
	if(${diagnosisIdSet}.length > 0)
	{
	var diagIdToBeAdded = ('${diagnosisIdSet}');
	var diagNameToBeAdded = ('${diaNameSet}');
	diagIdToBeAdded = diagIdToBeAdded.substr(1);
	diagIdToBeAdded = diagIdToBeAdded.substring(0, diagIdToBeAdded.length - 1);	
	diagNameToBeAdded = diagNameToBeAdded.substr(1);
	diagNameToBeAdded = diagNameToBeAdded.substring(0, diagNameToBeAdded.length - 1);	
	var dIdArr = diagIdToBeAdded.split(",");
	var dNameArr = diagNameToBeAdded.split(",");
	
	var sdl = $("#selectedDiagnosisList");
		for (var i = 0; i < dIdArr.length; i++)
		{
			 dNameArr[i] = dNameArr[i].replaceAll("@", ",");
		     sdl.append("<option value='" + dIdArr[i]+ "'>" +  dNameArr[i] + "</option>");
	   	}
   	}
}
//Differential diagnosis
function loadSelectedDifferentialDiagnosisList()
{
	if(${diagnosisIdSet}.length > 0)
	{
	var diffIdToBeAdded = ('${differentialIdSet}');
	
	var diffNameToBeAdded = ('${differentialedNameSet}');
	diffIdToBeAdded = diffIdToBeAdded.substr(1);
	diffIdToBeAdded =diffIdToBeAdded.substring(0, diffIdToBeAdded.length - 1);	
	diffNameToBeAdded = diffNameToBeAdded.substr(1);
	diffNameToBeAdded = diffNameToBeAdded.substring(0, diffNameToBeAdded.length - 1);	
	var diffIdArr = diffIdToBeAdded.split(",");
	var diffNameArr = diffNameToBeAdded.split(",");
	
	var diffdl = $("#selectedDifferentialList");
		for (var i = 0; i < diffIdArr.length; i++)
		{
			diffNameArr[i] = diffNameArr[i].replaceAll("@", ",");
		    diffdl.append("<option value='" + diffIdArr[i]+ "'>" +  diffNameArr[i] + "</option>");
	   	}
   	}
}
//Working diagnosis
function loadSelectedWorkingDiagnosisList()
{
	if(${workingIdSet}.length > 0)
	{
	var wrkngIdToBeAdded = ('${workingIdSet}');
	var wrkngNameToBeAdded = ('${workinedNameSet}');
	wrkngIdToBeAdded = wrkngIdToBeAdded.substr(1);
	wrkngIdToBeAdded =wrkngIdToBeAdded.substring(0, wrkngIdToBeAdded.length - 1);	
	wrkngNameToBeAdded = wrkngNameToBeAdded.substr(1);
	wrkngNameToBeAdded = wrkngNameToBeAdded.substring(0, wrkngNameToBeAdded.length - 1);	
	var wrkngIdArr = wrkngIdToBeAdded.split(",");
	var wrkngNameArr = wrkngNameToBeAdded.split(",");
	
	var wrkngdl = $("#selectedWorkingList");
		for (var i = 0; i < wrkngIdArr.length; i++)
		{
			wrkngNameArr[i] =wrkngNameArr[i].replaceAll("@", ",");
		    wrkngdl.append("<option value='" + wrkngIdArr[i]+ "'>" +  wrkngNameArr[i] + "</option>");
	   	}
   	}
}
//UnderLined Condition
function loadSelectedUnderLinedConditionList()
{
	if(${underlinedconditionIdSet}.length > 0)
	{
	var underconditionIdToBeAdded = ('${underlinedconditionIdSet}');
	var underconditionNameToBeAdded = ('${underlinedNameSet}');
	underconditionIdToBeAdded = underconditionIdToBeAdded.substr(1);
	underconditionIdToBeAdded = underconditionIdToBeAdded.substring(0, underconditionIdToBeAdded.length - 1);	
	underconditionNameToBeAdded = underconditionNameToBeAdded.substr(1);
	underconditionNameToBeAdded = underconditionNameToBeAdded.substring(0, underconditionNameToBeAdded.length - 1);	
	var uIdArr = underconditionIdToBeAdded.split(",");
	var uNameArr = underconditionNameToBeAdded.split(",");
	var udl = $("#selectedUnderLinedList");
		for (var i = 0; i < uIdArr.length; i++)
		{      
			 uNameArr[i] = uNameArr[i].replaceAll("@", ",");
			 
		     udl.append("<option value='" + uIdArr[i]+ "'>" +  uNameArr[i] + "</option>");
	   	}
   	}
}
	loadSelectedSymptomList();
	loadSelectedExaminationList();
	loadSelectedDiagnosisList();
	//signs
	loadSelectedSignsList();
	//differential diagnosis
	loadSelectedDifferentialDiagnosisList();
	//Working diagnosis
	loadSelectedWorkingDiagnosisList();
	//UnderLined Condition
	loadSelectedUnderLinedConditionList();
	   
});
</script>

<script type="text/javascript">
function radio_fSelected()
{
	$("#lblPrompt").show();
	
}

function removePrompt()
{
	$("#lblPrompt").hide();
	
}

function removeSelectedDia()
{
$("#selectedDiagnosisList").empty();
}

function loadSelectedDiagnosisList()
{
	if(${diagnosisIdSet}.length > 0)
	{
	var diagIdToBeAdded = ('${diagnosisIdSet}');
	var diagNameToBeAdded = ('${diaNameSet}');
	diagIdToBeAdded = diagIdToBeAdded.substr(1);
	diagIdToBeAdded = diagIdToBeAdded.substring(0, diagIdToBeAdded.length - 1);	
	diagNameToBeAdded = diagNameToBeAdded.substr(1);
	diagNameToBeAdded = diagNameToBeAdded.substring(0, diagNameToBeAdded.length - 1);	
	var dIdArr = diagIdToBeAdded.split(",");
	var dNameArr = diagNameToBeAdded.split(",");
	
	var sdl = $("#selectedDiagnosisList");
	for (var i = 0; i < dIdArr.length; i++)
	{
		 dNameArr[i] = dNameArr[i].replaceAll("@", ",");
	     sdl.append("<option value='" + dIdArr[i]+ "'>" +  dNameArr[i] + "</option>");
   	}
   	}
}

</script>

<script type="text/javascript">
function stopRKey(evt) {
  var evt = (evt) ? evt : ((event) ? event : null);
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;}
}

document.onkeypress = stopRKey; 

var drugIssuedList = new Array();
function addDrugOrder() {
   var drugName=document.getElementById('drugName').value;
   drugIssuedList.push(drugName);
   if(drugName==null || drugName==""){
   alert("Please enter drug name");
   return false;
   }else{
   var formulation=document.getElementById('formulation').value;
   if(formulation==null || formulation==""){
   alert("Please select formulation");
   return false;
   }
   var formulationArr=formulation.split("."); 
   var frequency=document.getElementById('frequency').value;
   if(frequency==null || frequency==""){
   alert("Please select frequency");
   return false;
   }
   var frequencyArr=frequency.split("."); 
   var noOfDays=document.getElementById('noOfDays').value;
   if(noOfDays==null || noOfDays==""){
   alert("Please enter no of days");
   return false;
   }
   if (noOfDays!=null || noOfDays!=""){
    if(isNaN(noOfDays)){
    alert("Please enter no of days in correct format");
    return false;
    }
   }
   var comments=document.getElementById('comments').value;
   var deleteString = 'deleteInput(\"'+drugName+'\")';
   var htmlText =  "<div id='com_"+drugName+"_div'>"
	       	 +"<input id='"+drugName+"_name'  name='drugOrder' type='text' size='14' value='"+drugName+"'  readonly='readonly'/>&nbsp;&nbsp;"
	       	 +"<input id='"+drugName+"_formulationName'  name='"+drugName+"_formulatioNname' type='text' size='14' value='"+formulationArr[0]+"'  readonly='readonly'/>&nbsp;&nbsp;"
	       	 +"<input id='"+drugName+"_frequencyName'  name='"+drugName+"_frequencyName' type='text' size='6' value='"+frequencyArr[0]+"'  readonly='readonly'/>&nbsp;&nbsp;"
	       	 +"<input id='"+drugName+"_noOfDays'  name='"+drugName+"_noOfDays' type='text' size='7' value='"+noOfDays+"'  readonly='readonly'/>&nbsp;&nbsp;"
	       	 +"<input id='"+drugName+"_comments'  name='"+drugName+"_comments' type='text' size='17' value='"+comments+"'  readonly='readonly'/>&nbsp;&nbsp;"
	       	 +"<input id='"+drugName+"_formulationId'  name='"+drugName+"_formulationId' type='hidden' value='"+formulationArr[1]+"'/>&nbsp;"
	       	 +"<input id='"+drugName+"_frequencyId'  name='"+drugName+"_frequencyId' type='hidden' value='"+frequencyArr[1]+"'/>&nbsp;"
	       	 +"<a style='color:red' href='#' onclick='"+deleteString+"' >[X]</a>"		
	       	 +"</div>";
	       	
   var newElement = document.createElement('div');
   newElement.setAttribute("id", drugName);   
   newElement.innerHTML = htmlText;
   var fieldsArea = document.getElementById('headerValue');
   fieldsArea.appendChild(newElement);
   jQuery("#drugName").val("");
   jQuery("#formulation").val("");
   jQuery("#frequency").val("");
   jQuery("#noOfDays").val("");
   jQuery("#comments").val("");
   }
}

function deleteInput(drugName) {
   var parentDiv = 'headerValue';
   var child = document.getElementById(drugName);
   var parent = document.getElementById(parentDiv);
   parent.removeChild(child); 
   Array.prototype.remove = function(v) { this.splice(this.indexOf(v) == -1 ? this.length : this.indexOf(v), 1); }
   drugIssuedList.remove(drugName);
}

var minorOTProcedures = new Array();
<c:forEach items="${allMinorOTProcedures}" var="item">
			minorOTProcedures.push("${item}");
</c:forEach>

var majorOTProcedures = new Array();
<c:forEach items="${allMajorOTProcedures}" var="item">
			majorOTProcedures.push("${item}");
</c:forEach>

function showSchedule(){
var url = "#TB_inline?height=400&width=400&inlineId=scheduleDiv";
tb_show("Schedule the procedues",url,false);
}

function getQuestion(){
var selLen = selectedSymptomList.length;
var i;
var selectedSymptom = new Array();
var dat1;
var abc="";
for(i=selLen-1; i>=0; i--){
var dat1=selectedSymptomList[i].value;
var n = dat1.toString(); 
selectedSymptom.push(n);
abc = abc.concat(n);
abc = abc.concat(",");
}
jQuery.ajax({
			type : "GET",	
			url : getContextPath() + "/module/patientdashboard/getQuestion.htm",
			data : ({
				selectedSymptom			: abc
			}),
			success : function(data) {
				jQuery("#questionDiv").html(data);	
			}
			});
}
//Examination
function getQuest(){
	var selLen = selectedExaminationList.length;
	var i;
	var selectedExamination = new Array();
	var dat1;
	var abc="";
	for(i=selLen-1; i>=0; i--){
	var dat1=selectedExaminationList[i].value;
	var n = dat1.toString(); 
	selectedExamination.push(n);
	abc = abc.concat(n);
	abc = abc.concat(",");
	}
	jQuery.ajax({
				type : "GET",	
				url : getContextPath() + "/module/patientdashboard/getQuest.htm",
				data : ({
					selectedExamination		: abc
				}),
				success : function(data) {
					jQuery("#questDiv").html(data);	
				}
				});
	}
function removeSymptom(){
var selLen = selectedSymptomList.length;
var i;
for(i=selLen-1; i>=0; i--){
var dat1=selectedSymptomList[i].value;
var splts=dat1.toString();
var spltswhs="#".concat(splts); 
$('spltswhs').remove();
}
getQuestion();
}
//Examination
function removeExamination(){
var selLen = selectedExaminationList.length;

var i;
for(i=selLen-1; i>=0; i--){
var dat1=selectedExaminationList[i].value;

var splts=dat1.toString();

var spltswhs="#".concat(splts); 

$('spltswhs').remove();
}
getQuest();
}
function viewQuestion(){
var url = "#TB_inline?height=500&width=1000&inlineId=questionDiv";
tb_show("View Question",url,false);
}
function viewQuest(){
	var url = "#TB_inline?height=500&width=1450&inlineId=questDiv";
	tb_show("View Question",url,false);
	}
// Print the slip
function print(){
var submitStatus=0;
jQuery("#opdEntryForm").keypress(function(event){		
if(event.keyCode == 13){	
submitStatus=1;	
}
else{
submitStatus=0;
}
});

var visitOutCome = $('input:radio[name=radio_f]:checked').val();

if(selectedSymptomList.length!=0 && selectedDiagnosisList.length!=0 && visitOutCome!=undefined){
if(validateOnSubmit()){
var history = document.getElementById('history').value;
jQuery("#printableHistoryOfPresentIllness").append("<span style='margin:5px;'>" + history + "</span>");

var selSymLen = selectedSymptomList.length;
for(i=selSymLen-1; i>=0; i--){
var sym=selectedSymptomList[i].text;
jQuery("#printableSymptom").append("<span style='margin:5px;'>" + sym + "<br/>" + "</span>");
}
var selExmLen = selectedExaminationList.length;
for(i=selExmLen-1; i>=0; i--){
var exm=selectedExaminationList[i].text;
jQuery("#printableExamination").append("<span style='margin:5px;'>" + exm + "<br/>" + "</span>");
}
//Signs
var selSignsLen = selectedSignsList.length;
for(i=selSignsLen-1; i>=0; i--){
var signed=selectedSignsList[i].text;
jQuery("#printableSign").append("<span style='margin:5px;'>" + signed + "<br/>" + "</span>");
}
//Diagnosis
var selDiagLen = selectedDiagnosisList.length;
for(i=selDiagLen-1; i>=0; i--){
var diag=selectedDiagnosisList[i].text;
jQuery("#printableProvisionalDiagnosis").append("<span style='margin:5px;'>" + diag + "<br/>" + "</span>");
}
//Differential Diagnosis
var selDifferentialLen = selectedDifferentialList.length;
for(i=selDifferentialLen -1; i>=0; i--){
var diff=selectedDifferentialList[i].text;
jQuery("#printableDifferential").append("<span style='margin:5px;'>" + diff + "<br/>" + "</span>");
}

//Working Diagnosis
var selWorkingLen = selectedWorkingList.length;
for(i=selWorkingLen -1; i>=0; i--){
var wrkng=selectedWorkingList[i].text;
jQuery("#printableWorking").append("<span style='margin:5px;'>" + wrkng + "<br/>" + "</span>");
}
//UnderLined Condition
var selUnderLinedConditionLen = selectedUnderLinedList.length;
for(i=selUnderLinedConditionLen-1; i>=0; i--){
var underLinedCondition=selectedUnderLinedList[i].text;
jQuery("#printableUnderLinedCondition").append("<span style='margin:5px;'>" + underLinedCondition + "<br/>" + "</span>");
}


var selProLen = selectedProcedureList.length;
for(i=selProLen-1; i>=0; i--){
var pro=selectedProcedureList[i].text;
jQuery("#printablePostForProcedure").append("<span style='margin:5px;'>" + pro + "<br/>" + "</span>");
}

var selInvgLen = selectedInvestigationList.length;
for(i=selInvgLen-1; i>=0; i--){
var invg=selectedInvestigationList[i].text;
jQuery("#printableInvestigation").append("<span style='margin:5px;'>" + invg + "<br/>" + "</span>");
}


var selDrugLen = drugIssuedList.length;
var j=1;
var alreadyAdded ;
var addedDrug = drugIssuedList[selDrugLen-1];; 
for(i=selDrugLen-1; i>=0; i--){
var drug=drugIssuedList[i];
if(alreadyAdded != drug)
{
var formulationName=document.getElementById(drug+"_formulationName").value;
var frequencyName=document.getElementById(drug+"_frequencyName").value;
var noOfDays=document.getElementById(drug+"_noOfDays").value;
var comments=document.getElementById(drug+"_comments").value;
alreadyAdded = drug;
jQuery("#printableSlNo").append("<span style='margin:5px;'>" + j + "<br/>" + "</span>");
jQuery("#printableDrug").append("<span style='margin:5px;'>" + drug + "<br/>" + "</span>");
jQuery("#printableFormulation").append("<span style='margin:5px;'>" + formulationName + "<br/>" + "</span>");
jQuery("#printableFrequency").append("<span style='margin:5px;'>" + frequencyName + "<br/>" + "</span>");
jQuery("#printableNoOfDays").append("<span style='margin:5px;'>" + noOfDays + "<br/>" + "</span>");
jQuery("#printableComments").append("<span style='margin:5px;'>" + comments + "<br/>" + "</span>");
j++;
}
}

var noteValue = document.getElementById('note').value;
jQuery("#printableOtherInstructions").append("<span style='margin:5px;'>" + noteValue + "</span>");

var internalReferral = document.getElementById('internalReferral').value;
if(internalReferral!=""){
jQuery("#printableInternalReferral").append("<span style='margin:5px;'>" + internalReferral + "</span>");
}

var externalReferral = document.getElementById('externalReferral').value;
if(externalReferral!=""){
jQuery("#printableExternalReferral").append("<span style='margin:5px;'>" + externalReferral + "</span>");
}

jQuery("#printableOPDVisitOutCome").append("<span style='margin:5px;'>" + visitOutCome + "</span>");

jQuery("#printOPDSlip").printArea({
mode : "popup",
popClose : true
});

  }

 }
}


function validateOnSubmit(){
var i;

if(document.getElementById('admit').checked && '${ipdPatientAdmission}'!="") {
alert("Patient already sent for admission");
return false;
}

if(selectedProcedureList.length>0){
for(i=selectedProcedureList.length-1; i>=0; i--){
var spl=selectedProcedureList.options[i].value;
var splts=spl.toString();
if(document.getElementById(splts)!=null){
var procedure=document.getElementById(splts).value;
if(procedure==null || procedure==""){
   alert("Please schedule the procedure");
   return false;
   }
  }
 }

}



return true;

}
</script>

<b class="boxHeader">Clinical Notes</b>
<form class="box" method="post" action="opdEntry.htm" id="opdEntryForm" onsubmit="return validateOnSubmit();">
 
	
	<input type="hidden" name="patientId" value="${patientId }" /> <input
		type="hidden" name="opdId" value="${opd.conceptId }" /> <input
		type="hidden" name="queueId" id="queueId" value="${queueId }" />
		<input
		type="hidden" name="opdLogId" id="opdLogId" value="${opdLogId }" />
  
     
	<div class="container">
		<div class="floatLeft"> 
		<!--  end of floatRight -->
			<tr>
				<table cellspacing="2">
					<!--  
		<tr align="right">
			<td colspan="3"><c:if test="${not empty queueId }">
					<input type="submit" value="Conclude visit"
						class="ui-button ui-widget ui-state-default ui-corner-all"
						onclick="DASHBOARD.submitOpdEntry();" />
					<input type="submit"
						class="ui-button ui-widget ui-state-default ui-corner-all"
						value="Back" onclick="DASHBOARD.backToQueue('${queueId}');" />
				</c:if></td>
		</tr>
	 -->
					<c:choose>
                   <c:when test="${ not empty opdPatientQueue }">
					<tr>
					<%-- <td><input type="button" value="View Current Vital Statistics"
									class="ui-button ui-widget ui-state-default ui-corner-all"
									onclick="DASHBOARD.currentVitalStatistics('${ opdPatientQueue.triageDataId.id}');" />
									</td> --%>
					</tr>
					</c:when>
					</c:choose>
					
						<tr>
						<td colspan="3"><div id="histry"><strong>HISTORY OF PRESENT ILLNESS</strong></div>
							</td>
					</tr>
	            
					<tr> 
					
						<td colspan="3"><div id="abc"><strong>
				History of Present Illness</strong><TEXTAREA  id="history" name="history" size="200" style="width: 1000px; height: 50px" 
										rows=1 cols=15 class="ui-autocomplete-input ui-widget-content ui-corner-all ac_input"></TEXTAREA></div>
							
								
						</td>
						
					</tr>
					
					<tr>
						<td colspan="3"><div id="syptom"><strong>SYMPTOM</strong></div>
							</td>
					</tr>
					
					<tr>
						<td colspan="5"><div id="xyz"><strong>Symptom:</strong><em>*</em>
							<input
							class="ui-autocomplete-input ui-widget-content ui-corner-all"
							id="symptom" title="${opd.conceptId}" style="width: 460px"
							name="symptom" /></div></td>
					</tr>
				
					<tr>
						
						<td>
							<!-- List of all available DataElements -->
							<div id="divAvailableSymptomList">
								<select size="4" style="width: 550px"
									id="availableSymptomList" name="availableSymptomList"
									multiple="multiple" style="min-width:25em;height:10em"
									ondblclick="moveSelectedById( 'availableSymptomList', 'selectedSymptomList');getQuestion();">
									<c:forEach items="${symptomList}" var="symptom">
										<option value="${symptom.id}">${symptom.name}</option>
									</c:forEach>
								</select>
							</div></td>
						<td><div id="symp"><input type="button" value="&gt;"
							class="ui-button ui-widget ui-state-default ui-corner-all"
							style="width: 50px"
							onclick="moveSelectedById( 'availableSymptomList', 'selectedSymptomList');getQuestion();" /><br />
							<input type="button" value="&lt;"
							class="ui-button ui-widget ui-state-default ui-corner-all"
							style="width: 50px"
							onclick="moveSelectedById( 'selectedSymptomList', 'availableSymptomList');removeSymptom()" />
						</div></td>
						<td>
							<!-- List of all selected DataElements --> <select
							id="selectedSymptomList" size="4" style="width: 550px"
							name="selectedSymptomList" multiple="multiple"
							style="min-width:25em;height:10em"
							ondblclick="moveSelectedById( 'selectedSymptomList', 'availableSymptomList' );removeSymptom();">
						</select></td>
						<td>
						<input type="button" id="but"
									class="ui-button ui-widget ui-state-default ui-corner-all"
									value="View Question" onclick="viewQuestion();"/>
							</td>
							
					</tr>
					
					<!--Examination-->
					<tr>
						<td colspan="3"><div id="exmntion"><strong>PHYSICAL EXAMINATION</strong></div>
							</td>
					</tr>
					<tr>
						<td colspan="3"><div id="ex"><strong>Physical Examination:</strong><em>*</em>
							<input
							class="ui-autocomplete-input ui-widget-content ui-corner-all"
							id="examination" title="${opd.conceptId}" style="width: 460px"
							name="examination" /></div></td>
					</tr>
					<tr>
						<td>
							<!-- List of all available DataElements -->
							<div id="divAvailableExaminationList">
								<select size="4" style="width: 550px"
									id="availableExaminationList" name="availableExaminationList"
									multiple="multiple" style="min-width:25em;height:10em"
									ondblclick="moveSelectedById( 'availableExaminationList', 'selectedExaminationList');getQuest();">
									<c:forEach items="${examinationList}" var="examination">
										<option value="${examination.id}">${examination.name}</option>
									</c:forEach>
								</select>
							</div></td>
						<td><div id="exm"><input type="button" value="&gt;"
							class="ui-button ui-widget ui-state-default ui-corner-all"
							style="width: 50px"
							onclick="moveSelectedById( 'availableExaminationList', 'selectedExaminationList');getQuest();" /><br />
							<input type="button" value="&lt;"
							class="ui-button ui-widget ui-state-default ui-corner-all"
							style="width: 50px"
							onclick="moveSelectedById( 'selectedExaminationList', 'availableExaminationList');removeExamination()" />
						</div></td>
						<td>
							<!-- List of all selected DataElements --> <select
							id="selectedExaminationList" size="4" style="width: 550px"
							name="selectedExaminationList" multiple="multiple"
							style="min-width:25em;height:10em"
							ondblclick="moveSelectedById( 'selectedExaminationList', 'availableExaminationList' );removeExamination();">
						</select></td>
						<td>
						<input type="button" id="buttns"
									class="ui-button ui-widget ui-state-default ui-corner-all"
									value="View Question" onclick="viewQuest();"/>
							</td>
					</tr>
					<!-- Signs -->
					<tr>
						<td colspan="3"><div id="sins"><strong>SIGNS</strong></div>
							</td>
					</tr>
					<tr>
					   
							<td colspan="10"><div id="sgn"><strong>Signs:</strong><em>*</em>
							<input
							class="ui-autocomplete-input ui-widget-content ui-corner-all"
							id="signs" title="${opd.conceptId}" style="width: 390px"
							name="signs" /></div></td>
					</tr>
					<tr>
					
						<td>
							<!-- List of all available DataElements -->
							
							<div id="divAvailableSignsList">
								<select size="4" style="width: 550px"
									id="availableSignsList" name="availableSignsList"
									multiple="multiple" style="min-width:25em;height:10em"
									ondblclick="moveSelectedById( 'availableSignsList', 'selectedSignsList');">
									<c:forEach items="${signsList}" var="si">
										<option value="${si.id}">${si.name}</option>
									</c:forEach>
								</select>
							</div></td>
						<td><div id="sn"><input type="button" value="&gt;"
							class="ui-button ui-widget ui-state-default ui-corner-all"
							style="width: 50px"
							onclick="moveSelectedById( 'availableSignsList', 'selectedSignsList');" /><br />
							<input type="button" value="&lt;"
							class="ui-button ui-widget ui-state-default ui-corner-all"
							style="width: 50px"
							onclick="moveSelectedById( 'selectedSignsList', 'availableSignsList');" />
						</div></td>
						<td>
							<!-- List of all selected DataElements --> <select
							id="selectedSignsList" size="4" style="width: 550px"
							name="selectedSignsList" multiple="multiple"
							style="min-width:25em;height:10em"
							ondblclick="moveSelectedById( 'selectedSignsList', 'availableSignsList' );">
						</select></td>
						
					</tr>
					
					<!--Provisional Diagnosis-->
					<tr>
					    <td colspan="3"><div id="dig">
							<strong>PROVISIONAL DIAGNOSIS</strong></div>
						</td>
					</tr>
					<tr>
					     <td colspan="3"><div id="diag">
							<input type="radio" name="radio_dia" value="prov_dia" id="prov_dia"
								 	onclick="loadSelectedDiagnosisList();"/><strong>Provisional</strong>
							<input type="radio" name="radio_dia" value="final_dia" id="final_dia"
									onclick="removeSelectedDia();"/><strong>Final</strong>&nbsp;&nbsp;
							<strong>Diagnosis:</strong><em>*</em>
							<input
							class="ui-autocomplete-input ui-widget-content ui-corner-all"
							id="diagnosis" title="${opd.conceptId}" style="width: 390px"
							name="diagnosis" /></div> </td>
					</tr>
					<tr>
						<td>
							<!-- List of all available DataElements -->
							<div id="divAvailableDiagnosisList">
								<select size="4" style="width: 550px"
									id="availableDiagnosisList" name="availableDiagnosisList"
									multiple="multiple" style="min-width:25em;height:10em"
									ondblclick="moveSelectedById( 'availableDiagnosisList', 'selectedDiagnosisList');">
									<c:forEach items="${diagnosisList}" var="diagnosis">
										<option value="${diagnosis.id}">${diagnosis.name}</option>
									</c:forEach>
								</select>
							</div></td>
						<td><div id="dgn"><input type="button" value="&gt;"
							class="ui-button ui-widget ui-state-default ui-corner-all"
							style="width: 50px"
							onclick="moveSelectedById( 'availableDiagnosisList', 'selectedDiagnosisList');" /><br />
							<input type="button" value="&lt;"
							class="ui-button ui-widget ui-state-default ui-corner-all"
							style="width: 50px"
							onclick="moveSelectedById( 'selectedDiagnosisList', 'availableDiagnosisList');" />
							<!-- 
				<input type="button" value="&gt;&gt;"
				class="ui-button ui-widget ui-state-default ui-corner-all"
				style="width: 50px"
				onclick="moveAllById( 'availableDiagnosisList', 'selectedDiagnosisList' );" /><br />
				<input type="button" value="&lt;&lt;"
				class="ui-button ui-widget ui-state-default ui-corner-all"
				style="width: 50px"
				onclick="moveAllById( 'selectedDiagnosisList', 'availableDiagnosisList' );" />
				 -->
						</div></td>
						<td>
							<!-- List of all selected DataElements --> <select
							id="selectedDiagnosisList" size="4" style="width: 550px"
							name="selectedDiagnosisList" multiple="multiple"
							style="min-width:25em;height:10em"
							ondblclick="moveSelectedById( 'selectedDiagnosisList', 'availableDiagnosisList' );">
						</select></td>
					</tr>
					
					<!-- Differential Diagnosis -->
					<tr>
					    <td colspan="3"><div id="difrntial">
							<strong>DIFFERENTIAL DIAGNOSIS</strong></div>
						</td>
					</tr>
						<tr>
					   
							<td colspan="3"><div id="diff"><strong>Differential Diagnosis:</strong><em>*</em>
							<input
							class="ui-autocomplete-input ui-widget-content ui-corner-all"
							id="differentialdiagnosis" title="${opd.conceptId}" style="width: 390px"
							name="differentialdiagnosis" /></div></td>
					</tr>
					<tr>
						<td>
							<!-- List of all available DataElements -->
							<div id="divAvailableDifferentialDiagnosisList">
								<select size="4" style="width: 550px"
									id="availableDifferentialDiagnosisList" name="availableDifferentialDiagnosisList"
									multiple="multiple" style="min-width:25em;height:10em"
									ondblclick="moveSelectedById( 'availableDifferentialDiagnosisList', 'selectedDifferentialList');">
									<c:forEach items="${differentialList}" var="differential">
										<option value="${differential.id}">${differential.name}</option>
									</c:forEach>
								</select>
							</div></td>
						<td><div id="dfnbut"><input type="button" value="&gt;"
							class="ui-button ui-widget ui-state-default ui-corner-all"
							style="width: 50px"
							onclick="moveSelectedById( 'availableDifferentialDiagnosisList', 'selectedDifferentialList');" /><br />
							<input type="button" value="&lt;"
							class="ui-button ui-widget ui-state-default ui-corner-all"
							style="width: 50px"
							onclick="moveSelectedById( 'selectedDifferentialList', 'availableDifferentialDiagnosisList');" />
						</div></td>
						<td>
							<!-- List of all selected DataElements --> <select
							id="selectedDifferentialList" size="4" style="width: 550px"
							name="selectedDifferentialList" multiple="multiple"
							style="min-width:25em;height:10em"
							ondblclick="moveSelectedById( 'selectedDifferentialList', 'availableDifferentialDiagnosisList' );">
						</select></td>
					</tr>
					
							<!--Working Diagnosis -->
							
							<tr>
					    <td colspan="3"><div id="wrking">
							<strong>WORKING DIAGNOSIS</strong></div>
						</td>
					</tr>
						<tr>
					   
							<td colspan="3"><div id="wrknd"><strong>Working Diagnosis:</strong><em>*</em>
							<input
							class="ui-autocomplete-input ui-widget-content ui-corner-all"
							id="workingdiagnosis" title="${opd.conceptId}" style="width: 390px"
							name="workingdiagnosis" /></div></td>
					</tr>
					<tr>
						<td>
							<!-- List of all available DataElements -->
							<div id="divAvailableWorkingDiagnosisList">
								<select size="4" style="width: 550px"
									id="availableWorkingDiagnosisList" name="availableWorkingDiagnosisList"
									multiple="multiple" style="min-width:25em;height:10em"
									ondblclick="moveSelectedById( 'availableWorkingDiagnosisList', 'selectedWorkingList');">
									<c:forEach items="${workingList}" var="working">
										<option value="${working.id}">${working.name}</option>
									</c:forEach>
								</select>
							</div></td>
						<td><div id="wrkngdig"><input type="button" value="&gt;"
							class="ui-button ui-widget ui-state-default ui-corner-all"
							style="width: 50px"
							onclick="moveSelectedById( 'availableWorkingDiagnosisList', 'selectedWorkingList');" /><br />
							<input type="button" value="&lt;"
							class="ui-button ui-widget ui-state-default ui-corner-all"
							style="width: 50px"
							onclick="moveSelectedById( 'selectedWorkingList', 'availableWorkingDiagnosisList');" />
						</div></td>
						<td>
							<!-- List of all selected DataElements --> <select
							id="selectedWorkingList" size="4" style="width: 550px"
							name="selectedWorkingList" multiple="multiple"
							style="min-width:25em;height:10em"
							ondblclick="moveSelectedById( 'selectedWorkingList', 'availableWorkingDiagnosisList' );">
						</select></td>
					</tr>
					<!-- Underlying Condition -->
					<tr>
					    <td colspan="3"><div id="underlned">
							<strong>UNDERLINED CONDITION</strong></div>
						</td>
					<tr>
					   
							<td colspan="3"><div id="undr"><strong>Underlined Condition:</strong><em>*</em>
							<input
							class="ui-autocomplete-input ui-widget-content ui-corner-all"
							id="underlinedcondition" title="${opd.conceptId}" style="width: 390px"
							name="underlinedcondition" /></div></td>
					</tr>
					<tr>
						<td>
							<!-- List of all available DataElements -->
							<div id="divAvailableUnderLinedConditionList">
								<select size="4" style="width: 550px"
									id="availableUnderLinedConditionList" name="availableUnderLinedConditionList"
									multiple="multiple" style="min-width:25em;height:10em"
									ondblclick="moveSelectedById( 'availableUnderLinedConditionList', 'selectedUnderLinedList');">
									<c:forEach items="${underLinedList}" var="underlinecondition">
										<option value="${underlinecondition.id}">${underlinecondition.name}</option>
									</c:forEach>
								</select>
							</div></td>
						<td><div id="under"><input type="button" value="&gt;"
							class="ui-button ui-widget ui-state-default ui-corner-all"
							style="width: 50px"
							onclick="moveSelectedById( 'availableUnderLinedConditionList', 'selectedUnderLinedList');" /><br />
							<input type="button" value="&lt;"
							class="ui-button ui-widget ui-state-default ui-corner-all"
							style="width: 50px"
							onclick="moveSelectedById( 'selectedUnderLinedList', 'availableUnderLinedConditionList');" />
						</div></td>
						<td>
							<!-- List of all selected DataElements --> <select
							id="selectedUnderLinedList" size="4" style="width: 550px"
							name="selectedUnderLinedList" multiple="multiple"
							style="min-width:25em;height:10em"
							ondblclick="moveSelectedById( 'selectedUnderLinedList', 'availableUnderLinedConditionList' );">
						</select></td>
					</tr>
					
					
				</table>
				<table cellspacing="2">

					<!-- ghanshyam 1-june-2013 New Requirement #1633 User must be able to send investigation orders from dashboard to billing -->
					<tr>
					    <td colspan="3"><div id="investgtion">
							<strong>INVESTIGATION</strong></div>
						</td>
					<tr>
					<tr>
						<td colspan="3">
							<div class="ui-widget" id="invest">
								<strong>Investigation:</strong> <input
									class="ui-autocomplete-input ui-widget-content ui-corner-all"
									title="${opd.conceptId}" id="investigation"
									style="width: 450px" name="investigation" />
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<!-- List of all available Tests -->
							<div id="divAvailableInvestigationList">
								<select size="4" style="width: 550px"
									id="availableInvestigationList"
									name="availableInvestigationList" multiple="multiple"
									style="min-width:25em;height:5em"
									ondblclick="moveSelectedById( 'availableInvestigationList', 'selectedInvestigationList');">
									<c:forEach items="${listInvestigations}" var="investigation">
										<option value="${investigation.conceptId}">${investigation.name}</option>
									</c:forEach>
								</select>
							</div>
						</td>
						<td><div id="investing"><input type="button"
							class="ui-button ui-widget ui-state-default ui-corner-all"
							value="&gt;" style="width: 50px"
							onclick="moveSelectedById( 'availableInvestigationList', 'selectedInvestigationList');" /><br />
							<input type="button"
							class="ui-button ui-widget ui-state-default ui-corner-all"
							value="&lt;" style="width: 50px"
							onclick="moveSelectedById( 'selectedInvestigationList', 'availableInvestigationList');" />
							<!--  
				<input type="button"
				class="ui-button ui-widget ui-state-default ui-corner-all"
				value="&gt;&gt;" style="width: 50px"
				onclick="moveAllById( 'availableInvestigationList', 'selectedInvestigationList' );" /><br />
				<input type="button"
				class="ui-button ui-widget ui-state-default ui-corner-all"
				value="&lt;&lt;" style="width: 50px"
				onclick="moveAllById( 'selectedInvestigationList', 'availableInvestigationList' );" />
				-->      </div>
						</td>
						<td>
							<!-- List of all selected DataElements --> <select size="4"
							style="width: 550px" id="selectedInvestigationList"
							name="selectedInvestigationList" multiple="multiple"
							style="min-width:25em;height:5em"
							ondblclick="moveSelectedById( 'selectedInvestigationList', 'availableInvestigationList' )">
						</select>
						</td>
					</tr>
					</table>
					<table cellspacing="2">
					<tr><td><div id="treatment"><strong>TREATMENT</strong></div></td></tr>
					<tr>
					    <td colspan="3"><div id="procedre">
							<strong>PROCEDURE</strong></div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div class="ui-widget" id="pop">
								<strong>Post for Procedure:</strong> <input
									class="ui-autocomplete-input ui-widget-content ui-corner-all"
									title="${opd.conceptId }" id="procedure" style="width: 420px"
									name="procedure" />
							</div></td>
					</tr>
					<tr>
						<td>
						
							<!-- List of all available DataElements -->
							<div id="divAvailableProcedureList">
								<select size="4" style="width: 550px"
									id="availableProcedureList" name="availableProcedureList"
									multiple="multiple" style="min-width:25em;height:5em"
									ondblclick="moveSelectedById( 'availableProcedureList', 'selectedProcedureList');">
									<c:forEach items="${listProcedures}" var="procedure">
										<option value="${procedure.conceptId}">${procedure.name}</option>
									</c:forEach>
								</select>
							</div></td>
						<td><div id="pp"><input type="button" 
							class="ui-button ui-widget ui-state-default ui-corner-all"
							value="&gt;" style="width: 50px"
							onclick="moveSelectedById( 'availableProcedureList', 'selectedProcedureList');" /><br />
							<input type="button"
							class="ui-button ui-widget ui-state-default ui-corner-all"
							value="&lt;" style="width: 50px"
							onclick="moveSelectedById( 'selectedProcedureList', 'availableProcedureList');" />
							<!--  
				<input type="button"
				class="ui-button ui-widget ui-state-default ui-corner-all"
				value="&gt;&gt;" style="width: 50px"
				onclick="moveAllById( 'availableProcedureList', 'selectedProcedureList' );" /><br />
				<input type="button"
				class="ui-button ui-widget ui-state-default ui-corner-all"
				value="&lt;&lt;" style="width: 50px"
				onclick="moveAllById( 'selectedProcedureList', 'availableProcedureList' );" />
				-->
						</div></td>
						<td>
							<!-- List of all selected DataElements --> <select size="4"
							style="width: 550px" id="selectedProcedureList"
							name="selectedProcedureList" multiple="multiple"
							style="min-width:25em;height:5em"
							ondblclick="moveSelectedById( 'selectedProcedureList', 'availableProcedureList' );">
						</select></td>
						<td>
						<input type="button" id="btns"
									class="ui-button ui-widget ui-state-default ui-corner-all"
									value="Schedule" onclick="showSchedule();" />
							</td>
					</tr> 
					
					
					
					
					
					
					
					<!-- ghanshyam 12-june-2013 New Requirement #1635 User should be able to send pharmacy orders to issue drugs to a patient from dashboard -->
					<tr>
					    <td colspan="3"><div id="drgs">
							<strong>DRUGS</strong></div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div class="ui-widget" id="drug">
								<strong>Drug:</strong>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="1"><div id="dd">
							<div class="drug-order" id="drugOrder"
								style="background: #FFFFFF; border: 1px #808080 solid; padding: 0.3em; margin: 0.3em 0em; min-width: 25em; height: 6em;">
								<table>
								<tr>
								<td>
								<div class="drugs" class="ui-widget">
									<input title="${opd.conceptId}" id="drugName" name="drugName"
										placeholder="Search for drugs" onblur="ISSUE.onBlur(this);" />
								</div>
								<div class="formulation" id="divFormulation">
									<select id="formulation" name="formulation">
										<option value="">
											<spring:message code="patientdashboard.SelectFormulation" />
										</option>
									</select>
								</div>
								<div class="frequency">
									<select id="frequency" name="frequency">
										<option value="">Select Frequency</option>
										<c:forEach items="${drugFrequencyList}" var="dfl">
											<option value="${dfl.name}.${dfl.conceptId}">${dfl.name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="no-of-days">
									<input type="text" id="noOfDays" name="noOfDays"
										placeholder="No Of Days" size="7">
								</div>
								</td>
								</tr>
								<tr>
								<td>
								<div class="comments">
									<input id="comments"  type="text" name="comments" placeholder="Comments"
										 >
								</div>
								</td>
								</tr>
								</table>
							</div>
							</div>
						</td>

						<td><div class="add" id="add">
								<input type="button"
									class="ui-button ui-widget ui-state-default ui-corner-all"
									value="Add" onClick="addDrugOrder();" />
							</div></td>

						<td>
							<div id="headerValue"
								style="background: #FFFFFF; border: 1px #808080 solid; padding: 0.3em; margin: 0.3em 0em; width: 100%;">
								<input type='text' id="drug" name="drug" value='Drugs' size="14"
									readonly="readonly" />&nbsp; <input type='text'
									id="formulation" name='formulation' value="Formulation"
									size="14" readonly="readonly" />&nbsp; <input type='text'
									id='frequency' name='frequency' value='Frequency' size="6"
									readonly="readonly" />&nbsp; <input type='text' id='noOfDays'
									name='noOfDays' value='No Of Days' size="7" readonly="readonly" />&nbsp;
								<input type='text' id='comments' name='comments'
									value='Comments' size="17" readonly="readonly" />&nbsp;
							</div>
						</td>
					</tr>
					<!-- ghanshyam 8-july-2013 New Requirement #1963 Redesign patient dashboard -->
					<tr>
					    <td colspan="3"><div id="othrins">
							<strong>OTHER INSTRUCTIONS</strong></div>
						</td>
					</tr>
					<tr>
						<td colspan="3"><div id="other"><strong>Other Instructions:</strong> <input
							type="text" id="note" name="note" size="200"
							style="width: 1035px; height: 50px"
							class="ui-autocomplete-input ui-widget-content ui-corner-all ac_input" /></div>
						</td>
					</tr>
					</table>
					<table cellspacing="2">
					<tr>
					    <td colspan="3"><div id="intrnal">
							<strong>INTERNAL REFERRAL</strong></div>
						</td>
					</tr>
					<tr>
						<td colspan="3"><div id="interref">Internal Referral: <select
							id="internalReferral" name="internalReferral">
								<option value="">--Select--</option>
								<c:forEach items="${listInternalReferral}"var="internalReferral">
									<option value="${internalReferral.answerConcept.name}">${internalReferral.answerConcept.name}</option>
								</c:forEach>
						</select></div>
						</td>
						</tr>
						<tr>
					    <td colspan="3"><div id="extrnal">
							<strong>EXTERNAL REFERRAL</strong></div>
						</td>
					</tr>
						<tr>
						<td colspan="3"><div id="externalref"> External Referral:
						<select id="externalReferral"
							name="externalReferral">
								<option value="">--Select--</option>
								<c:forEach items="${listExternalReferral}"
									var="externalReferral">
									<option value="${externalReferral.answerConcept.name}">${externalReferral.answerConcept.name}</option>
								</c:forEach>
						</select></div></td>
					</tr>
					<tr>
					    <td colspan="3"><div id="outcum">
							<strong>OUTCOME</strong></div>
						</td>
					</tr>
					<tr>
						<td colspan="3"><div id="outcome"><strong>OPD Visit Outcome:</strong><em>*</em></div>
						</td>
					</tr>
					<tr>
					
						<td colspan="2">
								<div id="abcd">
								<input type="radio" name="radio_f" value="Died" id="died"
									onclick="DASHBOARD.onChangeRadio(this);radio_fSelected();">Died
									&nbsp;&nbsp;
								<c:if test="${empty admitted}">
								<input type="radio" name="radio_f" id="input_follow"
									value="Follow-up" onclick="DASHBOARD.onChangeRadio(this); removePrompt(); ">Follow Up 
								<input	type="text" class="date-pick left" readonly="readonly"
									ondblclick="this.value='';" name="dateFollowUp"
									id="dateFollowUp" onclick="DASHBOARD.onClickFollowDate(this); " onchange=" radio_fSelected();">
									&nbsp;&nbsp;
								<input type="radio" name="radio_f" value="Cured" id="cured"
									onclick="DASHBOARD.onChangeRadio(this);radio_fSelected();">Cured
   									&nbsp;&nbsp;
   								</c:if>
   								<input type="radio" name="radio_f" value="Reviewed" id="reviewed"
									onclick="DASHBOARD.onChangeRadio(this);radio_fSelected();">Reviewed
									&nbsp;&nbsp;
								<c:if test="${empty admitted}">
								<input type="radio" name="radio_f" value="Admit" id="admit"
									onclick="DASHBOARD.onChangeRadio(this); removePrompt();">Admit
   								</c:if>
   								</div>
   						</td>
						<td align="left" class="tdIpdWard" style='display: none;'><select
							id="ipdWard" name="ipdWard" onChange="radio_fSelected();">
								<option value="">--Select--</option>
								<c:if test="${not empty listIpd }">
									<c:forEach items="${listIpd}" var="ipd">
										<option value="${ipd.answerConcept.id}">${ipd.answerConcept.name}</option>
									</c:forEach>
								</c:if>
						</select></td>
					</tr>
					<tr>
						<td colspan="3"><c:if test="${not empty queueId}">
						<table>
								<tr>
								<td>
								<input type="submit" value="Conclude Visit"
									class="ui-button ui-widget ui-state-default ui-corner-all"
									onclick="DASHBOARD.submitOpdEntry(); javascript:return validateTriage();" />
									<!--
									onclick="DASHBOARD.submitOpdEntry();print();" />
									-->
									</td>
								<%-- <td>
								<input type="submit"
									class="ui-button ui-widget ui-state-default ui-corner-all"
									value="Back" onclick="DASHBOARD.backToQueue('${queueId}');" />
									</td> --%>
								<td>
								<label id="lblPrompt" style="color: #FF0000;" ><b>Please click on 'CONCLUDE VISIT' to save the patient's details</b></label>
									</td>
								</tr>
								</table>
							</c:if>
							<c:if test="${not empty opdLogId}">
							<table>
								<tr>
								<td>
								<input type="submit" value="Conclude Visit"
									class="ui-button ui-widget ui-state-default ui-corner-all"
									onclick="DASHBOARD.submitOpdEntry();" />
									<!--
									onclick="DASHBOARD.submitOpdEntry();print();" />
									-->
									</td>
								<td>
								<input type="submit"
									class="ui-button ui-widget ui-state-default ui-corner-all"
									value="Back" onclick="DASHBOARD.backToOpdQueue('${opdLogId}');" />
									</td>
								<td>
								<label id="lblPrompt" style="color: #FF0000;" ><b>Please click on 'CONCLUDE VISIT' to save the patient's details</b></label>
								</td>
								</tr>
								</table>
							</c:if></td>
					</tr>
				</table>
			</tr>
		 <!--  end of floatLeft -->

	
		</div>
		<div id="triageDiv" class="floatRight">
		<label><b> VITALS STATISTICS</b></label></div>
		
		<div id="current" class="floatRight">
		<label><b class="boxHeader">Current Vitals Details</b></label>
		<table>
					<tr>
						<td><br></td>
					</tr>
					
					<c:choose>
					<c:when test="${opdPatientQueue.triageDataId==null}">
					<tr>
						<td>Weight (Kg)</td>
						<td><input type="text" id="weight" name="weight" size="11"
							value="${opdPatientQueue.triageDataId.weight}" >
						</td>
					</tr>
					<tr>
						<td>Height (cm)</td>
						<td><input type="text" id="height" name="height" size="11" 
							value="${opdPatientQueue.triageDataId.height}" oninput="calculateBmi()">
						</td>
				    </tr>
					<tr>
						<td>BMI</td>
				       <td><input type="text" id="BMI"  size="8"  maxlength="7"></td>
					</tr>
					</c:when>
				<c:when test="${opdPatientQueue.triageDataId!=null && opdPatientQueue.triageDataId.height==null && opdPatientQueue.triageDataId.weight==null}">
					<tr>
						<td>Weight (Kg)</td>
						<td><input type="text" id="weight" name="weight" size="11"
							value="${opdPatientQueue.triageDataId.weight}" >
						</td>
					</tr>
					<tr>
						<td>Height (cm)</td>
						<td><input type="text" id="height" name="height" size="11" 
							value="${opdPatientQueue.triageDataId.height}" oninput="calculateBmi()">
						</td>
				    </tr>
					<tr>
					<td>BMI</td>
				<td><input type="text" id="BMI"  size="8"  maxlength="7"  ></td>
				</tr>
				</c:when>
				<c:otherwise>
				<tr>
						<td>Weight (Kg)</td>
						<td><input type="text" id="weight" name="weight" size="11"
							value="${opdPatientQueue.triageDataId.weight}" >
						</td>
					</tr>
					<tr>
						<td>Height (cm)</td>
						<td><input type="text" id="height" name="height" size="11" 
							value="${opdPatientQueue.triageDataId.height}" oninput="calculateBmi()">
						</td>
				    </tr>
					<tr>
					<td>BMI</td>
				<td><input type="text" id="BMI"  size="8"  maxlength="7"   value="${opdPatientQueue.triageDataId.BMI}" ></td>
				</tr>
				</c:otherwise>
				
					</c:choose>
				
			
			
					<tr>
						<td>MUA Circumference(cm)</td>
						<td><input type="text" id="mua" name="mua" size=11"
								value="${opdPatientQueue.triageDataId.mua}" >
						</td>
					</tr>
					<tr>
						<td>Chest Circumference(cm)</td>
						<td><input type="text" id="chest" name="chest" size="11"
								value="${opdPatientQueue.triageDataId.chest}" ></td>
					</tr>
					<tr>
						<td>Abdominal Circumference(cm)</td>
						<td><input type="text" id="abdominal" name="abdominal" size="11"
								value="${opdPatientQueue.triageDataId.abdominal}" ></td>
					</tr>
					<tr>
						<td>Temperature (degree C)</td>
						<td><input type="text" id="temperature" name="temperature"
							size="11" value="${opdPatientQueue.triageDataId.temperature}" >
						</td>
					</tr>
					<tr>
						<td>Systolic B.P</td>
						<td><input type="text" id="systolic" name="systolic" size="11"
							value="${opdPatientQueue.triageDataId.systolic}" ></td>
					</tr>
					<tr>
						<td>Diastolic B.P</td>
						<td><input type="text" id="daistolic" name="daistolic" size="11"
							value="${opdPatientQueue.triageDataId.daistolic}" ></td>
					</tr>
					<tr>
						<td>Respiratory Rate</td>
						<td><input type="text" id="respiratoryRate" name="respiratoryRate" size="11"
							value="${opdPatientQueue.triageDataId.respiratoryRate}" >
						</td>
					</tr>
					<tr>
						<td>Pulse Rate</td>
						<td><input type="text" id="pulsRate" name="pulsRate"
							size="11" value="${opdPatientQueue.triageDataId.pulsRate}" >
						</td>
					</tr>
					<tr>
						<td>Blood Group</td>
						
						<td><select id="bloodGroup" name="bloodGroup" style="width: 100px" onclick="enableAndDisable();">
						<option value="">${opdPatientQueue.triageDataId.bloodGroup}</option>
						<option value="O">O</option>
						<option value="A">A</option>
						<option value="B">B</option>
						<option value="AB">AB</option>
						<option value="Not Known">Not Known</option>
						</select></td>
					</tr>
					<tr>
						<td>Rhesus Factor</td>
						<td><select id="rhesusFactor" name="rhesusFactor" style="width: 100px;">
						<option value="">${opdPatientQueue.triageDataId.rhesusFactor}</option>
						<option value="Positive (+)">Positive (+)</option>
						<option value="Negative (-)">Negative (-)</option>
						<option value="Not Known">Not Known</option>
						</select></td>
					</tr>
					<tr>
						<td>Last Menstrual Period</td>
						<td><input type="text" id="lastMenstrualPeriod"
							name="lastMenstrualPeriod" size="11"
							value="${da}" ><img id="calendarButton" 
							src="${pageContext.request.contextPath}/moduleResources/patientdashboard/calendar.gif"  />
						</td>
						
				
					</tr>
					<tr>
						<td>PITCT</td>
						<td><select id="pitct" name="pitct" style="width: 100px;">
						<option value="">${opdPatientQueue.triageDataId.pitct}</option>
						<option value="Reactive">Reactive</option>
						<option value="Non-Reactive">Non-Reactive</option>
						<option value="Not Known">Not Known</option>
				</select></td>
					</tr>
					
		</table>
		
		</div>
	</div>
<div id="questionDiv" style="visibility:hidden;">
<table id="tableQuestion">
</table>
</div>
<div id="questDiv" style="visibility:hidden;">
<table id="tableQuestion">
</table>
</div>
<div id="scheduleDiv" style="visibility:hidden;">
<table id="tableSchedule">
</table>
</div>
<div id="printOPDSlip" style="visibility:hidden;">
<table class="box">
<tr>
		<center>
			<b>${hospitalName}</b>
		</center>
	</tr>
<tr>
		<td><strong>Date/Time:</strong></td>
		<td>${currentDateTime}</td>
	</tr>
<tr>
		<td><strong>Name:</strong></td>
		<td>${patientName}</td>
	</tr>
<tr>
		<td><strong>Patient ID:</strong></td>
		<td>${patient.patientIdentifier.identifier}</td>
	</tr>
<tr>
		<td><strong>Age:</strong></td>
		<td>${age}</td>
	</tr>
<tr>
		<td><strong>Gender:</strong></td>
		<td><c:choose>
				<c:when test="${patient.gender eq 'M'}">
					Male
				</c:when>
				<c:otherwise>
					Female
				</c:otherwise>
			</c:choose></td>
	</tr>
<tr>
		<td><strong>Payment Category:</strong></td>
		<td>${selectedCategory}</td>
	</tr>
<%-- <tr>
		<td><strong>Waiver/ Exemption No:</strong></td>
		<td>${exemptionNumber}</td>
		<td>${nhifCardNumber}</td>
		<td>${waiverNumber}</td>
	</tr> --%>
<tr>
		<td><strong>Treating Doctor:</strong></td>
		<td>${user.personName}</td>
	</tr>
</table>
<table class="box">
<tr><td><strong>History of Present Illness:</strong></td><td><div id="printableHistoryOfPresentIllness"></div></td></tr>
<tr><td><strong>Symptom:</strong></td><td><div id="printableSymptom"></div></td></tr>
<tr><td><strong>Examination:</strong></td><td><div id="printableExamination"></div></td></tr>
<tr><td><strong>Signs:</strong></td><td><div id="printableSign"></div></td></tr>
<tr><td><strong>Provisional Diagnosis:</strong></td><td><div id="printableProvisionalDiagnosis"></div></td></tr>
<tr><td><strong>Differential Diagnosis:</strong></td><td><div id="printableDifferential"></div></td></tr>
<tr><td><strong>Working Diagnosis:</strong></td><td><div id="printableWorking"></div></td></tr>
<tr><td><strong>Underline Condition:</strong></td><td><div id="printableUnderLinedCondition"></div></td></tr>
<tr><td><strong>Procedure:</strong></td><td><div id="printablePostForProcedure"></div></td></tr>
<tr><td><strong>Investigation:</strong></td><td><div id="printableInvestigation"></div></td></tr>
</table>
<table class="box">
<tr align="center"><th>S.No</th><th>Drug</th><th>Formulation</th><th>Frequency</th><th>No of Days</th><th>Comments</th></tr>
<tr align="center"><td><div id="printableSlNo"></div></td><td><div id="printableDrug"></div></td><td><div id="printableFormulation"></div></td><td><div id="printableFrequency"></div></td>
<td><div id="printableNoOfDays"></div></td><td><div id="printableComments"></div></td></tr>
</table>
<table class="box">
<tr><td><strong>Other Instructions:</strong></td><td><div id="printableOtherInstructions"></div></td></tr>
<tr><td><strong>Internal Referral:</strong></td><td><div id="printableInternalReferral"></div></td></tr>
<tr><td><strong>External Referral:</strong></td><td><div id="printableExternalReferral"></div></td></tr>
<tr><td><strong>OPD Visit Outcome:</strong></td><td><div id="printableOPDVisitOutCome"></div></td></tr>
</table>
<table>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<tr>
		<p style="text-align: right;">Signature of the Treating Doctor</p>
	</tr>
</table>
</div>

</form>
