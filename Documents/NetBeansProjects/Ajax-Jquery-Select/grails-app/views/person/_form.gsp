<%@ page import="com.dynamic.Person" %>
<g:setProvider library="jquery"/>


<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="person.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${personInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'Firstname', 'error')} required">
	<label for="Firstname">
		<g:message code="person.Firstname.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="Firstname" required="" value="${personInstance?.Firstname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'Lastname', 'error')} required">
	<label for="Lastname">
		<g:message code="person.Lastname.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="Lastname" required="" value="${personInstance?.Lastname}"/>
</div>

<div class="fieldcontain">
    <label for="country">
        <g:message code="person.country.label" default="Country" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="country" name="country.id" from="${com.dynamic.Country.list()}" optionKey="id" required=""
              noSelection="['':'Select a Country']"
              onchange="${remoteFunction (
                      controller: 'state',
                      action: 'getStates',
                      params: '\'id=\' + this.value',
                      update: 'stateDiv'
              )}"
              value="${personInstance?.state?.country?.id}" class="many-to-one"/>
</div>

<div id="stateDiv">
    <g:if test="${personInstance.state}">
        <g:include controller="state" action="getStates" id="${personInstance.state.country.id}"/>
    </g:if>
</div>