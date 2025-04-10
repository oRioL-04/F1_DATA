<%@ page contentType="text/html;charset=UTF-8" %>
<meta name="layout" content="main"/>

<style>
body {
    background-color: #000000;
    color: #FFFFFF;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

nav {
    background-color: #858280;
    box-shadow: 0 2px 6px rgba(0,0,0,0.3);
    padding: 10px 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}



.container {
    max-width: 1000px;
    margin: 0 auto;
    padding: 80px 20px 40px;
    text-align: center;
}

h1 {
    font-size: 36px;
    font-weight: bold;
    margin-bottom: 10px;
}

p.subtitle {
    color: #aaa;
    font-size: 18px;
    margin-bottom: 40px;
}

.teams-grid {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 30px;
    justify-items: center;
}

.team-logo-box {
    background-color: #858280;
    width: 100px;
    height: 100px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 12px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.4);
    transition: transform 0.3s ease;
    cursor: pointer;
}

.team-logo-box:hover {
    transform: scale(1.05);
    background-color: #858280;
}

.team-logo {
    max-width: 70px;
    max-height: 70px;
    object-fit: contain;
}

.team-link {
    text-decoration: none;
    color: inherit;
}
</style>

<div class="container">
    <h1>Fórmula 1</h1>
    <p class="subtitle">Selecciona un equipo para ver más información</p>

    <div class="teams-grid">
        <g:set var="teams" value="${[
                [id: 'redbull', name: 'Red Bull Racing'],
                [id: 'mercedes', name: 'Mercedes-AMG Petronas'],
                [id: 'ferrari', name: 'Scuderia Ferrari'],
                [id: 'mclaren', name: 'McLaren F1 Team'],
                [id: 'astonmartin', name: 'Aston Martin Aramco'],
                [id: 'alpine', name: 'Alpine F1 Team'],
                [id: 'rb', name: 'Racing Bulls'],
                [id: 'sauber', name: 'Stake Sauber F1 Team'],
                [id: 'haas', name: 'Haas F1 Team'],
                [id: 'williams', name: 'Williams Racing']
        ]}"/>

        <g:each in="${teams}" var="team">
            <a href="${createLink(controller: 'team', action: 'show', id: team.id)}" class="team-link">
                <div class="team-logo-box" title="${team.name}">
                    <img src="${assetPath(src: 'teams/' + team.id + '.png')}" alt="${team.name}" class="team-logo" />
                </div>
            </a>
        </g:each>
    </div>
</div>
