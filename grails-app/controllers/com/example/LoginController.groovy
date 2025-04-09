package com.example




import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

class LoginController {

    def springSecurityService  // Se utiliza para la comparación de contraseñas encriptadas

    def auth() {
        render view: 'auth'
    }

    def register() {
        render view: 'register'
    }

    def authenticate() {
        def username = params.username
        def password = params.password

        def usuario = Usuario.findByUsername(username)
        def passwordEncoder = new BCryptPasswordEncoder()

        if (usuario && passwordEncoder.matches(password, usuario.password)) {
            session.user = usuario
            redirect(controller: "home", action: "index") // REDIRECCIÓN CLARA
        } else {
            flash.message = "Lo siento, no hemos encontrado ningún usuario con ese nombre y contraseña."
            redirect(action: "auth")
        }
    }



    def registrar() {
        // Validar que los parámetros están presentes
        if (!params.username || !params.password) {
            flash.message = "El nombre de usuario y la contraseña son obligatorios."
            redirect(action: "register")
            return
        }

        // Crear el objeto Usuario
        def usuario = new Usuario(
                username: params.username,
                password: new BCryptPasswordEncoder().encode(params.password),
                enabled: true
        )

        // Intentar guardar el usuario
        if (usuario.save(flush: true)) {
            // Buscar o crear el rol de usuario
            def rol = Rol.findByAuthority('ROLE_USER') ?: new Rol(authority: 'ROLE_USER').save(flush: true)

            // Asignar el rol al usuario
            usuario.roles = [rol]
            usuario.save(flush: true)

            flash.message = "Usuario registrado correctamente."
            redirect(controller: "login", action: "auth")  // Redirige al login
        } else {
            flash.message = "Error al registrar usuario."
            redirect(action: "register")  // Redirige al formulario de registro
        }
    }
}
