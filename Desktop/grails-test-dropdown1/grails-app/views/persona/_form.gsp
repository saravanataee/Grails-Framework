<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page import="test.Persona" %>
<g:setProvider library="jquery"/>


<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="persona.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${personaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'apellidoPaterno', 'error')} required">
	<label for="apellidoPaterno">
		<g:message code="persona.apellidoPaterno.label" default="Apellido Paterno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidoPaterno" required="" value="${personaInstance?.apellidoPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'apellidoMaterno', 'error')} required">
	<label for="apellidoMaterno">
		<g:message code="persona.apellidoMaterno.label" default="Apellido Materno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidoMaterno" required="" value="${personaInstance?.apellidoMaterno}"/>
</div>

<div class="fieldcontain">
    <label for="pais">
        <g:message code="persona.pais.label" default="Pais" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="pais" name="pais.id" from="${test.Pais.list()}" optionKey="id" required=""
              noSelection="['':'Selecciona un país']"
              onchange="${remoteFunction (
                      controller: 'estado',
                      action: 'getEstados',
                      params: '\'id=\' + this.value',
                      update: 'estadoDiv'
              )}"
              value="${personaInstance?.estado?.pais?.id}" class="many-to-one"/>
</div>

<div id="estadoDiv">
    <g:if test="${personaInstance.estado}">
        <g:include controller="estado" action="getEstados" id="${personaInstance.estado.pais.id}"/>
    </g:if>
</div>
