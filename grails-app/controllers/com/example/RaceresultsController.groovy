package com.example

class RaceresultsController {

    def index() {
        redirect(action: 'showResults', params: [type: 'last'])
    }

    def showResults() {
        def grandPrixList = (1..23) // Asumiendo máximo 23 rondas (puedes ajustar)
        def apiUrl = buildApiUrl(params)
        def raceResults = apiUrl ? fetchRaceResults(apiUrl) : null

        render(view: 'raceresults', model: [
                raceResults: raceResults,
                grandPrixList: grandPrixList,
                params: params,
                apiUrl: apiUrl
        ])
    }

    private String buildApiUrl(params) {
        String baseUrl = "http://ergast.com/api/f1"

        switch (params.type) {
            case 'last':
                return "${baseUrl}/current/last/results.json"
            case 'specific':
                if (!params.specificYear || !params.roundNumber) {
                    return null
                }
                return "${baseUrl}/${params.specificYear}/${params.roundNumber}/results.json"
            case 'driver':
                if (!params.driverId || !params.driverYear) {
                    return null
                }
                return "${baseUrl}/${params.driverYear}/drivers/${params.driverId}/results.json"
            default:
                return "${baseUrl}/current/last/results.json"
        }
    }

    private def fetchRaceResults(apiUrl) {
        try {
            def connection = new URL(apiUrl).openConnection()
            connection.setRequestProperty('Accept', 'application/json')

            if (connection.responseCode == 200) {
                def json = new groovy.json.JsonSlurper().parse(connection.inputStream)
                return json.MRData.RaceTable
            } else {
                return null
            }
        } catch (Exception e) {
            log.error("Error fetching race results: ${e.message}")
            return null
        }
    }
}
