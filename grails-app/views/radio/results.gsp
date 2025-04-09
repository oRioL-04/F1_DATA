<%--
  Created by IntelliJ IDEA.
  User: oriol
  Date: 9/4/25
  Time: 11:40
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Radios disponibles</title>
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
        background-color: #222;
        margin-bottom: 1.5rem;
        padding: 1rem;
        border-radius: 10px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
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
    </style>
</head>
<body>

<div class="radios-container">
    <h2>Radios disponibles</h2>

    <g:if test="${radios}">
        <g:if test="${radios.size() > 0}">
            <ul>
                <g:each in="${radios}" var="radio" status="i">
                    <li>
                        <strong>${i + 1}. Audio – ${radio.grand_prix_name}</strong>
                        <audio controls src="${radio.recording_url}" type="audio/mpeg"></audio>
                    </li>
                </g:each>
            </ul>
        </g:if>
        <g:if test="${radios.size() == 0}">
            <p>No se encontraron radios para esa combinación.</p>
        </g:if>
    </g:if>
</div>

</body>
</html>

