<%--
  Created by IntelliJ IDEA.
  User: oriol
  Date: 9/4/25
  Time: 11:40
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Selecciona piloto y sesión</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 2rem;
    }

    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 2rem;
    }

    form {
        max-width: 500px;
        margin: 0 auto;
        background-color: white;
        padding: 2rem;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    label {
        display: block;
        margin-bottom: 0.5rem;
        font-weight: bold;
        color: #444;
    }

    select {
        width: 100%;
        padding: 0.6rem;
        margin-bottom: 1.5rem;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1rem;
    }

    button {
        display: block;
        width: 100%;
        background-color: #007bff;
        color: white;
        padding: 0.75rem;
        border: none;
        border-radius: 5px;
        font-size: 1rem;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #0056b3;
    }
    </style>
</head>
<body>

<h1>Selecciona piloto y sesión</h1>

<g:form controller="radio" action="getRadios" method="get">
    <label>Piloto:</label>
    <select name="driverNumber">
        <g:each in="${drivers}" var="driver">
            <option value="${driver.driver_number}">${driver.full_name}</option>
        </g:each>
    </select>

    <label>Sesión:</label>
    <select name="sessionKey">
        <g:each in="${sessions}" var="session">
            <option value="${session.session_key}">${session.session_name} - ${session.meeting_name ?: 'Desconocido'}</option>
        </g:each>
    </select>

    <button type="submit">Buscar Radios</button>
</g:form>

</body>
</html>
