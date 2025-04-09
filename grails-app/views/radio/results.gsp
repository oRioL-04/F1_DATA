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
    <title>Radios disponibles</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 2rem;
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 2rem;
    }

    ul {
        max-width: 600px;
        margin: 0 auto;
        padding: 0;
        list-style-type: none;
    }

    li {
        background-color: #ffffff;
        margin-bottom: 1.5rem;
        padding: 1rem;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    li strong {
        display: block;
        margin-bottom: 0.5rem;
        color: #007bff;
    }

    audio {
        width: 100%;
        outline: none;
    }

    p {
        text-align: center;
        color: #666;
        font-size: 1.1rem;
    }
    </style>
</head>
<body>

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

</body>
</html>
