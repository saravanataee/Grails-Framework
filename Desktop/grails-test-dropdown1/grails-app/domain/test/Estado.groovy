package test

class Estado {
    String nombre

    static belongsTo = [pais:Pais]

    static constraints = {
        nombre(blank: false)
        pais(nullble: false)
    }

    String toString() {
        nombre
    }
}