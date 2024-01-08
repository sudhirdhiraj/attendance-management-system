package com.project.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.project.common.Attendance;
import com.project.common.DBConnection;
import com.project.registration.FacultyLogin;

import jakarta.servlet.http.HttpServlet;

public class FetchAttendance extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public FetchAttendance() {
	}
	
	public List<Attendance> getAttendance() {

		Connection connect = connectDB();

		String fdept = FacultyLogin.facdept;
		String ses = FacultyLogin.sess;

		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Attendance> listAtten = new ArrayList<Attendance>();

		String query = "select * from attendance where dept=? and session=?";


		try {
			ps = connect.prepareStatement(query);
			ps.setString(1, fdept);
			ps.setString(2, ses);

			rs = ps.executeQuery();
			while (rs.next()) {
				Attendance atten = new Attendance();
				atten.setRollno(rs.getString("rollno"));
				atten.setName(rs.getString("name"));
				atten.setDept(rs.getString("dept"));
				atten.setSem(rs.getString("sem"));
				atten.setSession(rs.getString("session"));
				atten.setStatus(rs.getString("status"));
				atten.setAttenDate(rs.getString("attendate"));
				listAtten.add(atten);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listAtten;

	}
	
	public List<Attendance> getAttendanceReport(String sess,String dept,String sem,String start_date,String end_date) {

		Connection connect = connectDB();

		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Attendance> listAtten = new ArrayList<Attendance>();

		String query = "SELECT * from attendance where session=? AND dept=? AND sem=? AND attendate BETWEEN ? AND ?";


		try {
			ps = connect.prepareStatement(query);
			ps.setString(1, start_date);
			ps.setString(2, end_date);

			rs = ps.executeQuery();
			while (rs.next()) {
				Attendance atten = new Attendance();
				atten.setRollno(rs.getString("rollno"));
				atten.setName(rs.getString("name"));
				atten.setDept(rs.getString("dept"));
				atten.setSem(rs.getString("sem"));
				atten.setSession(rs.getString("session"));
				atten.setStatus(rs.getString("status"));
				atten.setAttenDate(rs.getString("attendate"));
				listAtten.add(atten);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listAtten;

	}
		
	public List<Attendance> getAttendanceReportSDDA(String sess,String dept,String start_date,String end_date) {

		Connection connect = connectDB();

		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Attendance> listAtten = new ArrayList<Attendance>();

		String query = "SELECT * from attendance where session=? AND dept=? AND attendate BETWEEN ? AND ?";


		try {
			ps = connect.prepareStatement(query);
			ps.setString(1, sess);
			ps.setString(2, dept);
			ps.setString(3, start_date);
			ps.setString(4, end_date);

			rs = ps.executeQuery();
			while (rs.next()) {
				Attendance atten = new Attendance();
				atten.setRollno(rs.getString("rollno"));
				atten.setName(rs.getString("name"));
				atten.setDept(rs.getString("dept"));
				atten.setSem(rs.getString("sem"));
				atten.setSession(rs.getString("session"));
				atten.setStatus(rs.getString("status"));
				atten.setAttenDate(rs.getString("attendate"));
				listAtten.add(atten);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listAtten;

	}
	public List<Attendance> getAttendanceReportSDS(String sess,String dept,String sem) {

		Connection connect = connectDB();

		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Attendance> listAtten = new ArrayList<Attendance>();

		String query = "SELECT * from attendance where session=? AND dept=? AND sem=?";


		try {
			ps = connect.prepareStatement(query);
			ps.setString(1, sess);
			ps.setString(2, dept);
			ps.setString(3, sem);
			rs = ps.executeQuery();
			while (rs.next()) {
				Attendance atten = new Attendance();
				atten.setRollno(rs.getString("rollno"));
				atten.setName(rs.getString("name"));
				atten.setDept(rs.getString("dept"));
				atten.setSem(rs.getString("sem"));
				atten.setSession(rs.getString("session"));
				atten.setStatus(rs.getString("status"));
				atten.setAttenDate(rs.getString("attendate"));
				listAtten.add(atten);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listAtten;

	}
	
	public List<Attendance> getAttendanceReportSD(String sess,String dept) {

		Connection connect = connectDB();

		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Attendance> listAtten = new ArrayList<Attendance>();

		String query = "SELECT * from attendance where session=? AND dept=?";


		try {
			ps = connect.prepareStatement(query);
			ps.setString(1, sess);
			ps.setString(2, dept);
			
			rs = ps.executeQuery();
			while (rs.next()) {
				Attendance atten = new Attendance();
				atten.setRollno(rs.getString("rollno"));
				atten.setName(rs.getString("name"));
				atten.setDept(rs.getString("dept"));
				atten.setSem(rs.getString("sem"));
				atten.setSession(rs.getString("session"));
				atten.setStatus(rs.getString("status"));
				atten.setAttenDate(rs.getString("attendate"));
				listAtten.add(atten);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listAtten;

	}
	public List<Attendance> getAttendanceReportSS(String sess,String sem) {

		Connection connect = connectDB();

		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Attendance> listAtten = new ArrayList<Attendance>();

		String query = "SELECT * from attendance where session=? AND sem=?";


		try {
			ps = connect.prepareStatement(query);
			ps.setString(1, sess);
			ps.setString(2, sem);
			
			rs = ps.executeQuery();
			while (rs.next()) {
				Attendance atten = new Attendance();
				atten.setRollno(rs.getString("rollno"));
				atten.setName(rs.getString("name"));
				atten.setDept(rs.getString("dept"));
				atten.setSem(rs.getString("sem"));
				atten.setSession(rs.getString("session"));
				atten.setStatus(rs.getString("status"));
				atten.setAttenDate(rs.getString("attendate"));
				listAtten.add(atten);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listAtten;

	}
	
	public List<Attendance> getAttendanceReportS(String sess) {

		Connection connect = connectDB();

		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Attendance> listAtten = new ArrayList<Attendance>();

		String query = "SELECT * from attendance where session=?";


		try {
			ps = connect.prepareStatement(query);
			ps.setString(1, sess);
			
			rs = ps.executeQuery();
			while (rs.next()) {
				Attendance atten = new Attendance();
				atten.setRollno(rs.getString("rollno"));
				atten.setName(rs.getString("name"));
				atten.setDept(rs.getString("dept"));
				atten.setSem(rs.getString("sem"));
				atten.setSession(rs.getString("session"));
				atten.setStatus(rs.getString("status"));
				atten.setAttenDate(rs.getString("attendate"));
				listAtten.add(atten);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listAtten;

	}
	

	private Connection connectDB() {
		DBConnection dbconnect = new DBConnection();

		Connection connect = dbconnect.getConnection();
		return connect;
	}

	
}
