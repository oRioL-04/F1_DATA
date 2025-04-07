package com.example

class HomeController {

    ErgastService ergastService

    def index() {
        def drivers = ergastService.getDrivers(2023)
        def races = ergastService.getRaces(2023)
        [drivers: drivers, races: races]
    }
}
