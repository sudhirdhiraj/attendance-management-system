<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.project.data.AttendanceInsert"%>
<%@page import="com.project.data.FetchStudentForAttendance"%>
<%@page import="com.project.data.FetchAttendance"%>
<%@page import="com.project.common.Student"%>
<%@page import="com.project.common.Attendance"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	AttendanceInsert attIns = new AttendanceInsert();

	List<Student> list = new FetchStudentForAttendance().getStudentAtten(); // retrieve students for the dept and session
	LocalDate date = LocalDate.now();
	System.out.println("list of student"+list.toString());
	List<Attendance> attenListValue = new FetchAttendance().getAttendance();
	
	
	
	if (attenListValue.isEmpty()) { // attendence list is empty, then insert new rows

		for (Student student : list) {
			System.out.println("student data ::"+student.getRollno());
			String status = request.getParameter("status_" + student.getRollno());
			attIns.insert_values(student.getRollno(), student.getName(), student.getDept(), student.getSem(),
			student.getSession(), status);
		}
	} else { // if attendenace table is not empty
	
		for (Student student : list) {
			System.out.println("student data ::"+student.getRollno());
			String status = request.getParameter("status_" + student.getRollno());
			
			for (Attendance atten : attenListValue) {
				if((atten.getAttenDate().equals(date.toString()))){					
				
						System.out.println("student data updating today attendence::"+student.getRollno());
						attIns.update_values(status,student.getRollno(), student.getSem(), student.getDept(),student.getSession() ,date.toString());
					
				}
				else{						
						attIns.insert_values(student.getRollno(), student.getName(), student.getDept(), student.getSem(),
						student.getSession(), status);
					
				}
			}
		
	}
	}
	%>

	<%
	response.sendRedirect("../facultydashboard.jsp");
	%>

</body>
</html>