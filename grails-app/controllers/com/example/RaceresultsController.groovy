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

        switch(params.type) {
            case 'last':
                return "${baseUrl}/current/last/results.json"
            case 'specific':
                return "${baseUrl}/${params.specificYear}/${params.specificRound}/results.json"
            case 'driver':
                if (params.constructorId) {
                    return "${baseUrl}/drivers/${params.driverId}/constructors/${params.constructorId}/results.json"
                }
                return "${params.driverYear ?: 'current'}/drivers/${params.driverId}/results.json"
            case 'position':
                return "${baseUrl}/${params.positionYear}/results/${params.finishPosition}.json"
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
