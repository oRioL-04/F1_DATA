<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Calendario F1 - ${año}</title>
    <meta name="layout" content="main"/>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #000;
        color: white;
        margin: 0;
        padding: 0;
    }

    h1 {
        color: #e10600;
        text-align: center;
        margin: 2rem 0;
    }

    .grid-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 1.5rem;
        padding: 2rem;
    }

    .grid-container a {
        text-decoration: none;
        color: inherit;
        display: block;
    }

    .card {
        background-color: #111;
        border: 1px solid #222;
        border-radius: 10px;
        padding: 1.5rem;
        width: 300px;
        box-shadow: 0 0 10px rgba(255, 255, 255, 0.05);
        transition: transform 0.2s ease;
        cursor: pointer;
    }

    .card:hover {
        transform: translateY(-5px);
    }

    .card h2 {
        color: #e10600;
        font-size: 1.2rem;
        margin-bottom: 0.5rem;
    }

    .card p {
        margin: 0.2rem 0;
        font-size: 0.95rem;
    }

    .highlight {
        color: #e10600;
        font-weight: bold;
    }

    .btn-container {
        text-align: center;
        margin: 2rem 0;
    }

    .back-button {
        background-color: #e10600;
        color: white;
        padding: 0.75rem 2rem;
        font-size: 1rem;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .back-button:hover {
        background-color: #b30000;
    }
    </style>
</head>
<body>

<h1>Calendario de Fórmula 1 - ${año}</h1>

<div class="grid-container">
    <g:each in="${carreras}" var="carrera">
        <a href="${carrera.url}" target="_blank">
            <div class="card">
                <h2>Ronda ${carrera.round}: ${carrera.raceName}</h2>
                <p><span class="highlight">Fecha:</span> ${carrera.date}</p>
                <p><span class="highlight">Circuito:</span> ${carrera.Circuit.circuitName}</p>
                <p><span class="highlight">Localización:</span> ${carrera.Circuit.Location.locality}, ${carrera.Circuit.Location.country}</p>
            </div>
        </a>
    </g:each>
</div>

<div class="btn-container">
    <g:link controller="calendarioF1" action="index" class="back-button">Volver</g:link>
</div>

</body>
</html>
