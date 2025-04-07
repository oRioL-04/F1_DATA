package com.example

import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class ErgastServiceSpec extends Specification implements ServiceUnitTest<ErgastService> {

     void "test something"() {
        expect:
        service.doSomething()
     }
}
