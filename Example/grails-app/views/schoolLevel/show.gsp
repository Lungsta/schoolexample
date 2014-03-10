
<%@ page import="com.example.schools.SchoolLevel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'schoolLevel.label', default: 'SchoolLevel')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-schoolLevel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-schoolLevel" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list schoolLevel">
			
				<g:if test="${schoolLevelInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="schoolLevel.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${schoolLevelInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolLevelInstance?.level}">
				<li class="fieldcontain">
					<span id="level-label" class="property-label"><g:message code="schoolLevel.level.label" default="Level" /></span>
					
						<span class="property-value" aria-labelledby="level-label"><g:link controller="educationLevel" action="show" id="${schoolLevelInstance?.level?.id}">${schoolLevelInstance?.level?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolLevelInstance?.maxFemaleCount}">
				<li class="fieldcontain">
					<span id="maxFemaleCount-label" class="property-label"><g:message code="schoolLevel.maxFemaleCount.label" default="Max Female Count" /></span>
					
						<span class="property-value" aria-labelledby="maxFemaleCount-label"><g:fieldValue bean="${schoolLevelInstance}" field="maxFemaleCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolLevelInstance?.maxMaleCount}">
				<li class="fieldcontain">
					<span id="maxMaleCount-label" class="property-label"><g:message code="schoolLevel.maxMaleCount.label" default="Max Male Count" /></span>
					
						<span class="property-value" aria-labelledby="maxMaleCount-label"><g:fieldValue bean="${schoolLevelInstance}" field="maxMaleCount"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:schoolLevelInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${schoolLevelInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
