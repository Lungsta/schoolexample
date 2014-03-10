<%@ page import="com.example.schools.EducationLevel" %>



<div class="fieldcontain ${hasErrors(bean: educationLevelInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="educationLevel.comments.label" default="Comments" />
		
	</label>
	<g:textField name="comments" value="${educationLevelInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: educationLevelInstance, field: 'level', 'error')} ">
	<label for="level">
		<g:message code="educationLevel.level.label" default="Level" />
		
	</label>
	<g:textField name="level" value="${educationLevelInstance?.level}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: educationLevelInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="educationLevel.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${educationLevelInstance?.name}"/>
</div>

