<!DOCTYPE html>
<html>
<head>
    <title>STINTS</title>
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
    <h1>Selecciona un Gran Premio de F1</h1>

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
</div>

</body>
</html>
