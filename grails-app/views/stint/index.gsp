<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Seleccionar Gran Premio</title>
</head>
<body>

<h1>Selecciona un Gran Premio</h1>

<form method="get" action="${createLink(controller: 'stint', action: 'selectSession')}">
    <label for="meeting-select">Gran Premio:</label>
    <select name="meetingKey" id="meeting-select" required>
        <option value="">-- Selecciona --</option>
        <g:each in="${meetings}" var="m">
            <option value="${m.meeting_key}">
                ${m.meeting_official_name} (${m.year})
            </option>
        </g:each>
    </select>
    <button type="submit">Seleccionar</button>
</form>

</body>
</html>
