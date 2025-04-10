<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Seleccionar año</title>
    <meta name="layout" content="main"/>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #000;
        color: white;
        margin: 0;
        padding: 0;
    }

    .btn-container {
        text-align: center;
        margin-top: 1rem;
    }

    .form-container {
        max-width: 600px;
        margin: 5rem auto;
        padding: 2rem;
        background-color: #111;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(255, 255, 255, 0.05);
    }

    h1 {
        text-align: center;
        color: #e10600;
        margin-bottom: 2rem;
    }

    label {
        display: block;
        margin-bottom: 0.5rem;
        font-weight: bold;
        color: #e10600;
        font-size: 1.1rem;
    }

    select {
        width: 100%;
        padding: 0.7rem;
        font-size: 1rem;
        background-color: #222;
        color: white;
        border: 1px solid #444;
        border-radius: 5px;
        margin-bottom: 1.5rem;
    }

    .g-submit-button {
        background-color: #e10600;
        color: white;
        padding: 0.75rem 2rem;
        font-size: 1rem;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .g-submit-button:hover {
        background-color: #b30000;
    }
    </style>
</head>
<body>

<div class="form-container">
    <h1>Seleccionar Año</h1>

    <g:form action="mostrarCalendario" method="get">
        <label for="año">Año:</label>
        <g:select name="año" from="${1950..2024}" />

        <div class="btn-container">
            <g:submitButton name="Consultar" value="Ver calendario" class="g-submit-button" />
        </div>
    </g:form>
</div>

</body>
</html>

