<%--
  Created by IntelliJ IDEA.
  User: cesc
  Date: 8/4/25
  Time: 18:37
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page layout="main" %>

<div class="flex justify-center">
    <div class="bg-gray-800 p-8 rounded-2xl shadow-lg w-full max-w-md">
        <h2 class="text-2xl font-bold text-white mb-6 text-center">Iniciar Sesión</h2>

        <g:if test='${flash.message}'>
            <div class="bg-yellow-500 text-black px-4 py-2 mb-4 rounded">
                ${flash.message}
            </div>
        </g:if>

        <form action="${postUrl ?: '/login/authenticate'}" method="POST" class="space-y-4">
            <div>
                <label for="username" class="block text-sm font-medium text-white">Usuario</label>
                <input type="text" name="username" id="username"
                       class="mt-1 block w-full px-4 py-2 bg-gray-700 text-white border border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-500" required />
            </div>

            <div>
                <label for="password" class="block text-sm font-medium text-white">Contraseña</label>
                <input type="password" name="password" id="password"
                       class="mt-1 block w-full px-4 py-2 bg-gray-700 text-white border border-gray-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-500" required />
            </div>

            <div class="flex items-center justify-between">
                <label class="inline-flex items-center">
                    <input type="checkbox" name="remember-me" class="form-checkbox h-4 w-4 text-red-600" />
                    <span class="ml-2 text-sm text-gray-300">Recordarme</span>
                </label>
                <a href="#" class="text-sm text-red-400 hover:underline">¿Olvidaste tu contraseña?</a>
            </div>

            <button type="submit"
                    class="w-full bg-red-600 hover:bg-red-700 text-white font-semibold py-2 px-4 rounded-lg transition">
                Entrar
            </button>
        </form>

        <div class="mt-6 text-center">
            <p class="text-gray-400">¿No tienes una cuenta?</p>
            <a href="/register"
               class="inline-block mt-2 bg-gray-700 hover:bg-gray-600 text-white font-semibold py-2 px-4 rounded-lg transition">
                Crear una cuenta
            </a>
        </div>
    </div>
</div>
