package com.example.schools



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SchoolController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond School.list(params), model:[schoolInstanceCount: School.count()]
    }

    def show(School schoolInstance) {
        respond schoolInstance
    }

    def create() {
        respond new School(params)
    }

    @Transactional
    def save(School schoolInstance) {
        if (schoolInstance == null) {
            notFound()
            return
        }

        if (schoolInstance.hasErrors()) {
            respond schoolInstance.errors, view:'create'
            return
        }

        schoolInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'schoolInstance.label', default: 'School'), schoolInstance.id])
                redirect schoolInstance
            }
            '*' { respond schoolInstance, [status: CREATED] }
        }
    }

    def edit(School schoolInstance) {
        respond schoolInstance
    }

    @Transactional
    def update(School schoolInstance) {
        if (schoolInstance == null) {
            notFound()
            return
        }

        if (schoolInstance.hasErrors()) {
            respond schoolInstance.errors, view:'edit'
            return
        }

        schoolInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'School.label', default: 'School'), schoolInstance.id])
                redirect schoolInstance
            }
            '*'{ respond schoolInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(School schoolInstance) {

        if (schoolInstance == null) {
            notFound()
            return
        }

        schoolInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'School.label', default: 'School'), schoolInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'schoolInstance.label', default: 'School'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
