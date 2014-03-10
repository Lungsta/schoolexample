<%@ page import="com.example.schools.SchoolLevel" %>



<div class="fieldcontain ${hasErrors(bean: schoolLevelInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="schoolLevel.comments.label" default="Comments" />
		
	</label>
	<g:textField name="comments" value="${schoolLevelInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolLevelInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="schoolLevel.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="level" name="level.id" from="${com.example.schools.EducationLevel.list()}" optionKey="id" required="" value="${schoolLevelInstance?.level?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolLevelInstance, field: 'maxFemaleCount', 'error')} required">
	<label for="maxFemaleCount">
		<g:message code="schoolLevel.maxFemaleCount.label" default="Max Female Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maxFemaleCount" type="number" value="${schoolLevelInstance.maxFemaleCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolLevelInstance, field: 'maxMaleCount', 'error')} required">
	<label for="maxMaleCount">
		<g:message code="schoolLevel.maxMaleCount.label" default="Max Male Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maxMaleCount" type="number" value="${schoolLevelInstance.maxMaleCount}" required=""/>
</div>

