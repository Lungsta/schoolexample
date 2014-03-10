
<%@ page import="com.example.schools.ApplicationEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'applicationEntry.label', default: 'ApplicationEntry')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-applicationEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-applicationEntry" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="applicationEntry.application.label" default="Application" /></th>
					
						<g:sortableColumn property="comments" title="${message(code: 'applicationEntry.comments.label', default: 'Comments')}" />
					
						<g:sortableColumn property="reason" title="${message(code: 'applicationEntry.reason.label', default: 'Reason')}" />
					
						<th><g:message code="applicationEntry.school.label" default="School" /></th>
					
						<g:sortableColumn property="status" title="${message(code: 'applicationEntry.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${applicationEntryInstanceList}" status="i" var="applicationEntryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${applicationEntryInstance.id}">${fieldValue(bean: applicationEntryInstance, field: "application")}</g:link></td>
					
						<td>${fieldValue(bean: applicationEntryInstance, field: "comments")}</td>
					
						<td>${fieldValue(bean: applicationEntryInstance, field: "reason")}</td>
					
						<td>${fieldValue(bean: applicationEntryInstance, field: "school")}</td>
					
						<td>${fieldValue(bean: applicationEntryInstance, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${applicationEntryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
