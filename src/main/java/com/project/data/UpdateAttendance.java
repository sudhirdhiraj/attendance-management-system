package com.project.data;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.util.List;

import com.project.common.Attendance;
import com.project.registration.FacultyLogin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * @author Vivek Kumar
 */
public class UpdateAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	String fdept= FacultyLogin.facdept;
	String ses = FacultyLogin.sess;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateAttendance() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String rollno = request.getParameter("rollno");
		String sem = request.getParameter("sem");
		String status = request.getParameter("status");
		HttpSession session = getSession(request);
		RequestDispatcher dispatcher = null;
		String fdept= FacultyLogin.facdept;
		String ses = FacultyLogin.sess;
		
		List<Attendance> attenListValue = new FetchAttendance().getAttendance();
		LocalDate date = LocalDate.now();
		
					
				try {
					
					
					int rowCount=0;
				   for (Attendance atten : attenListValue) {
						if ((atten.getRollno().equals(rollno))	&& (atten.getSem().equals(sem)) && (atten.getDept().equals(fdept)) && (atten.getSession().equals(ses))
						&& (atten.getAttenDate()).equals(date.toString())) {
					
							Class.forName("com.mysql.cj.jdbc.Driver");

							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user?useSSL=false", "root",
									"Sudhir@46");
							PreparedStatement ps = con.prepareStatement("update attendance set status=? where rollno=? and sem=? and dept=? and session=?");
							ps.setString(1, status);
							ps.setString(2, rollno);
							ps.setString(3, sem);
							ps.setString(4, fdept);
							ps.setString(5, ses);
					     rowCount = ps.executeUpdate();
					     //dispatcher = request.getRequestDispatcher("updateattendance.jsp");
					     if (rowCount > 0) {
					     	request.setAttribute("status", "success");
					     	//dispatcher.forward(request, response);
					     } 
						}else {
							 
						   request.setAttribute("status", "failed");
						  
					    }
						 dispatcher = request.getRequestDispatcher("updateattendance.jsp");
						 dispatcher.forward(request, response);
				   }
					
					

				} catch (Exception e) {
					e.printStackTrace();
				}
			} 
			/*
			 * else { System.out.println("You can not update attendance of prevoius date");
			 * response.sendRedirect("../facultydashboard.jsp"); }
			 */
	
	

	public static HttpSession getSession(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		return session;
	}
}
