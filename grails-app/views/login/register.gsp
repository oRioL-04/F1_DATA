<%--
  Created by IntelliJ IDEA.
  User: cesc
  Date: 8/4/25
  Time: 19:07
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Registro</title>
</head>
<body>
<h1>Formulario de Registro</h1>

<g:form controller="usuario" action="registrar" method="POST">
    <label>Usuario:</label>
    <g:textField name="username"/><br/>

    <label>Contraseña:</label>
    <g:passwordField name="password"/><br/>

    <g:submitButton name="register" value="Registrarse"/>
</g:form>
</body>
</html>
