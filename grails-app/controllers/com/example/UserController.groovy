package com.example

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

class UserController {

    def passwordEncoder = new BCryptPasswordEncoder()

    def registrar() {
        // Crear el usuario con el password codificado
        def usuario = new Usuario(
                username: params.username,
                password: passwordEncoder.encode(params.password),
                enabled: true
        )

        // Intentar guardar el usuario
        if (usuario.save(flush: true)) {
            // Buscar o crear el rol ROLE_USER
            def rol = Rol.findByAuthority('ROLE_USER') ?: new Rol(authority: 'ROLE_USER').save(flush: true)

            // Asignar el rol al usuario
            usuario.addToRoles(rol)

            // Guardar el usuario con el rol
            if (usuario.save(flush: true)) {
                flash.message = "Usuario registrado correctamente"
                redirect(controller: "login", action: "auth")
            } else {
                flash.message = "Error al guardar el usuario con el rol"
                redirect(action: "register")
            }
        } else {
            flash.message = "Error al registrar el usuario"
            redirect(action: "register")
        }
    }
}
