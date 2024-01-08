package com.project.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;

import com.project.common.DBConnection;

public class AttendanceInsert {
    public void insert_values(String rollno, String name, String dept, String sem, String sess, String status) {
        DBConnection dbConnection = new DBConnection();
        Connection connection = dbConnection.getConnection();
        PreparedStatement ps = null;
        LocalDate date = LocalDate.now();
        try {
            String query = "INSERT INTO attendance (rollno, name, dept, sem,session,status,attendate) VALUES (?,?,?,?,?,?,?)";
            ps = connection.prepareStatement(query);
            ps.setString(1, rollno);
            ps.setString(2, name);
            ps.setString(3, dept);
            ps.setString(4, sem);
            ps.setString(5, sess);
            ps.setString(6, status);
            ps.setString(7, date.toString());

            ps.executeUpdate();
            
            
            
        } catch (Exception e) {
            System.err.println(e);
        }
    }
    
    public void update_values(String status,String rollno, String sem,String dept, String sess, String date) {
        DBConnection dbConnection = new DBConnection();
        Connection connection = dbConnection.getConnection();
        PreparedStatement ps = null;
       // LocalDate date = LocalDate.now();
        try {
        	
        	String query = "update attendance set status=? where rollno=? and sem=? and dept=? and session=? and attendate=?";
            ps = connection.prepareStatement(query);
        	ps.setString(1, status);
			ps.setString(2, rollno);
			ps.setString(3, sem);
			ps.setString(4, dept);
			ps.setString(5, sess);
			ps.setString(6, date);

            ps.executeUpdate();
            
            
            
        } catch (Exception e) {
            System.err.println(e);
        }
    }
}
