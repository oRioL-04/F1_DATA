<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page layout="main" %>

<style>
body {
    background-color: #000000;
    color: #FFFFFF;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

.f1-logo {
    position: absolute;
    top: 20px;
    left: 30px;
    width: 80px;
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
    background-color: #495057;
    width: 100px;
    height: 100px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 12px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.4);
    transition: transform 0.3s ease;
}

.team-logo-box:hover {
    transform: scale(1.05);
}

.team-logo {
    max-width: 70px;
    max-height: 70px;
    object-fit: contain;
}
</style>

<div>
    <!-- Logo F1 -->
    <img src="${assetPath(src: 'f1-logo.png')}" alt="F1 Logo" class="f1-logo" />

    <!-- Contenido principal -->
    <div class="container">
        <h1>Fórmula 1 - Temporada 2023</h1>
        <p class="subtitle"> </p>

        <div class="teams-grid">
            <g:set var="teamLogos" value="${['redbull', 'mercedes', 'ferrari', 'mclaren', 'astonmartin', 'alpine', 'alphatauri', 'alfaromeo', 'haas', 'williams']}"/>
            <g:each in="${teamLogos}" var="team">
                <div class="team-logo-box">
                    <img src="${assetPath(src: 'teams/' + team + '.png')}" alt="${team}" class="team-logo" />
                </div>
            </g:each>
        </div>
    </div>
</div>