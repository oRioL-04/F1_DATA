<%--
  Created by IntelliJ IDEA.
  User: oriol
  Date: 7/4/25
  Time: 11:39
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${team?.name ?: 'Equipo no encontrado'}</title>
    <meta name="layout" content="main"/>
    <style>
    .team-container {
        max-width: 1000px;
        margin: 2rem auto;
        padding: 2rem;
        background: #111;
        border-radius: 8px;
        color: white;
    }
    .team-header {
        display: flex;
        align-items: center;
        margin-bottom: 2rem;
    }
    .team-logo-container {
        width: 150px;
        height: 150px;
        margin-right: 2rem;
        background-color: rgba(255, 255, 255, 0.2);
        border-radius: 8px;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 10px;
        backdrop-filter: blur(2px);
    }
    .team-logo {
        max-width: 100%;
        max-height: 100%;
        object-fit: contain;
    }
    .team-info h1 {
        color: #e10600;
        margin-bottom: 1rem;
    }
    .team-info p {
        margin: 0.5rem 0;
    }
    .section-title {
        color: #e10600;
        border-bottom: 1px solid #333;
        padding-bottom: 0.5rem;
        margin: 1.5rem 0 1rem;
    }
    .stats-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 1rem;
        margin-top: 1.5rem;
    }
    .stat-item {
        background: #222;
        padding: 1rem;
        border-radius: 4px;
    }
    .drivers-container {
        display: flex;
        gap: 2rem;
        justify-content: center;
        flex-wrap: wrap;
    }
    .driver-card {
        text-align: center;
    }
    .driver-image {
        width: 200px;
        height: 200px;
        object-fit: cover;
        border-radius: 50%;
        border: 3px solid #e10600;
    }
    .driver-name {
        margin-top: 0.5rem;
        font-weight: bold;
    }
    </style>
</head>
<body>
<div class="team-container">
    <g:if test="${team}">
        <div class="team-header">
            <div class="team-logo-container">
                <img src="${assetPath(src: 'teams/' + teamId + '.png')}"
                     alt="${team.name}" class="team-logo"/>
            </div>
            <div class="team-info">
                <h1>${team.name}</h1>
                <p><strong>Base:</strong> ${team.base}</p>
                <p><strong>Team Principal:</strong> ${team.principal}</p>
                <p><strong>Chasis:</strong> ${team.chassis}</p>
                <p><strong>Motor:</strong> ${team.engine}</p>
            </div>
        </div>

        <div class="stats-grid">
            <div class="stat-item">
                <h3 class="section-title">Pilotos 2025</h3>
                <div class="drivers-container">
                    <g:each in="${team.drivers}" var="driver">
                        <g:set var="lastName" value="${driver.split(' ').last().toLowerCase()}"/>
                        <div class="driver-card">
                            <img src="${assetPath(src: 'drivers/' + lastName + '.png')}"
                                 alt="${driver}"
                                 class="driver-image">
                            <div class="driver-name">${driver}</div>
                        </div>
                    </g:each>
                </div>
            </div>

            <div class="stat-item">
                <h3 class="section-title">Historia</h3>
                <p><strong>Fundado:</strong> ${team.founded}</p>
                <p><strong>Campeonatos:</strong> ${team.championships}</p>
            </div>
        </div>
    </g:if>
    <g:else>
        <h1>Equipo no encontrado</h1>
        <p>No se encontró información para este equipo.</p>
    </g:else>
</div>
</body>
</html>