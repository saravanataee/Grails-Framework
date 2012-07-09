package test

class Persona {
    String nombre
    String apellidoPaterno
    String apellidoMaterno
    Estado estado

    static constraints = {
        nombre(blank: false)
        apellidoPaterno(blank: false)
        apellidoMaterno(blank: false)
        estado(nullable: false)
    }

    String toString() {
        "$nombre $apellidoPaterno $apellidoMaterno"
    }
}