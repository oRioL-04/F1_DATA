<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page layout="main" %>

<style>
body {
    background-color: #262627; /* bg-gray-800 */
    font-family: sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

.login-container {
    background-color: #000000;
    padding: 2rem;
    border-radius: 1rem;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
    width: 100%;
    max-width: 400px;
    color: white;
}

.login-container h2 {
    text-align: center;
    font-size: 1.5rem;
    font-weight: bold;
    margin-bottom: 1.5rem;
}

.flash-message {
    background-color: #7a7974; /* bg-yellow-500 */
    color: black;
    padding: 0.75rem 1rem;
    border-radius: 0.5rem;
    margin-bottom: 1rem;
}

label {
    display: block;
    margin-bottom: 0.25rem;
    font-weight: 500;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 0.5rem 1rem;
    margin-top: 0.25rem;
    background-color: #374151; /* bg-gray-700 */
    border: 1px solid #4b5563; /* border-gray-600 */
    border-radius: 0.5rem;
    color: white;
    outline: none;
}

input[type="text"]:focus,
input[type="password"]:focus {
    border-color: #858280; /* red-500 */
    box-shadow: 0 0 0 2px #858280;
}

button[type="submit"] {
    width: 100%;
    background-color: #858280; /* red-600 */
    color: #000000;
    font-weight: 600;
    padding: 0.5rem 1rem;
    margin-top: 1rem;
    border: none;
    border-radius: 0.5rem;
    cursor: pointer;
    transition: background-color 0.3s;
}

button[type="submit"]:hover {
    background-color: #858280; /* red-700 */
}

.register {
    text-align: center;
    margin-top: 1.5rem;
    color: #9ca3af; /* text-gray-400 */
}

.register a {
    display: inline-block;
    margin-top: 0.5rem;
    background-color: #232121;
    color: white;
    font-weight: 600;
    padding: 0.5rem 1rem;
    border-radius: 0.5rem;
    text-decoration: none;
    transition: background-color 0.3s;
}

.register a:hover {
    background-color: #4b5563; /* hover:bg-gray-600 */
}
</style>

<div class="login-container">
    <h2>Iniciar Sesión</h2>

    <g:if test="${flash.message}">
        <div class="flash-message">
            ${flash.message}
        </div>
    </g:if>

    <form action="${createLink(controller: 'login', action: 'authenticate')}" method="POST">
        <div>
            <label for="username">Usuario</label>
            <input type="text" name="username" id="username" required />
        </div>

        <div style="margin-top: 1rem;">
            <label for="password">Contraseña</label>
            <input type="password" name="password" id="password" required />
        </div>

        <button type="submit">Entrar</button>
    </form>

    <div class="register">
        <p>¿No tienes una cuenta?</p>
        <a href="/login/register">Crear una cuenta</a>
    </div>
</div>