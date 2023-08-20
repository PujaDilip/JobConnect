package com.entity;

import javax.management.loading.PrivateClassLoader;

public class Recruiter {
	private int id;
	private String company_name;
	private String recruiter_name;
	private String location;
	private String phno;
	private String email;
	private String password;
	private String status;
	private String role;
	public Recruiter() {
		super();
		
	}

	

	public Recruiter(String company_name, String recruiter_name, String location, String phno, String email,
			String password, String status,String role) {
		super();
		this.company_name = company_name;
		this.recruiter_name = recruiter_name;
		this.location = location;
		this.phno = phno;
		this.email = email;
		this.password = password;
		this.status = status;
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

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getRecruiter_name() {
		return recruiter_name;
	}

	public void setRecruiter_name(String recruiter_name) {
		this.recruiter_name = recruiter_name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPhno() {
		return phno;
	}

	public void setPhno(String phno) {
		this.phno = phno;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
