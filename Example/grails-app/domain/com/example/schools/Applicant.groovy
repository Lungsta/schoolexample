package com.example.schools

class Applicant {
	String firstname
	String lastname
	
	static belongsTo=[parent:Parent]
	static hasMany = [applications:Application]
    static constraints = {
    }
}
