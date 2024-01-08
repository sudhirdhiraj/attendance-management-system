package com.project.common;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @author Vivek Kumar
 */
public class DBConnection {
	public static void main(String[] args) {
		DBConnection obj_DB_Connection = new DBConnection();
		System.out.println(obj_DB_Connection.getConnection());
	}

	public Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "Sudhir@46");
		} catch (Exception e) {
			System.out.println(e);
		}
		return connection;
	}
}
