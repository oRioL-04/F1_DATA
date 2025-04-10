package com.example

import com.example.Meeting
import groovy.json.JsonSlurper
import groovy.util.logging.Slf4j

@Slf4j
class RadioController {

    def index() {
        def drivers = getFromOpenF1("drivers")
        def sessions = getFromOpenF1("sessions")

        drivers = drivers.unique { it.driver_number }

        // Obtener todos los meetings desde MongoDB
        def meetings = Meeting.list()


        // Añadir el nombre del Gran Premio a cada sesión
        sessions.each { session ->
            def meeting = meetings.find { it.meeting_key == (session.meeting_key as Integer) }
            if (meeting) {
                session.meeting_name = meeting.meeting_name
            }
        }

        render(view: "index", model: [drivers: drivers, sessions: sessions])
    }

    def getRadios() {
        def driverNumber = params.driverNumber
        def sessionKey = params.sessionKey

        def radios = getFromOpenF1("team_radio?session_key=${sessionKey}&driver_number=${driverNumber}")
        def meetings = Meeting.list()
        def sessions = getFromOpenF1("sessions")
        def meetingForRadios = null

        log.info("Meeting keys en base de datos: ${meetings*.meeting_key}")

        radios.each { radio ->
            log.info("Buscando meeting para radio: ${radio.meeting_key}")

            // Buscar el meeting para cada radio
            def meeting = meetings.find { it.meeting_key == (radio.meeting_key as Integer) }
            if (meeting) {
                log.info("Encontrado: ${meeting.meeting_name}")
                radio.grand_prix_name = meeting.meeting_name
                radio.session_name = radio.session_name ?: "Sesión"  // Si no tiene session_name, poner "Sesión"
                meetingForRadios = meeting  // Guardar el último meeting para extraer el año
            } else {
                log.warn("Meeting no encontrado para radio con meeting_key: ${radio.meeting_key}")
            }

            // Buscar el nombre de la sesión
            def session = sessions.find { it.session_key == radio.session_key }
            if (session) {
                radio.session_name = session.session_name
            }
        }

        // Extraer el año del último meeting encontrado
        def year = meetingForRadios?.year
        def meetingOfficialName = meetingForRadios?.meeting_official_name

        render(view: "results", model: [radios: radios, year: year, meetingOfficialName: meetingOfficialName])
    }

    private getFromOpenF1(String endpoint) {
        def url = "https://api.openf1.org/v1/${endpoint}"
        def connection = new URL(url).openConnection()
        def response = connection.content.text
        def parser = new JsonSlurper()
        return parser.parseText(response)
    }
}

