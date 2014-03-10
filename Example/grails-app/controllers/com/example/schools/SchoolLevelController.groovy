package com.example.schools



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SchoolLevelController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SchoolLevel.list(params), model:[schoolLevelInstanceCount: SchoolLevel.count()]
    }

    def show(SchoolLevel schoolLevelInstance) {
        respond schoolLevelInstance
    }

    def create() {
        respond new SchoolLevel(params)
    }

    @Transactional
    def save(SchoolLevel schoolLevelInstance) {
        if (schoolLevelInstance == null) {
            notFound()
            return
        }

        if (schoolLevelInstance.hasErrors()) {
            respond schoolLevelInstance.errors, view:'create'
            return
        }

        schoolLevelInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'schoolLevelInstance.label', default: 'SchoolLevel'), schoolLevelInstance.id])
                redirect schoolLevelInstance
            }
            '*' { respond schoolLevelInstance, [status: CREATED] }
        }
    }

    def edit(SchoolLevel schoolLevelInstance) {
        respond schoolLevelInstance
    }

    @Transactional
    def update(SchoolLevel schoolLevelInstance) {
        if (schoolLevelInstance == null) {
            notFound()
            return
        }

        if (schoolLevelInstance.hasErrors()) {
            respond schoolLevelInstance.errors, view:'edit'
            return
        }

        schoolLevelInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SchoolLevel.label', default: 'SchoolLevel'), schoolLevelInstance.id])
                redirect schoolLevelInstance
            }
            '*'{ respond schoolLevelInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SchoolLevel schoolLevelInstance) {

        if (schoolLevelInstance == null) {
            notFound()
            return
        }

        schoolLevelInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SchoolLevel.label', default: 'SchoolLevel'), schoolLevelInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'schoolLevelInstance.label', default: 'SchoolLevel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
