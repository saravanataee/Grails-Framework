package com.dynamic

class State {
    String name

    static belongsTo = [country:Country]

    static constraints = {
        name(blank: false)
        country(nullble: false)
    }

    String toString() {
        name
    }
}