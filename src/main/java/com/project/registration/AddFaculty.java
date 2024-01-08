package com.project.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author Vivek Kumar
 */
public class AddFaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddFaculty() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("Text/html");
		// PrintWriter out= response.getWriter();

		String id = request.getParameter("id");
		String uname = request.getParameter("name");
		String uemail = request.getParameter("email");
		String upwd = request.getParameter("pass");
		String umobile = request.getParameter("contact");
		String udept = request.getParameter("dept");
		RequestDispatcher dispatcher = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "Sudhir@46");
			PreparedStatement ps = con
					.prepareStatement("insert into facultyreg(id, uname,uemail,upwd,umobile,udept) values(?,?,?,?,?,?)");

			ps.setString(1, id);
			ps.setString(2, uname);
			ps.setString(3, uemail);
			ps.setString(4, upwd);
			ps.setString(5, umobile);
			ps.setString(6, udept);

			int rowCount = ps.executeUpdate();
			dispatcher = request.getRequestDispatcher("addfaculty.jsp");
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
