package com.project.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.project.common.DBConnection;
import com.project.common.Student;

import jakarta.servlet.http.HttpServlet;

public class FetchStudentForSemUpdate extends HttpServlet {

	private static final long serialVersionUID = 1L;
	// HttpServletRequest request;

	public FetchStudentForSemUpdate() {
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
