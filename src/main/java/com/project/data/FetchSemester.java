package com.project.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.project.common.DBConnection;
import com.project.common.Semester;

import jakarta.servlet.http.HttpServlet;

public class FetchSemester extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public FetchSemester() {
	}
	
	public List<Semester> getSemReport(String sess, String dept, String sem) {

		Connection connect = connectDB();


		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Semester> listSem = new ArrayList<Semester>();

		String query = "select * from Semester where session=? and dept=? and sem=?";


		try {
			ps = connect.prepareStatement(query);
			ps.setString(1, sess);
			ps.setString(2, dept);
			ps.setString(3, sem);

			rs = ps.executeQuery();
			while (rs.next()) {
				Semester seme = new Semester();
				seme.setRollno(rs.getString("rollno"));
				seme.setName(rs.getString("name"));
				seme.setDept(rs.getString("dept"));
				seme.setSem(rs.getString("sem"));
				seme.setSession(rs.getString("session"));
				seme.setStartDate(rs.getString("startdate"));
				listSem.add(seme);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listSem;

	}
	
	public List<Semester> getSemReportSD(String sess, String dept) {

		Connection connect = connectDB();


		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Semester> listSem = new ArrayList<Semester>();

		String query = "select * from Semester where session=? and dept=?";


		try {
			ps = connect.prepareStatement(query);
			ps.setString(1, sess);
			ps.setString(2, dept);
		

			rs = ps.executeQuery();
			while (rs.next()) {
				Semester seme = new Semester();
				seme.setRollno(rs.getString("rollno"));
				seme.setName(rs.getString("name"));
				seme.setDept(rs.getString("dept"));
				seme.setSem(rs.getString("sem"));
				seme.setSession(rs.getString("session"));
				seme.setStartDate(rs.getString("startdate"));
				listSem.add(seme);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listSem;

	}
	public List<Semester> getSemReportSS(String sess, String sem) {

		Connection connect = connectDB();


		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Semester> listSem = new ArrayList<Semester>();

		String query = "select * from Semester where session=? and sem=?";


		try {
			ps = connect.prepareStatement(query);
			ps.setString(1, sess);
			ps.setString(2, sem);

			rs = ps.executeQuery();
			while (rs.next()) {
				Semester seme = new Semester();
				seme.setRollno(rs.getString("rollno"));
				seme.setName(rs.getString("name"));
				seme.setDept(rs.getString("dept"));
				seme.setSem(rs.getString("sem"));
				seme.setSession(rs.getString("session"));
				seme.setStartDate(rs.getString("startdate"));
				listSem.add(seme);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listSem;

	}
	public List<Semester> getSemReportS(String sess) {

		Connection connect = connectDB();


		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Semester> listSem = new ArrayList<Semester>();

		String query = "select * from Semester where session=?";


		try {
			ps = connect.prepareStatement(query);
			ps.setString(1, sess);
			rs = ps.executeQuery();
			while (rs.next()) {
				Semester seme = new Semester();
				seme.setRollno(rs.getString("rollno"));
				seme.setName(rs.getString("name"));
				seme.setDept(rs.getString("dept"));
				seme.setSem(rs.getString("sem"));
				seme.setSession(rs.getString("session"));
				seme.setStartDate(rs.getString("startdate"));
				listSem.add(seme);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listSem;

	}

	private Connection connectDB() {
		DBConnection dbconnect = new DBConnection();

		Connection connect = dbconnect.getConnection();
		return connect;
	}

	
}
