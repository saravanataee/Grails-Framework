package test

class PaisController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paisInstanceList: Pais.list(params), paisInstanceTotal: Pais.count()]
    }

    def create = {
        def paisInstance = new Pais()
        paisInstance.properties = params
        return [paisInstance: paisInstance]
    }

    def save = {
        def paisInstance = new Pais(params)
        if (paisInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'pais.label', default: 'Pais'), paisInstance.id])}"
            redirect(action: "show", id: paisInstance.id)
        }
        else {
            render(view: "create", model: [paisInstance: paisInstance])
        }
    }

    def show = {
        def paisInstance = Pais.get(params.id)
        if (!paisInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pais.label', default: 'Pais'), params.id])}"
            redirect(action: "list")
        }
        else {
            [paisInstance: paisInstance]
        }
    }

    def edit = {
        def paisInstance = Pais.get(params.id)
        if (!paisInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pais.label', default: 'Pais'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [paisInstance: paisInstance]
        }
    }

    def update = {
        def paisInstance = Pais.get(params.id)
        if (paisInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paisInstance.version > version) {
                    
                    paisInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'pais.label', default: 'Pais')] as Object[], "Another user has updated this Pais while you were editing")
                    render(view: "edit", model: [paisInstance: paisInstance])
                    return
                }
            }
            paisInstance.properties = params
            if (!paisInstance.hasErrors() && paisInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'pais.label', default: 'Pais'), paisInstance.id])}"
                redirect(action: "show", id: paisInstance.id)
            }
            else {
                render(view: "edit", model: [paisInstance: paisInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pais.label', default: 'Pais'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def paisInstance = Pais.get(params.id)
        if (paisInstance) {
            try {
                paisInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'pais.label', default: 'Pais'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'pais.label', default: 'Pais'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pais.label', default: 'Pais'), params.id])}"
            redirect(action: "list")
        }
    }
}
