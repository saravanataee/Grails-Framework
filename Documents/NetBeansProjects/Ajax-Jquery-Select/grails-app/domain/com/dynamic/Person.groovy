package com.dynamic

class Person {
    String name
    String Firstname
    String Lastname
    State state

    static constraints = {
        name(blank: false)
        Firstname(blank: false)
        Lastname(blank: false)
        state(nullable: false)
    }

    String toString() {
        "$name $Firstname $Lastname"
    }
}
