package com.entity;

public class User {
	
	private int id;
	private String fname;
	private String email;
	private String password;
	private String phno;
	private String skill;
	private String experience;
	private String role;
	
	
	
	

	public User() {
		super();
		
	}





	public User( String fname, String email, String password, String phno, String skill, String experience,String role) {
		super();
		
		this.fname = fname;
		this.email = email;
		this.password = password;
		this.phno = phno;
		this.skill = skill;
		this.experience = experience;
		this.role=role;
	}





	public String getRole() {
		return role;
	}





	public void setRole(String role) {
		this.role = role;
	}





	public int getId() {
		return id;
	}





	public void setId(int id) {
		this.id = id;
	}





	public String getFname() {
		return fname;
	}





	public void setFname(String fname) {
		this.fname = fname;
	}





	public String getEmail() {
		return email;
	}





	public void setEmail(String email) {
		this.email = email;
	}





	public String getPassword() {
		return password;
	}





	public void setPassword(String password) {
		this.password = password;
	}





	public String getPhno() {
		return phno;
	}





	public void setPhno(String phno) {
		this.phno = phno;
	}





	public String getSkill() {
		return skill;
	}





	public void setSkill(String skill) {
		this.skill = skill;
	}





	public String getExperience() {
		return experience;
	}





	public void setExperience(String experience) {
		this.experience = experience;
	}
	
	

}
