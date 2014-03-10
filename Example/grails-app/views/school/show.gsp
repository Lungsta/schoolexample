
<%@ page import="com.example.schools.School" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'school.label', default: 'School')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-school" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-school" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list school">
			
				<g:if test="${schoolInstance?.appCloseDate}">
				<li class="fieldcontain">
					<span id="appCloseDate-label" class="property-label"><g:message code="school.appCloseDate.label" default="App Close Date" /></span>
					
						<span class="property-value" aria-labelledby="appCloseDate-label"><g:formatDate date="${schoolInstance?.appCloseDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolInstance?.appStartDate}">
				<li class="fieldcontain">
					<span id="appStartDate-label" class="property-label"><g:message code="school.appStartDate.label" default="App Start Date" /></span>
					
						<span class="property-value" aria-labelledby="appStartDate-label"><g:formatDate date="${schoolInstance?.appStartDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolInstance?.levels}">
				<li class="fieldcontain">
					<span id="levels-label" class="property-label"><g:message code="school.levels.label" default="Levels" /></span>
					
						<g:each in="${schoolInstance.levels}" var="l">
						<span class="property-value" aria-labelledby="levels-label"><g:link controller="schoolLevel" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${schoolInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="school.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${schoolInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:schoolInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${schoolInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
