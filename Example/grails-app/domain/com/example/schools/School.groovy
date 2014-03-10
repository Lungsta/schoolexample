package com.example.schools

class School {
	String name
	Date appStartDate
	Date appCloseDate
	static hasMany = [levels:SchoolLevel] //grade 1 to 3
    static constraints = {
    }
}
