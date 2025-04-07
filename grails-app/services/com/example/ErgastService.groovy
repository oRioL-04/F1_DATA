package com.example

import groovy.json.JsonSlurper
import java.net.http.HttpClient
import java.net.http.HttpRequest
import java.net.http.HttpResponse
import java.net.URI

class ErgastService {

    final String BASE_URL = 'https://ergast.com/api/f1'
    HttpClient client = HttpClient.newHttpClient()
    JsonSlurper jsonSlurper = new JsonSlurper()

    def getDrivers(int year) {
        def url = "${BASE_URL}/${year}/drivers.json"
        def request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .GET()
                .build()

        def response = client.send(request, HttpResponse.BodyHandlers.ofString())

        if (response.statusCode() == 200) {
            def json = jsonSlurper.parseText(response.body())
            return json.MRData.DriverTable.Drivers
        } else {
            return []
        }
    }

    def getRaces(int year) {
        def url = "${BASE_URL}/${year}.json"
        def request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .GET()
                .build()

        def response = client.send(request, HttpResponse.BodyHandlers.ofString())

        if (response.statusCode() == 200) {
            def json = jsonSlurper.parseText(response.body())
            return json.MRData.RaceTable.Races
        } else {
            return []
        }
    }
}
