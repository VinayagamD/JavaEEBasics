/**
 * 
 */
package com.vinay.beans;

import java.io.Serializable;

/**
 * @author Dell
 *
 */
public class User implements Serializable {

	private static final long serialVersionUID = -322341460758735727L;

	private String firstName;
	private String lastName;
	
	public User() {
		firstName = "Vinay";
		lastName = "Ganesh";
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Override
	public String toString() {
		return "User [firstName=" + firstName + ", lastName=" + lastName + "]";
	}
	
	
	
}
