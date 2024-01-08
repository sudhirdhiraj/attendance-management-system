package com.project.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import com.project.common.Attendance;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author Vivek Kumar
 */
public class AddStudentAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddStudentAttendance() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("Text/html");
		
		  String rollno = request.getParameter("rollno");
		  String name = request.getParameter("name"); 
		  String dept = request.getParameter("dept");
		  String sem = request.getParameter("sem"); 
		  String session = request.getParameter("session"); 
		  String status = request.getParameter("status");
		
		List<Attendance> list = new ArrayList<Attendance>();
		list.add(new Attendance(rollno, name,dept,sem,session,status,""));
		
		 
		  
 System.out.println("list of items ::"+request.getAttribute("attendance"));
 
 System.out.println("list  ::"+ request.getAttribute("attendanceList"));
 
 System.out.println("rollno is ::"+request.getParameter("rollno"));
 System.out.println("name is ::"+request.getParameter("name"));
 System.out.println("dept is ::"+request.getParameter("dept"));
 System.out.println("sem is ::"+request.getParameter("sem"));
 System.out.println("session is ::"+request.getParameter("session"));
 
 System.out.println("status ::"+request.getParameter("status"));
 
 
		
		
		 
		RequestDispatcher dispatcher = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "Sudhir@46");
			PreparedStatement ps = con
					.prepareStatement("insert into attendance(rollno, name,dept,sem,session,status) values(?,?,?,?,?,?)");

			
			  ps.setString(1, rollno); 
			  ps.setString(2, name); 
			  ps.setString(3, dept);
			  ps.setString(4, sem);
			  ps.setString(5, session); 
			  ps.setString(6, status);
			 
			int rowCount = ps.executeUpdate();
			dispatcher = request.getRequestDispatcher("markattendance.jsp");
			if (rowCount > 0) {
				request.setAttribute("status", "success");

			} else {
				request.setAttribute("status", "failed");

			}
			dispatcher.forward(request, response);

		}

		catch (Exception e) {
			System.out.println(e);
		}
	}
}
