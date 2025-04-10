<%--
  Created by IntelliJ IDEA.
  User: oriol
  Date: 9/4/25
  Time: 11:40
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Selecciona piloto y sesión</title>
    <meta name="layout" content="main"/>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #000;
        color: white;
        margin: 0;
        padding: 0;
    }

    .form-container {
        max-width: 700px;
        margin: 3rem auto;
        padding: 2rem;
        background: #111;
        border-radius: 8px;
        color: white;
    }

    h1 {
        color: #e10600;
        text-align: center;
        margin-bottom: 2rem;
    }

    label {
        display: block;
        margin-bottom: 0.5rem;
        font-weight: bold;
        color: #e10600;
    }

    select {
        width: 100%;
        padding: 0.6rem;
        margin-bottom: 1.5rem;
        border: 1px solid #444;
        border-radius: 5px;
        font-size: 1rem;
        background-color: #222;
        color: white;
    }

    button {
        display: block;
        width: 100%;
        background-color: #e10600;
        color: white;
        padding: 0.75rem;
        border: none;
        border-radius: 5px;
        font-size: 1rem;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #b30000;
    }
    </style>
</head>
<body>

<div class="form-container">
    <h1>Selecciona piloto y sesión</h1>

    <g:form controller="radio" action="getRadios" method="get">
        <label for="driver">Piloto:</label>
        <select name="driverNumber" id="driver">
            <g:each in="${drivers}" var="driver">
                <option value="${driver.driver_number}">${driver.full_name}</option>
            </g:each>
        </select>

        <label for="session">Sesión:</label>
        <select name="sessionKey" id="session">
            <g:each in="${sessions}" var="session">
                <option value="${session.session_key}">
                    ${session.session_name} - ${session.meeting_name ?: 'Desconocido'} - ${session.year ?: 'Desconocido'}
                </option>
            </g:each>
        </select>

        <button type="submit">Buscar Radios</button>
    </g:form>
</div>

</body>
</html>
