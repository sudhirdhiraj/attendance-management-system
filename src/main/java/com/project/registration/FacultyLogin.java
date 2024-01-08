package com.project.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * @author Vivek Kumar
 */
public class FacultyLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	public static String facdept=null;
	public static String sess=null;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FacultyLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String upwd = request.getParameter("password");
		sess=request.getParameter("session");
		HttpSession session = getSession(request);
		RequestDispatcher dispatcher = null;
		

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user?useSSL=false", "root",
					"Sudhir@46");
			PreparedStatement ps = con.prepareStatement("select * from facultyreg where id=? and upwd=?");
			ps.setString(1, id);
			ps.setString(2, upwd);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				session.setAttribute("name", rs.getString("uname"));
				session.setAttribute("id", rs.getString("id"));
				session.setAttribute("udept", rs.getString("udept"));
				dispatcher = request.getRequestDispatcher("facultydashboard.jsp");// index.jsp is faculty dashboard page
			}

			else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("facultylogin.jsp");

			}
			facdept= (String) getSession(request).getAttribute("udept");
			
			dispatcher.forward(request, response);
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static String getDept(HttpServletRequest request) {
		
		//getSession(request);
		//deptt = session.getAttribute("udept");
		String fdept = (String) getSession(request).getAttribute("udept");
		//System.out.println("faculty ddept"+fdept);
		return fdept;
		
	}

	public static HttpSession getSession(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		return session;
	}
}
