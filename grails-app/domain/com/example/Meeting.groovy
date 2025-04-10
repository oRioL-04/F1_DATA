package com.example

import grails.gorm.annotation.Entity

@Entity
class Meeting {
    String id  // <- Esto permite manejar el ObjectId de Mongo como String
    Integer meeting_key
    String meeting_name
    String meeting_official_name
    String location
    String country_code
    String country_name
    String circuit_short_name
    String date_start
    String gmt_offset
    Integer year

    static mapping = {
        collection "meetings" // Nombre exacto en MongoDB
    }

    static constraints = {
        meeting_official_name nullable: true
        location nullable: true
        country_code nullable: true
        country_name nullable: true
        circuit_short_name nullable: true
        date_start nullable: true
        gmt_offset nullable: true
    }
}
