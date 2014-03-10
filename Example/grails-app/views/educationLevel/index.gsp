
<%@ page import="com.example.schools.EducationLevel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'educationLevel.label', default: 'EducationLevel')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-educationLevel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-educationLevel" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="comments" title="${message(code: 'educationLevel.comments.label', default: 'Comments')}" />
					
						<g:sortableColumn property="level" title="${message(code: 'educationLevel.level.label', default: 'Level')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'educationLevel.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${educationLevelInstanceList}" status="i" var="educationLevelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${educationLevelInstance.id}">${fieldValue(bean: educationLevelInstance, field: "comments")}</g:link></td>
					
						<td>${fieldValue(bean: educationLevelInstance, field: "level")}</td>
					
						<td>${fieldValue(bean: educationLevelInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${educationLevelInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
