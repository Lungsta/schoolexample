package com.example.schools



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ApplicationEntryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ApplicationEntry.list(params), model:[applicationEntryInstanceCount: ApplicationEntry.count()]
    }

    def show(ApplicationEntry applicationEntryInstance) {
        respond applicationEntryInstance
    }

    def create() {
        respond new ApplicationEntry(params)
    }

    @Transactional
    def save(ApplicationEntry applicationEntryInstance) {
        if (applicationEntryInstance == null) {
            notFound()
            return
        }

        if (applicationEntryInstance.hasErrors()) {
            respond applicationEntryInstance.errors, view:'create'
            return
        }

        applicationEntryInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'applicationEntryInstance.label', default: 'ApplicationEntry'), applicationEntryInstance.id])
                redirect applicationEntryInstance
            }
            '*' { respond applicationEntryInstance, [status: CREATED] }
        }
    }

    def edit(ApplicationEntry applicationEntryInstance) {
        respond applicationEntryInstance
    }

    @Transactional
    def update(ApplicationEntry applicationEntryInstance) {
        if (applicationEntryInstance == null) {
            notFound()
            return
        }

        if (applicationEntryInstance.hasErrors()) {
            respond applicationEntryInstance.errors, view:'edit'
            return
        }

        applicationEntryInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ApplicationEntry.label', default: 'ApplicationEntry'), applicationEntryInstance.id])
                redirect applicationEntryInstance
            }
            '*'{ respond applicationEntryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ApplicationEntry applicationEntryInstance) {

        if (applicationEntryInstance == null) {
            notFound()
            return
        }

        applicationEntryInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ApplicationEntry.label', default: 'ApplicationEntry'), applicationEntryInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationEntryInstance.label', default: 'ApplicationEntry'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
