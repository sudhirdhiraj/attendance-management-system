package com.project.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.project.common.DBConnection;
import com.project.common.Student;
import com.project.registration.FacultyLogin;

import jakarta.servlet.http.HttpServlet;

public class FetchStudentForAttendance extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public FetchStudentForAttendance() {
	}

	public List<Student> getStudentAtten() { // String dept, String session

		DBConnection dbconnect = new DBConnection();

		Connection connect = dbconnect.getConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Student> listStudent = new ArrayList<Student>();

		String fdept = FacultyLogin.facdept;
		String ses = FacultyLogin.sess;

		System.out.println("logged faculty dept::" + fdept);

		String query = "select * from student where dept=? and session=?";

		try {
			ps = connect.prepareStatement(query);
			ps.setString(1, fdept);
			ps.setString(2, ses);

			rs = ps.executeQuery();
			while (rs.next()) {
				Student student = new Student();
				student.setRollno(rs.getString("rollno"));
				student.setName(rs.getString("name"));
				student.setDept(rs.getString("dept"));
				student.setContact(rs.getString("contact"));
				student.setSem(rs.getString("sem"));
				student.setSession(rs.getString("session"));
				listStudent.add(student);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listStudent;

	}

	public List<Student> getStudentDetailsForSemUpdate(String session, String dept, String sem) { // String dept, String
																									// session

		DBConnection dbconnect = new DBConnection();

		Connection connect = dbconnect.getConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Student> listStudent = new ArrayList<Student>();

		String query = "select * from student where session=? and dept=? and sem=?";

		try {
			ps = connect.prepareStatement(query);
			ps.setString(1, session);
			ps.setString(2, dept);
			ps.setString(3, sem);

			rs = ps.executeQuery();
			while (rs.next()) {
				Student student = new Student();
				student.setRollno(rs.getString("rollno"));
				student.setName(rs.getString("name"));
				student.setDept(rs.getString("dept"));
				student.setSem(rs.getString("sem"));
				student.setSession(rs.getString("session"));
				listStudent.add(student);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listStudent;

	}
}
