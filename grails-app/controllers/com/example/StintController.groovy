package com.example

import groovy.json.JsonSlurper
import grails.gorm.transactions.Transactional

class StintController {

    def index() {
        // Obtener todos los Grandes Premios desde MongoDB
        def meetings = Meeting.findAll()
        render(view: "index", model: [meetings: meetings])
    }

    def selectSession() {
        def meetingKey = params.meetingKey as Integer

        if (!meetingKey) {
            render status: 400, text: "Falta meetingKey"
            return
        }

        def sessionUrl = "https://api.openf1.org/v1/sessions?session_name=Race&meeting_key=${meetingKey}"
        def sessionData = fetchApiData(sessionUrl)

        if (!sessionData) {
            render status: 404, text: "No se encontró sesión de carrera para este Gran Premio"
            return
        }

        def sessionKey = sessionData[0]?.session_key
        redirect(action: "showStints", params: [sessionKey: sessionKey])
    }

    def showStints() {
        def sessionKey = params.sessionKey as Integer

        if (!sessionKey) {
            render status: 400, text: "Falta sessionKey"
            return
        }

        // Obtener información de la sesión
        def sessionInfo = fetchApiData("https://api.openf1.org/v1/sessions?session_key=${sessionKey}")
        def meetingKey = sessionInfo ? sessionInfo[0]?.meeting_key : null

        // Obtener información del Meeting desde MongoDB
        def meeting = meetingKey ? Meeting.findByMeeting_key(meetingKey) : null
        def meetingYear = meeting?.year ?: "Año desconocido"
       // def circuitShortName = meeting?.circuit_short_name ?: "Circuito Desconocido"
        def meetingName = meeting?.meeting_official_name ?: "Meeting Name desconocido"

        // Obtener los stints de la sesión
        def stints = fetchApiData("https://api.openf1.org/v1/stints?session_key=${sessionKey}") ?: []

        // Calcular el número de vueltas por stint
        stints.each { stint ->
            stint.laps = (stint.lap_start && stint.lap_end) ? (stint.lap_end - stint.lap_start + 1) : 0
        }

        // Obtener datos de los pilotos en una sola solicitud
        def driversData = fetchApiData("https://api.openf1.org/v1/drivers?session_key=${sessionKey}") ?: []

        // Crear un mapa de número de piloto a nombre
        def driverMap = driversData.collectEntries { driver ->
            [(driver.driver_number.toString()): driver.full_name ?: "Piloto ${driver.driver_number}"]
        }

        // Agrupar los stints por piloto
        def groupedStints = stints.groupBy { it.driver_number.toString() }

        render(view: "stints", model: [
                sessionKey       : sessionKey,
                meetingYear      : meetingYear,
               // circuitShortName : circuitShortName,
                groupedStints    : groupedStints,
                driverMap        : driverMap,
                meetingName : meetingName
        ])
    }


    /**
     * Método auxiliar para obtener datos de la API de OpenF1 con manejo de errores.
     */
    private fetchApiData(String url) {
        try {
            def responseText = new URL(url).text
            def jsonData = new JsonSlurper().parseText(responseText)
            return jsonData ?: []
        } catch (Exception e) {
            log.error("Error al obtener datos de la API: ${url}", e)
            return []
        }
    }
}
