<!-- Tailwind CDN -->


<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!-- ✅ Tailwind CSS desde CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <g:layoutHead/>
</head>

<body class="bg-black text-white font-sans">

<!-- NAVBAR -->
<nav class="bg-red-600 shadow-md">
    <div class="container mx-auto px-4 py-3 flex items-center justify-between">
        <a href="/" class="flex items-center space-x-2">
            <img src="${assetPath(src: 'f1-logo.png')}" alt="F1 Logo" class="h-8"/>
            <span class="text-white font-bold text-xl">F1 2023</span>
        </a>
        <ul class="flex space-x-6 text-sm text-white">
            <g:pageProperty name="page.nav"/>
        </ul>
    </div>
</nav>

<!-- MAIN CONTENT -->
<main class="min-h-screen py-10">
    <g:layoutBody/>
</main>

<!-- FOOTER -->
<footer class="bg-gray-900 text-gray-400 text-sm py-6">
    <div class="container mx-auto px-4 text-center">
        <p class="mt-2">Datos obtenidos de la API oficial de Fórmula 1 (o fuente correspondiente)</p>
    </div>
</footer>

<div id="spinner" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
    <div class="text-white text-lg">Cargando...</div>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
