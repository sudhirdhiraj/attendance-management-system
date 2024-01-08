package com.project.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.project.common.DBConnection;
import com.project.common.Faculty;

public class FetchFaculty {

	public FetchFaculty() {
	}

	public List<Faculty> getFaculty(){  //String dept, String session
		
		DBConnection dbconnect = new DBConnection();
		
		Connection connect = dbconnect.getConnection();
		
		PreparedStatement ps= null;
		ResultSet rs = null;
		
		List<Faculty> listfaculty = new ArrayList<Faculty>();	
		
		
		String query = "select * from facultyreg";
		
		try {
			ps=connect.prepareStatement(query);
			
			rs=ps.executeQuery();
			while (rs.next()) {
				Faculty faculty = new Faculty();
				faculty.setId(rs.getString("id"));
				faculty.setName(rs.getString("uname"));
				faculty.setPassword(rs.getString("upwd"));
	            faculty.setEmail(rs.getString("uemail"));
				faculty.setContact(rs.getString("umobile"));
				faculty.setDept(rs.getString("udept"));
				
				listfaculty.add(faculty);
            }
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return listfaculty;
		
	}
}
