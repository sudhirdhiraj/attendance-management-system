package com.project.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @author Vivek Kumar
 */
public class Adminlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Adminlogin() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uname = request.getParameter("username");
		String upwd = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user?useSSL=false", "root",
					"Sudhir@46");
			PreparedStatement ps = con.prepareStatement("select * from adminlogin where (username=? ) and userpass=?");
			ps.setString(1, uname);
			ps.setString(2, upwd);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				/*
				 * session.setAttribute("name", rs.getString("uname"));
				 * session.setAttribute("id", rs.getString("id")); session.setAttribute("udept",
				 * rs.getString("udept"));
				 */
				dispatcher = request.getRequestDispatcher("admindashboard.jsp");
			}

			else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("adminlogin.jsp");

			}
			dispatcher.forward(request, response);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
