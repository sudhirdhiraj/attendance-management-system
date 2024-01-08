package com.project.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;

import com.project.common.DBConnection;

public class UpdateStudent {
	public void insert_values( String rollno, String name, String dept,String sem, String sess) {
		DBConnection dbConnection = new DBConnection();
		Connection connection = dbConnection.getConnection();
		PreparedStatement ps = null;
		LocalDate date = LocalDate.now();
		try {
			String query = "INSERT INTO student (rollno, name, dept, sem,startdate,session) VALUES (?,?,?,?,?,?)";
			ps = connection.prepareStatement(query);
			ps.setString(1, rollno);
			ps.setString(2, name);
			ps.setString(3, dept);
			ps.setString(4, sem);
			ps.setString(5, date.toString());
			ps.setString(6, sess);

			ps.executeUpdate();

		} catch (Exception e) {
			System.err.println(e);
		}
	}

	public void update_values(String sem, String rollno, String name,  String dept, String sess) {
		DBConnection dbConnection = new DBConnection();
		Connection connection = dbConnection.getConnection();
		PreparedStatement ps = null;
		try {

			String query = "update student set sem=? where rollno=? and name=? and dept=? and session=?";
			ps = connection.prepareStatement(query);
			ps.setString(1, sem);
			ps.setString(2, rollno);
			ps.setString(3, name);
			ps.setString(4, dept);
			ps.setString(5, sess);
			ps.executeUpdate();

		} catch (Exception e) {
			System.err.println(e);
		}
	}
}
