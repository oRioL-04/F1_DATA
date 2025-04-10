<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title><g:layoutTitle default="F1 App"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asset:link rel="icon" href="favicon.ico" type="image/x-icon" />


    <g:layoutHead/>

    <style>
    body {
        background-color: #000;
        color: #fff;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    nav {
        background-color: #918f89;
        box-shadow: 0 2px 6px rgba(0,0,0,0.3);
        padding: 10px 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .logo-container {
        display: flex;
        align-items: center;
    }

    .logo-container img {
        height: 40px;
        margin-right: 10px;
    }

    .logo-container span {
        font-size: 20px;
        font-weight: bold;
        color: white;
    }

    .nav-links {
        display: flex;
        gap: 20px;
        list-style: none;
        margin: 0;
        padding: 0;
        position: relative;
    }

    .nav-links li {
        color: white;
        font-size: 14px;
        position: relative;
    }

    .dropdown {
        cursor: pointer;
    }

    .dropdown-icon {
        font-size: 24px;
        color: #000;
        user-select: none;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        right: 0;
        top: 100%;
        background-color: #222;
        padding: 10px 0;
        list-style: none;
        margin: 0;
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.3);
        z-index: 1000;
        min-width: 160px;
    }

    .dropdown-content li {
        padding: 8px 20px;
        white-space: nowrap;
    }

    .dropdown-content li a {
        color: white;
        text-decoration: none;
    }

    .dropdown-content li:hover {
        background-color: #333;
    }

    main {
        min-height: 80vh;
        padding: 40px 20px;
    }

    footer {
        background-color: #111;
        color: #aaa;
        font-size: 14px;
        padding: 20px;
        text-align: center;
    }

    #spinner {
        display: none;
        position: fixed;
        inset: 0;
        background-color: rgba(0, 0, 0, 0.5);
        color: white;
        font-size: 18px;
        align-items: center;
        justify-content: center;
        z-index: 999;
    }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav>
    <div class="logo-container">
        <a href="${request.contextPath}/">
            <img src="${assetPath(src: 'f1-logo.png')}" alt="F1 Logo">
        </a>
        <span></span>
    </div>
    <ul class="nav-links">
        <g:pageProperty name="page.nav"/>
        <li class="dropdown">
            <span class="dropdown-icon" onclick="toggleDropdown()">☰</span>
            <ul class="dropdown-content" id="dropdownMenu">
                <li><a href="radio/index">Radios</a></li>
                <li><a href="/stint/index">Stints</a></li>
                <li><a href="/calendarioF1/index">Historial de Calendarios</a></li>
                <li><a href="/login/auth">Cerrar sesión</a></li>

            </ul>
        </li>
    </ul>
</nav>

<!-- MAIN CONTENT -->
<main>
    <g:layoutBody/>
</main>

<!-- FOOTER -->
<footer>
    <p>&copy; <g:formatDate date="${new Date()}" format="yyyy" /> F1 App by Spartanos. Todos los derechos reservados.</p>
    <p>Datos obtenidos de la API OPENF1 y Ergast API</p>
</footer>

<!-- Spinner -->
<div id="spinner">
    <div>Cargando...</div>
</div>

<asset:javascript src="application.js"/>

<script>
    function toggleDropdown() {
        const menu = document.getElementById("dropdownMenu");
        menu.style.display = (menu.style.display === "block") ? "none" : "block";
    }

    document.addEventListener("click", function(event) {
        const dropdown = document.querySelector(".dropdown");
        if (!dropdown.contains(event.target)) {
            document.getElementById("dropdownMenu").style.display = "none";
        }
    });
</script>

</body>
</html>
