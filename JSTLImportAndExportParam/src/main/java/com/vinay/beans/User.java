/**
 * 
 */
package com.vinay.beans;

import java.io.Serializable;
import java.util.Objects;

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

	@Override
	public int hashCode() {
		return Objects.hash(firstName, lastName);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof User))
			return false;
		User other = (User) obj;
		return Objects.equals(firstName, other.firstName) && Objects.equals(lastName, other.lastName);
	}
	
	
	
	
}
