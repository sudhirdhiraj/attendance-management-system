package com.project.common;

public class Student {
	
	private String rollno;
	private String name;
	private String dept;
	private String sem;
	private String contact;
	private String session;
	
	
	public Student() {
		
	}
	
	
	public Student(String rollno, String name, String dept, String sem, String contact, String session) {
		super();
		this.rollno = rollno;
		this.name = name;
		this.dept = dept;
		this.sem = sem;
		this.contact = contact;
		this.session = session;
	}

	public String getRollno() {
		return rollno;
	}

	public void setRollno(String rollno) {
		this.rollno = rollno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getSem() {
		return sem;
	}

	public void setSem(String sem) {
		this.sem = sem;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getSession() {
		return session;
	}

	public void setSession(String session) {
		this.session = session;
	}
	
	
	

}
