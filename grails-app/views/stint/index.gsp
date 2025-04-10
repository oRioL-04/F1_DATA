<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Seleccionar Gran Premio</title>
</head>
<body>

<h1>Selecciona un Gran Premio</h1>

<form method="get" action="${createLink(controller: 'stint', action: 'showStints')}">
    <label for="gp-select">Gran Premio:</label>
    <select name="meetingKey" id="gp-select" required>
        <option value="">-- Selecciona --</option>
        <g:each in="${grandPrixList}" var="gp">
            <option value="${gp.meeting_key}">${gp.meeting_name} (${gp.year})</option>
        </g:each>
    </select>
    <button type="submit">Ver Stints</button>
</form>

</body>
</html>

