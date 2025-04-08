package com.example


class UrlMappings {
    static mappings = {
        "/team/$id"(controller: 'team', action: 'show')
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'home', action: 'index')
        "500"(view:'/error')
        "404"(view:'/notFound')

    }
}
