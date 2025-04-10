package com.example

class RaceresultsController {

    def index() {
        // Default action will show the most recent race results
        redirect(action: 'showResults', params: [type: 'last'])
    }

    def showResults() {
        def apiUrl = buildApiUrl(params)
        def raceResults = fetchRaceResults(apiUrl)

        render(view: 'raceresults', model: [
                raceResults: raceResults,
                params: params,
                apiUrl: apiUrl
        ])
    }

    private String buildApiUrl(params) {
        String baseUrl = "http://ergast.com/api/f1"

        if (params.type == 'last') {
            return "${baseUrl}/current/last/results.json"
        }
        else if (params.type == 'specific') {
            return "${baseUrl}/${params.year}/${params.round}/results.json"
        }
        else if (params.type == 'driver') {
            if (params.constructorId) {
                return "${baseUrl}/drivers/${params.driverId}/constructors/${params.constructorId}/results.json"
            }
            return "${baseUrl}/${params.year}/drivers/${params.driverId}/results.json"
        }
        else if (params.type == 'position') {
            return "${baseUrl}/${params.year}/results/${params.position}.json"
        }
        else {
            return "${baseUrl}/current/last/results.json"
        }
    }

    private def fetchRaceResults(apiUrl) {
        try {
            def connection = new URL(apiUrl).openConnection()
            connection.setRequestProperty('Accept', 'application/json')

            if (connection.responseCode == 200) {
                def json = new groovy.json.JsonSlurper().parse(connection.inputStream)
                return json.MRData.RaceTable.Races ? json.MRData.RaceTable.Races[0] : null
            } else {
                return null
            }
        } catch (Exception e) {
            log.error("Error fetching race results: ${e.message}")
            return null
        }
    }
}
