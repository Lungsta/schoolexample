
<%@ page import="com.example.schools.School" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'school.label', default: 'School')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-school" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-school" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="appCloseDate" title="${message(code: 'school.appCloseDate.label', default: 'App Close Date')}" />
					
						<g:sortableColumn property="appStartDate" title="${message(code: 'school.appStartDate.label', default: 'App Start Date')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'school.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${schoolInstanceList}" status="i" var="schoolInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${schoolInstance.id}">${fieldValue(bean: schoolInstance, field: "appCloseDate")}</g:link></td>
					
						<td><g:formatDate date="${schoolInstance.appStartDate}" /></td>
					
						<td>${fieldValue(bean: schoolInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${schoolInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
