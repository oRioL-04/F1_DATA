<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title><g:layoutTitle default="F1 App"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
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
        background-color: #491217;
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
    }

    .nav-links li {
        color: white;
        font-size: 14px;
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
        <img src="${assetPath(src: 'f1-logo.png')}" alt="F1 Logo">
        <span> </span>
    </div>
    <ul class="nav-links">
        <g:pageProperty name="page.nav"/>
    </ul>
</nav>

<!-- MAIN CONTENT -->
<main>
    <g:layoutBody/>
</main>

<!-- FOOTER -->
<footer>
    <p>&copy; <g:formatDate date="${new Date()}" format="yyyy" />F1 App by Oriol. Todos los derechos reservados.</p>
    <p>Datos obtenidos de la API oficial de Fórmula 1 (o fuente correspondiente)</p>
</footer>

<!-- Spinner -->
<div id="spinner">
    <div>Cargando...</div>
</div>

<asset:javascript src="application.js"/>

</body>
</html>

