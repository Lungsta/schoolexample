<%@ page import="com.example.schools.ApplicationEntry" %>



<div class="fieldcontain ${hasErrors(bean: applicationEntryInstance, field: 'application', 'error')} required">
	<label for="application">
		<g:message code="applicationEntry.application.label" default="Application" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="application" name="application.id" from="${com.example.schools.Application.list()}" optionKey="id" required="" value="${applicationEntryInstance?.application?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationEntryInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="applicationEntry.comments.label" default="Comments" />
		
	</label>
	<g:textField name="comments" value="${applicationEntryInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationEntryInstance, field: 'reason', 'error')} ">
	<label for="reason">
		<g:message code="applicationEntry.reason.label" default="Reason" />
		
	</label>
	<g:textField name="reason" value="${applicationEntryInstance?.reason}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationEntryInstance, field: 'school', 'error')} required">
	<label for="school">
		<g:message code="applicationEntry.school.label" default="School" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="school" name="school.id" from="${com.example.schools.School.list()}" optionKey="id" required="" value="${applicationEntryInstance?.school?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationEntryInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="applicationEntry.status.label" default="Status" />
		
	</label>
	<g:textField name="status" value="${applicationEntryInstance?.status}"/>
</div>

