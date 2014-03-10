
<%@ page import="com.example.schools.SchoolLevel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'schoolLevel.label', default: 'SchoolLevel')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-schoolLevel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-schoolLevel" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="comments" title="${message(code: 'schoolLevel.comments.label', default: 'Comments')}" />
					
						<th><g:message code="schoolLevel.level.label" default="Level" /></th>
					
						<g:sortableColumn property="maxFemaleCount" title="${message(code: 'schoolLevel.maxFemaleCount.label', default: 'Max Female Count')}" />
					
						<g:sortableColumn property="maxMaleCount" title="${message(code: 'schoolLevel.maxMaleCount.label', default: 'Max Male Count')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${schoolLevelInstanceList}" status="i" var="schoolLevelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${schoolLevelInstance.id}">${fieldValue(bean: schoolLevelInstance, field: "comments")}</g:link></td>
					
						<td>${fieldValue(bean: schoolLevelInstance, field: "level")}</td>
					
						<td>${fieldValue(bean: schoolLevelInstance, field: "maxFemaleCount")}</td>
					
						<td>${fieldValue(bean: schoolLevelInstance, field: "maxMaleCount")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${schoolLevelInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
