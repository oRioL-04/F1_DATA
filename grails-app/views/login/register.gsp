<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page layout="main" %>

<style>
body {
    background-color: #262627; /* gris oscuro */
    font-family: sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}
.login a {
    display: inline-block;
    justify-content: center;
    align-items: center;
    margin-top: 0.5rem;
    background-color: #232121;
    color: white;
    font-weight: 600;
    padding: 0.5rem 1rem;
    border-radius: 0.5rem;
    text-decoration: none;
    transition: background-color 0.3s;
}button[type="submit"] {

}
.login a:hover {
    background-color: #4b5563; /* hover:bg-gray-600 */
}
.register-container {
    background-color: #000000;
    padding: 2rem;
    border-radius: 1rem;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
    width: 100%;
    max-width: 400px;
    color: white;
}

.register-container h2 {
    text-align: center;
    font-size: 1.5rem;
    font-weight: bold;
    margin-bottom: 1.5rem;
}

.flash-message {
    background-color: #facc15;
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
    background-color: #374151;
    border: 1px solid #4b5563;
    border-radius: 0.5rem;
    color: white;
    outline: none;
}

input[type="text"]:focus,
input[type="password"]:focus {
    border-color: #faaf02;
    box-shadow: 0 0 0 2px #faaf02;
}

button[type="submit"] {
    width: 100%;
    background-color: #faaf02;
    color: black;
    font-weight: 600;
    padding: 0.5rem 1rem;
    margin-top: 1rem;
    border: none;
    border-radius: 0.5rem;
    cursor: pointer;
    transition: background-color 0.3s;
}

button[type="submit"]:hover {
    background-color: #9f740a;
}
</style>

<div class="register-container">
    <h2>Registrar una Cuenta</h2>

    <g:if test="${flash.message}">
        <div class="flash-message">
            ${flash.message}
        </div>
    </g:if>

    <form action="${createLink(controller: 'login', action: 'registrar')}" method="POST">
        <div>
            <label for="username">Usuario</label>
            <input type="text" name="username" id="username" required />
        </div>

        <div style="margin-top: 1rem;">
            <label for="password">Contraseña</label>
            <input type="password" name="password" id="password" required />
        </div>


        <button type="submit">Registrar</button>
        <div class="login">
            <p> </p>
            <a href="/login/auth">Inicia sessió</a>
        </div>
    </form>
</div>