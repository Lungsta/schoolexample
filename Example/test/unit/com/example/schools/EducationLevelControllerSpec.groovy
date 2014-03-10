package com.example.schools



import grails.test.mixin.*
import spock.lang.*

@TestFor(EducationLevelController)
@Mock(EducationLevel)
class EducationLevelControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.educationLevelInstanceList
            model.educationLevelInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.educationLevelInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def educationLevel = new EducationLevel()
            educationLevel.validate()
            controller.save(educationLevel)

        then:"The create view is rendered again with the correct model"
            model.educationLevelInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            educationLevel = new EducationLevel(params)

            controller.save(educationLevel)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/educationLevel/show/1'
            controller.flash.message != null
            EducationLevel.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def educationLevel = new EducationLevel(params)
            controller.show(educationLevel)

        then:"A model is populated containing the domain instance"
            model.educationLevelInstance == educationLevel
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def educationLevel = new EducationLevel(params)
            controller.edit(educationLevel)

        then:"A model is populated containing the domain instance"
            model.educationLevelInstance == educationLevel
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/educationLevel/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def educationLevel = new EducationLevel()
            educationLevel.validate()
            controller.update(educationLevel)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.educationLevelInstance == educationLevel

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            educationLevel = new EducationLevel(params).save(flush: true)
            controller.update(educationLevel)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/educationLevel/show/$educationLevel.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/educationLevel/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def educationLevel = new EducationLevel(params).save(flush: true)

        then:"It exists"
            EducationLevel.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(educationLevel)

        then:"The instance is deleted"
            EducationLevel.count() == 0
            response.redirectedUrl == '/educationLevel/index'
            flash.message != null
    }
}
