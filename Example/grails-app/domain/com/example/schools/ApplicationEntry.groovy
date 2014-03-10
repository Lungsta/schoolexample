package com.example.schools

class ApplicationEntry {
	School school
	String status	//pending|accepted|rejected. Default is pending on creation.
	String reason	//mostly if it's a rejection. could be a pick list or a simple text field.
	String comments
	static belongsTo = [application:Application]
    static constraints = {
    }
}
