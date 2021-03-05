package llhh2007.edu.Entity;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import llhh2007.edu.annotation.Phone;

public class User {
	private int id;
	@NotBlank
	private String username;
	@Length(min = 8,message="At least 8 characters")
	private String password;
	@NotNull
	private int enabled;
	@NotBlank
	private String name;
	@Phone(message = "Phone Number is invalid")
	private String phoneNumber;
	public User() {
		
	}
	public User(String username, String password, int enabled, String name, String phoneNumber) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.name = name;
		this.phoneNumber = phoneNumber;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
