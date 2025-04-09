package com.example



class UsuarioRol implements Serializable {

    Usuario usuario
    Rol rol

    static constraints = {
        usuario nullable: false
        rol nullable: false
    }

    static mapping = {
        id composite: ['usuario', 'rol']
        version false
    }
}
