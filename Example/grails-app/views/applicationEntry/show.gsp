
<%@ page import="com.example.schools.ApplicationEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'applicationEntry.label', default: 'ApplicationEntry')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-applicationEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-applicationEntry" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list applicationEntry">
			
				<g:if test="${applicationEntryInstance?.application}">
				<li class="fieldcontain">
					<span id="application-label" class="property-label"><g:message code="applicationEntry.application.label" default="Application" /></span>
					
						<span class="property-value" aria-labelledby="application-label"><g:link controller="application" action="show" id="${applicationEntryInstance?.application?.id}">${applicationEntryInstance?.application?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationEntryInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="applicationEntry.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${applicationEntryInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationEntryInstance?.reason}">
				<li class="fieldcontain">
					<span id="reason-label" class="property-label"><g:message code="applicationEntry.reason.label" default="Reason" /></span>
					
						<span class="property-value" aria-labelledby="reason-label"><g:fieldValue bean="${applicationEntryInstance}" field="reason"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationEntryInstance?.school}">
				<li class="fieldcontain">
					<span id="school-label" class="property-label"><g:message code="applicationEntry.school.label" default="School" /></span>
					
						<span class="property-value" aria-labelledby="school-label"><g:link controller="school" action="show" id="${applicationEntryInstance?.school?.id}">${applicationEntryInstance?.school?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationEntryInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="applicationEntry.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${applicationEntryInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:applicationEntryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${applicationEntryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
