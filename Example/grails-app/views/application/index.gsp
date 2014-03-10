
<%@ page import="com.example.schools.Application" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'application.label', default: 'Application')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-application" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-application" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="application.applicant.label" default="Applicant" /></th>
					
						<g:sortableColumn property="appliedDate" title="${message(code: 'application.appliedDate.label', default: 'Applied Date')}" />
					
						<th><g:message code="application.appliedLevel.label" default="Applied Level" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${applicationInstanceList}" status="i" var="applicationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${applicationInstance.id}">${fieldValue(bean: applicationInstance, field: "applicant")}</g:link></td>
					
						<td><g:formatDate date="${applicationInstance.appliedDate}" /></td>
					
						<td>${fieldValue(bean: applicationInstance, field: "appliedLevel")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${applicationInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
