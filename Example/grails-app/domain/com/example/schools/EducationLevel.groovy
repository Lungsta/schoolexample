package com.example.schools
/**
 * This class defines the grades available nationwide like Grade R, 1,2,...12
 * This will be configured and updated by system admin and will serve as a lookup table
 * @author Cland
 *
 */
class EducationLevel {
	String name	//Typically a descriptive type name e.g. Matric otherwise will be same as level
	String level //grade r,1,2....12 - This is the standard name convention
	String comments		//this grade is for this and that kids only
    static constraints = {
    }
}
