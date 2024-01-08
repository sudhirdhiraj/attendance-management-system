package com.project.common;

public class Attendance {

	private String rollno;
	private String name;
	private String dept;
	private String sem;
	private String session;
	private String status;
	private String attenDate;

	public Attendance() {
		super();
	}

	public Attendance(String rollno, String name, String dept, String sem, String session, String status,
			String attenDate) {
		super();
		this.rollno = rollno;
		this.name = name;
		this.dept = dept;
		this.sem = sem;
		this.session = session;
		this.status = status;
		this.attenDate = attenDate;
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

	public String getSession() {
		return session;
	}

	public void setSession(String session) {
		this.session = session;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAttenDate() {
		return attenDate;
	}

	public void setAttenDate(String attenDate) {
		this.attenDate = attenDate;
	}

}
