<%@ page import="com.example.schools.Applicant" %>



<div class="fieldcontain ${hasErrors(bean: applicantInstance, field: 'applications', 'error')} ">
	<label for="applications">
		<g:message code="applicant.applications.label" default="Applications" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${applicantInstance?.applications?}" var="a">
    <li><g:link controller="application" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="application" action="create" params="['applicant.id': applicantInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'application.label', default: 'Application')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: applicantInstance, field: 'firstname', 'error')} ">
	<label for="firstname">
		<g:message code="applicant.firstname.label" default="Firstname" />
		
	</label>
	<g:textField name="firstname" value="${applicantInstance?.firstname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicantInstance, field: 'lastname', 'error')} ">
	<label for="lastname">
		<g:message code="applicant.lastname.label" default="Lastname" />
		
	</label>
	<g:textField name="lastname" value="${applicantInstance?.lastname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicantInstance, field: 'parent', 'error')} required">
	<label for="parent">
		<g:message code="applicant.parent.label" default="Parent" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="parent" name="parent.id" from="${com.example.schools.Parent.list()}" optionKey="id" required="" value="${applicantInstance?.parent?.id}" class="many-to-one"/>
</div>

