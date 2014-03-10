<%@ page import="com.example.schools.School" %>



<div class="fieldcontain ${hasErrors(bean: schoolInstance, field: 'appCloseDate', 'error')} required">
	<label for="appCloseDate">
		<g:message code="school.appCloseDate.label" default="App Close Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="appCloseDate" precision="day"  value="${schoolInstance?.appCloseDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: schoolInstance, field: 'appStartDate', 'error')} required">
	<label for="appStartDate">
		<g:message code="school.appStartDate.label" default="App Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="appStartDate" precision="day"  value="${schoolInstance?.appStartDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: schoolInstance, field: 'levels', 'error')} ">
	<label for="levels">
		<g:message code="school.levels.label" default="Levels" />
		
	</label>
	<g:select name="levels" from="${com.example.schools.SchoolLevel.list()}" multiple="multiple" optionKey="id" size="5" value="${schoolInstance?.levels*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="school.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${schoolInstance?.name}"/>
</div>

