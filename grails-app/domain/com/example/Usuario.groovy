package com.example

class Usuario {

    String username
    String password
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static hasMany = [roles: Rol]
    static mapWith = "mongo"  // Asegura que MongoDB está siendo usado

    static constraints = {
        username blank: false, unique: true
        password blank: false
    }

    Set<Rol> getAuthorities() {
        return roles
    }
}
