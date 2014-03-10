
<%@ page import="com.example.schools.Parent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'parent.label', default: 'Parent')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-parent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-parent" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list parent">
			
				<g:if test="${parentInstance?.children}">
				<li class="fieldcontain">
					<span id="children-label" class="property-label"><g:message code="parent.children.label" default="Children" /></span>
					
						<g:each in="${parentInstance.children}" var="c">
						<span class="property-value" aria-labelledby="children-label"><g:link controller="applicant" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.firstname1}">
				<li class="fieldcontain">
					<span id="firstname1-label" class="property-label"><g:message code="parent.firstname1.label" default="Firstname1" /></span>
					
						<span class="property-value" aria-labelledby="firstname1-label"><g:fieldValue bean="${parentInstance}" field="firstname1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.lastname1}">
				<li class="fieldcontain">
					<span id="lastname1-label" class="property-label"><g:message code="parent.lastname1.label" default="Lastname1" /></span>
					
						<span class="property-value" aria-labelledby="lastname1-label"><g:fieldValue bean="${parentInstance}" field="lastname1"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:parentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${parentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
