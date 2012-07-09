<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
  </head>
  <body>
    <div class="fieldcontain ${hasErrors(bean: personInstance, field: 'state', 'error')} required">
    <label for="state">
        <g:message code="person.state.label" default="State"/>
        <span class="required-indicator">*</span>
    </label>
    <g:if com.dynamic="${statesList}">
        <g:select id="state" name="state.id" from="${statesList}" optionKey="id" required=""
                  value="${personInstance?.state?.id}" class="many-to-one"/>
    </g:if>
    <g:else>
       No Existing Records Found  
    </g:else>
</div>
  </body>
</html>
