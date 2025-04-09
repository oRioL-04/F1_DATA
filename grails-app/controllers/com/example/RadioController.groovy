package com.example

import grails.converters.JSON
import groovy.json.JsonSlurper

class RadioController {

    def index() {
        // Carga inicial: obtener pilotos y sesiones
        def drivers = getFromOpenF1("drivers")
        def sessions = getFromOpenF1("sessions")

        // Filtrar pilotos para que no se repitan por driver_number
        drivers = drivers.unique { it.driver_number }

        // Obtener todos los meetings disponibles
        def meetings = getFromOpenF1("meetings?year=2023")

        // Añadir el nombre del Gran Premio a cada sesión
        sessions.each { session ->
            def meeting = meetings.find { it.meeting_key == session.meeting_key }
            if (meeting) {
                session.meeting_name = meeting.meeting_name
            } else {
                println "No se encontró meeting para session_key: ${session.session_key} con meeting_key: ${session.meeting_key}"
            }
        }

        render(view: "index", model: [drivers: drivers, sessions: sessions])
    }

    def getRadios() {
        def driverNumber = params.driverNumber
        def sessionKey = params.sessionKey

        // Obtener radios de la API de OpenF1
        def radios = getFromOpenF1("team_radio?session_key=${sessionKey}&driver_number=${driverNumber}")

        // Obtener todos los meetings disponibles
        def meetings = getFromOpenF1("meetings?year=2023")

        // Añadir nombre del GP a cada radio
        radios.each { radio ->
            def meeting = meetings.find { it.meeting_key == radio.meeting_key }
            if (meeting) {
                radio.meeting_name = meeting.meeting_name
            } else {
                println "No se encontró meeting para radio con meeting_key: ${radio.meeting_key}"
            }
        }

        render(view: "results", model: [radios: radios])
    }

    private getFromOpenF1(String endpoint) {
        def url = "https://api.openf1.org/v1/${endpoint}"
        def connection = new URL(url).openConnection()
        def response = connection.content.text
        def parser = new JsonSlurper()
        return parser.parseText(response)
    }
}
