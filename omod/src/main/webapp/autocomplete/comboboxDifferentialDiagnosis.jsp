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
<%@ include file="/WEB-INF/template/include.jsp" %>
<select size="15" id="availableDifferentialDiagnosisList" name="availableDifferentialDiagnosisList" multiple="multiple" style="min-width:25em;height:20em" ondblclick="moveSelectedById( 'availableDifferentialDiagnosisList', 'selectedDifferentialList')">
    <c:if test="${not empty  differentialdiagnosis}">
		<c:forEach items="${differentialdiagnosis}" var="dfn">
           <option value="${dfn.id}" >${dfn.name}</option>
       </c:forEach>
	</c:if>    
</select>