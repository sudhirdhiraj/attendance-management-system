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
public class DeleteFaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteFaculty() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("Text/html");
		// PrintWriter out= response.getWriter();

		String id = request.getParameter("id");
		
		RequestDispatcher dispatcher = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "Sudhir@46");
			PreparedStatement ps = con
					.prepareStatement("delete from facultyreg where id=?");

			ps.setString(1, id);
			

			int rowCount = ps.executeUpdate();
			dispatcher = request.getRequestDispatcher("deletefaculty.jsp");
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
