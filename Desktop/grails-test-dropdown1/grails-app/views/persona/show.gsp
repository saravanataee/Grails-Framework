
<%@ page import="test.Persona" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.nombre.label" default="Nombre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "nombre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.apellidoPaterno.label" default="Apellido Paterno" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "apellidoPaterno")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.apellidoMaterno.label" default="Apellido Materno" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "apellidoMaterno")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.estado.label" default="Estado" /></td>
                            
                            <td valign="top" class="value"><g:link controller="estado" action="show" id="${personaInstance?.estado?.id}">${personaInstance?.estado?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${personaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
