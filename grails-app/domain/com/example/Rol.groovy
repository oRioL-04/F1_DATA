package com.example

class Rol {
    String authority

    static mapWith = "mongo"  // Usando MongoDB

    static constraints = {
        authority blank: false, unique: true
    }
}
