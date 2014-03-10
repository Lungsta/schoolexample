package com.example.schools



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ApplicantController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Applicant.list(params), model:[applicantInstanceCount: Applicant.count()]
    }

    def show(Applicant applicantInstance) {
        respond applicantInstance
    }

    def create() {
        respond new Applicant(params)
    }

    @Transactional
    def save(Applicant applicantInstance) {
        if (applicantInstance == null) {
            notFound()
            return
        }

        if (applicantInstance.hasErrors()) {
            respond applicantInstance.errors, view:'create'
            return
        }

        applicantInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'applicantInstance.label', default: 'Applicant'), applicantInstance.id])
                redirect applicantInstance
            }
            '*' { respond applicantInstance, [status: CREATED] }
        }
    }

    def edit(Applicant applicantInstance) {
        respond applicantInstance
    }

    @Transactional
    def update(Applicant applicantInstance) {
        if (applicantInstance == null) {
            notFound()
            return
        }

        if (applicantInstance.hasErrors()) {
            respond applicantInstance.errors, view:'edit'
            return
        }

        applicantInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Applicant.label', default: 'Applicant'), applicantInstance.id])
                redirect applicantInstance
            }
            '*'{ respond applicantInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Applicant applicantInstance) {

        if (applicantInstance == null) {
            notFound()
            return
        }

        applicantInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Applicant.label', default: 'Applicant'), applicantInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicantInstance.label', default: 'Applicant'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
