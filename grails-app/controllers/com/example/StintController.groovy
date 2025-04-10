package com.example

import groovy.json.JsonSlurper

class StintController {

    def index() {
        def gps = Meeting.list().sort { [it.year] }.reverse(true)
        render(view: "index", model: [grandPrixList: gps])
    }

    def showStints() {
        def meetingKey = params.meetingKey as Integer

        // 1. Obtener sesión Race
        def sessionResponse = new URL("https://api.openf1.org/v1/sessions?meeting_key=${meetingKey}&session_name=Race").text
        def sessions = new JsonSlurper().parseText(sessionResponse)

        if (!sessions || sessions.isEmpty()) {
            render(view: "stints", model: [meetingName: "Gran Premio", noRace: true])
            return
        }

        def sessionKey = sessions[0].session_key

        // 2. Obtener nombres de pilotos
        def driversResponse = new URL("https://api.openf1.org/v1/drivers?session_key=${sessionKey}").text
        def drivers = new JsonSlurper().parseText(driversResponse)
        def driverMap = drivers.collectEntries {
            [(it.driver_number.toString()): it.full_name]
        }

        // 3. Obtener nombre del GP
        def meetingName = sessions[0]?.meeting_name ?: "Gran Premio"

        render(view: "stints", model: [
                meetingKey : meetingKey,
                meetingName: meetingName,
                driverMap  : driverMap
        ])
    }

    def loadStints(Integer meetingKey) {
        if (!meetingKey) {
            render status: 400, text: "Meeting key missing"
            return
        }

        try {
            def sessionUrl = "https://api.openf1.org/v1/sessions?meeting_key=${meetingKey}&session_name=Race"
            def sessionText = new URL(sessionUrl).text
            def sessions = new JsonSlurper().parseText(sessionText)

            if (!sessions || sessions.isEmpty()) {
                render status: 404, text: "No Race session found for this meeting"
                return
            }

            def sessionKey = sessions[0].session_key
            def stintUrl = "https://api.openf1.org/v1/stints?meeting_key=${meetingKey}&session_key=${sessionKey}"
            def stintText = new URL(stintUrl).text
            render text: stintText, contentType: "application/json"

        } catch (Exception e) {
            render status: 500, text: "Error loading stints: ${e.message}"
        }
    }
}
