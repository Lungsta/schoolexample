<%@ page import="com.example.schools.Application" %>



<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'applicant', 'error')} required">
	<label for="applicant">
		<g:message code="application.applicant.label" default="Applicant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="applicant" name="applicant.id" from="${com.example.schools.Applicant.list()}" optionKey="id" required="" value="${applicationInstance?.applicant?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'appliedDate', 'error')} required">
	<label for="appliedDate">
		<g:message code="application.appliedDate.label" default="Applied Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="appliedDate" precision="day"  value="${applicationInstance?.appliedDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'appliedLevel', 'error')} required">
	<label for="appliedLevel">
		<g:message code="application.appliedLevel.label" default="Applied Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="appliedLevel" name="appliedLevel.id" from="${com.example.schools.SchoolLevel.list()}" optionKey="id" required="" value="${applicationInstance?.appliedLevel?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'entries', 'error')} ">
	<label for="entries">
		<g:message code="application.entries.label" default="Entries" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${applicationInstance?.entries?}" var="e">
    <li><g:link controller="applicationEntry" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="applicationEntry" action="create" params="['application.id': applicationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'applicationEntry.label', default: 'ApplicationEntry')])}</g:link>
</li>
</ul>

</div>

