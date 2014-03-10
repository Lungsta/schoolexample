package com.example.schools

class Application {
	Date appliedDate			//of application submitted
	SchoolLevel appliedLevel	//The grade the applicant is applying for
	
	static hasMany = [entries:ApplicationEntry]  //schools applied for
	
	static belongsTo = [applicant:Applicant]	 //applicant is already linked to parent
	static transients = ['parent']
    static constraints = {
    }
	
	public Parent getParent(){
		return applicant?.parent
	}
}
