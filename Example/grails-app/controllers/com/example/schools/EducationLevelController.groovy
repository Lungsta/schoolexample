package com.example.schools



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EducationLevelController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EducationLevel.list(params), model:[educationLevelInstanceCount: EducationLevel.count()]
    }

    def show(EducationLevel educationLevelInstance) {
        respond educationLevelInstance
    }

    def create() {
        respond new EducationLevel(params)
    }

    @Transactional
    def save(EducationLevel educationLevelInstance) {
        if (educationLevelInstance == null) {
            notFound()
            return
        }

        if (educationLevelInstance.hasErrors()) {
            respond educationLevelInstance.errors, view:'create'
            return
        }

        educationLevelInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'educationLevelInstance.label', default: 'EducationLevel'), educationLevelInstance.id])
                redirect educationLevelInstance
            }
            '*' { respond educationLevelInstance, [status: CREATED] }
        }
    }

    def edit(EducationLevel educationLevelInstance) {
        respond educationLevelInstance
    }

    @Transactional
    def update(EducationLevel educationLevelInstance) {
        if (educationLevelInstance == null) {
            notFound()
            return
        }

        if (educationLevelInstance.hasErrors()) {
            respond educationLevelInstance.errors, view:'edit'
            return
        }

        educationLevelInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EducationLevel.label', default: 'EducationLevel'), educationLevelInstance.id])
                redirect educationLevelInstance
            }
            '*'{ respond educationLevelInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EducationLevel educationLevelInstance) {

        if (educationLevelInstance == null) {
            notFound()
            return
        }

        educationLevelInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EducationLevel.label', default: 'EducationLevel'), educationLevelInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'educationLevelInstance.label', default: 'EducationLevel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
