package com.example


class UrlMappings {
    static mappings = {
        "/team/$id"(controller: 'team', action: 'show')
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/radios"(controller: "radio", action: "index")
        "/race-results"(controller: "raceresults", action: "index")
        "/favicon.ico"(controller: 'home', action: 'index')
        "/"(controller: 'home', action: 'index')
        "500"(view:'/error')
        "404"(view:'/notFound')

    }
}
