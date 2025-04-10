<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Resultados de la búsqueda</title>
    <meta name="layout" content="main"/>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #000;
        color: white;
        margin: 0;
        padding: 0;
    }

    .radios-container {
        max-width: 800px;
        margin: 3rem auto;
        padding: 2rem;
        background: #111;
        border-radius: 8px;
    }

    h2 {
        text-align: center;
        color: #e10600;
        margin-bottom: 2rem;
    }

    ul {
        padding: 0;
        list-style-type: none;
    }


    li {
        margin-bottom: 2rem; /* más espacio entre audios */
    }

    li strong {
        display: block;
        margin-bottom: 0.5rem;
        color: #e10600;
    }

    audio {
        width: 100%;
        outline: none;
        background-color: #111;
    }

    p {
        text-align: center;
        color: #ccc;
        font-size: 1.1rem;
    }

    .back-button {
        display: block;
        width: fit-content;
        margin: 3rem auto 0;
        padding: 0.75rem 2rem;
        background-color: #e10600;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
        text-align: center;
        transition: background-color 0.3s ease;
    }

    .back-button:hover {
        background-color: #b00500;
    }
    </style>
</head>
<body>

<div class="radios-container">
    <h2>Radios -- ${meetingOfficialName} </h2>





    <g:if test="${radios}">
        <g:if test="${radios.size() > 0}">
            <ul>
                <g:each in="${radios}" var="radio" status="i">
                    <li>
                        <strong>${i + 1}. Audio – ${radio.grand_prix_name} (${radio.session_name})  </strong>
                        <audio controls src="${radio.recording_url}" type="audio/mpeg"></audio>
                    </li>
                </g:each>
            </ul>
        </g:if>
        <g:else>
            <p>No se encontraron radios para esa combinación.</p>
        </g:else>
    </g:if>

    <a href="/radio/index" class="back-button">← Volver a la búsqueda</a>
</div>
</body>
</html>
