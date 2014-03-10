package com.example.schools



import grails.test.mixin.*
import spock.lang.*

@TestFor(SchoolLevelController)
@Mock(SchoolLevel)
class SchoolLevelControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.schoolLevelInstanceList
            model.schoolLevelInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.schoolLevelInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def schoolLevel = new SchoolLevel()
            schoolLevel.validate()
            controller.save(schoolLevel)

        then:"The create view is rendered again with the correct model"
            model.schoolLevelInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            schoolLevel = new SchoolLevel(params)

            controller.save(schoolLevel)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/schoolLevel/show/1'
            controller.flash.message != null
            SchoolLevel.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def schoolLevel = new SchoolLevel(params)
            controller.show(schoolLevel)

        then:"A model is populated containing the domain instance"
            model.schoolLevelInstance == schoolLevel
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def schoolLevel = new SchoolLevel(params)
            controller.edit(schoolLevel)

        then:"A model is populated containing the domain instance"
            model.schoolLevelInstance == schoolLevel
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/schoolLevel/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def schoolLevel = new SchoolLevel()
            schoolLevel.validate()
            controller.update(schoolLevel)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.schoolLevelInstance == schoolLevel

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            schoolLevel = new SchoolLevel(params).save(flush: true)
            controller.update(schoolLevel)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/schoolLevel/show/$schoolLevel.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/schoolLevel/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def schoolLevel = new SchoolLevel(params).save(flush: true)

        then:"It exists"
            SchoolLevel.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(schoolLevel)

        then:"The instance is deleted"
            SchoolLevel.count() == 0
            response.redirectedUrl == '/schoolLevel/index'
            flash.message != null
    }
}
