package com.project.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDate;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author Vivek Kumar
 */
public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddStudent() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("Text/html");

		String rollno = request.getParameter("rollno");
		String name = request.getParameter("name");
		String dept = request.getParameter("dept");
		String sem = request.getParameter("currsem");
		String contact = request.getParameter("contact");
		String session = request.getParameter("session");
		
		LocalDate date = LocalDate.now();
		System.out.println("today date:: "+date.toString());
		
		LocalDate date1 = LocalDate.now();
		
		RequestDispatcher dispatcher = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "Sudhir@46");
			PreparedStatement ps = con
					.prepareStatement("insert into student(rollno,name,dept,sem,contact,session,doa) values(?,?,?,?,?,?,?)");
			
			
			ps.setString(1, rollno);
			ps.setString(2, name);
			ps.setString(3, dept);
			ps.setString(4, sem);
			ps.setString(5, contact);
			ps.setString(6,session);
			ps.setString(7,date.toString());

			int rowCount = ps.executeUpdate();
			
			
			
			//insert into semester table
			PreparedStatement ps1 = con
					.prepareStatement("insert into semester(rollno,name,dept,sem,startdate,session) values(?,?,?,?,?,?)");
			ps1.setString(1, rollno);
			ps1.setString(2, name);
			ps1.setString(3, dept);
			ps1.setString(4, sem);
			ps1.setString(5,date1.toString());
			ps1.setString(6, session);
		
			int rowCount1 = ps1.executeUpdate();
			
			
			//insert into attendence table
			/*
			 * PreparedStatement ps2 = con
			 * .prepareStatement("insert into attendance(rollno,name,dept,sem,session,status) values(?,?,?,?,?,?)"
			 * ); ps2.setString(1, rollno); ps2.setString(2, name); ps2.setString(3, dept);
			 * ps2.setString(4, sem); ps2.setString(5, session); ps2.setString(6, "absent");
			 */
			
			//int rowCount2 = ps2.executeUpdate();
			
			dispatcher = request.getRequestDispatcher("addstudent.jsp");
			if ((rowCount >0)&&  (rowCount1>0)) {
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
