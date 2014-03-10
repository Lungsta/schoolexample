
<%@ page import="com.example.schools.Application" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'application.label', default: 'Application')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-application" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-application" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list application">
			
				<g:if test="${applicationInstance?.applicant}">
				<li class="fieldcontain">
					<span id="applicant-label" class="property-label"><g:message code="application.applicant.label" default="Applicant" /></span>
					
						<span class="property-value" aria-labelledby="applicant-label"><g:link controller="applicant" action="show" id="${applicationInstance?.applicant?.id}">${applicationInstance?.applicant?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationInstance?.appliedDate}">
				<li class="fieldcontain">
					<span id="appliedDate-label" class="property-label"><g:message code="application.appliedDate.label" default="Applied Date" /></span>
					
						<span class="property-value" aria-labelledby="appliedDate-label"><g:formatDate date="${applicationInstance?.appliedDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationInstance?.appliedLevel}">
				<li class="fieldcontain">
					<span id="appliedLevel-label" class="property-label"><g:message code="application.appliedLevel.label" default="Applied Level" /></span>
					
						<span class="property-value" aria-labelledby="appliedLevel-label"><g:link controller="schoolLevel" action="show" id="${applicationInstance?.appliedLevel?.id}">${applicationInstance?.appliedLevel?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationInstance?.entries}">
				<li class="fieldcontain">
					<span id="entries-label" class="property-label"><g:message code="application.entries.label" default="Entries" /></span>
					
						<g:each in="${applicationInstance.entries}" var="e">
						<span class="property-value" aria-labelledby="entries-label"><g:link controller="applicationEntry" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:applicationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${applicationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
