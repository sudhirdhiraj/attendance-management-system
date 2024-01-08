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

public class FetchStudent extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public FetchStudent() {
	}

	public List<Student> getStudent(){  //String dept, String session
		
		DBConnection dbconnect = new DBConnection();
		
		Connection connect = dbconnect.getConnection();
		
		PreparedStatement ps= null;
		ResultSet rs = null;
		
		List<Student> listStudent = new ArrayList<Student>();	
		
		
		String query = "select * from student";
		
		//select rollno,name,dept,sem,session from student where dept=? and session=?
		
		try {
			ps=connect.prepareStatement(query);
			/*
			 * ps.setString(1, dept); 
			 * ps.setString(2, session);
			 */
			
			rs=ps.executeQuery();
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
}
