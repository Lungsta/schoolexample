package com.example.schools

class Parent {
	String firstname1
	String lastname1
	
	static hasMany = [children:Applicant]
    static constraints = {
    }
}
