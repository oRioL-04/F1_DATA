package com.example

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class TeamsControllerSpec extends Specification implements ControllerUnitTest<TeamsController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
