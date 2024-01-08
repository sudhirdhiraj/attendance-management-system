package com.project.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.project.common.DBConnection;
import com.project.common.Semester;
import com.project.common.SemesterList;

import jakarta.servlet.http.HttpServlet;

public class FetchStudentFromSemester extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public FetchStudentFromSemester() {
	}
	
	public List<Semester> getListSemStudent(String dept,String sess) {

		Connection connect = connectDB();

		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Semester> listSemStudent = new ArrayList<Semester>();

		String query = "select * from semester where dept=? and session=?";


		try {
			ps = connect.prepareStatement(query);
			ps.setString(1, dept);
			//ps.setString(2, sem);
			ps.setString(2, sess);
			rs = ps.executeQuery();
			while (rs.next()) {
				Semester atten = new Semester();
				atten.setRollno(rs.getString("rollno"));
				atten.setName(rs.getString("name"));
				atten.setDept(rs.getString("dept"));
				atten.setSem(rs.getString("sem"));
				atten.setStartDate(rs.getString("startdate"));
				atten.setSession(rs.getString("session"));
				atten.setEndDate(rs.getString("enddate"));
				
				listSemStudent.add(atten);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listSemStudent;

	}
	
	public SemesterList getListSem(String rollno,String dept,String sess) {

		Connection connect = connectDB();

		PreparedStatement ps = null;
		ResultSet rs = null;

		SemesterList listSemStudent = new SemesterList();

		String query = "select sem from semester where rollno=? and dept=? and session=?";


		try {
			ps = connect.prepareStatement(query);
			ps.setString(1, rollno);
			ps.setString(2, dept);
			ps.setString(3, sess);
			rs = ps.executeQuery();
			//SemesterList sem = new SemesterList();
			
			List<String> listSem = new ArrayList<String>();
			
			while (rs.next()) {
				
				/*
				 * atten.setRollno(rs.getString("rollno")); atten.setName(rs.getString("name"));
				 * atten.setDept(rs.getString("dept"));
				 */
				//sem.setSemester(rs.getString("sem"));
				/*
				 * atten.setStartDate(rs.getString("startdate"));
				 * atten.setSession(rs.getString("session"));
				 * atten.setEndDate(rs.getString("enddate"));
				 */
				
				listSem.add(rs.getString("sem"));
				//listSemStudent.add(listSem)
				listSemStudent.setSemester(listSem);
				
				
				//sem.setSemester(new SemesterList());
				
				
			}
			//listSemStudent.addAll(listSem);
			

		} catch (SQLException e) {
			e.printStackTrace();
		}

	
		return listSemStudent;

	}

	private Connection connectDB() {
		DBConnection dbconnect = new DBConnection();

		Connection connect = dbconnect.getConnection();
		return connect;
	}

	
}
