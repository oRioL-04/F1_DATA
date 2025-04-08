package com.example

class Usuario {

    String username
    String password
    String role = "ROLE_USER"

    static constraints = {
        username blank: false, unique: true
        password blank: false
        role blank: false
    }

    static mapping = {
        password column: 'password'
    }
}
