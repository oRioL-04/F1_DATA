package com.example

import groovy.json.JsonSlurper

class CalendarioF1Controller {

    final String BASE_URL = 'https://ergast.com/api/f1'

    def index() {
        // Muestra el formulario de selección de año
    }

    def mostrarCalendario(int año) {
        def url = "${BASE_URL}/${año}.json"
        def response = getJsonFromUrl(url)

        if (response?.MRData?.RaceTable?.Races) {
            def carreras = response.MRData.RaceTable.Races
            render(view: 'calendario', model: [carreras: carreras, año: año])
        } else {
            flash.message = "No se pudo obtener el calendario para el año ${año}."
            render(view: 'index')
        }
    }

    private getJsonFromUrl(String url) {
        try {
            def connection = new URL(url).openConnection()
            def responseText = connection.content.text
            def json = new JsonSlurper().parseText(responseText)
            return json
        } catch (Exception e) {
            log.error("Error al obtener datos de ${url}", e)
            return null
        }
    }
}
