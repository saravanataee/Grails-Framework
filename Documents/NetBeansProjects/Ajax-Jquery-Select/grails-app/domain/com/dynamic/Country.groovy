package com.dynamic

class Country {
    String name

    static hasMany = [states:State]

    static constraints = {
        name(blank:false)
    }

    String toString() {
        name
    }
}