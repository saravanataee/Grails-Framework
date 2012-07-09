
import com.dynamic.Country
import com.dynamic.State


class BootStrap {

    def init = { servletContext ->
        def India = new Country(name: "India").save(flush: true)
        def USA = new Country(name: "United States").save(flush: true)

        new State(
                name: "Tamil Nadu",
                country: India
        ).save(flush: true)

        new State(
                name: "Karnataka",
                country: India
        ).save(flush: true)

        new State(
                name: "California",
                country: USA
        ).save(flush: true)

        new State(
                name: "Texxass",
                country: USA
        ).save(flush: true)
    }
    def destroy = {
    }
}
