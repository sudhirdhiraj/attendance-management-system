<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.project.data.MInsertValues"%>
<%@page import="com.project.data.ARead_Values"%>
<%@page import="com.project.common.User_Bean"%>
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
    String class_id=request.getParameter("class_id");
    String attendance_date=request.getParameter("attendance_date");

    MInsertValues obj_Insert_Values=new MInsertValues();

    List<User_Bean> list = new ARead_Values().get_values(class_id); // retrieve students for the class

    for (User_Bean student : list) {
        int student_id = student.getSid();
        int is_present = Integer.parseInt(request.getParameter("attendance_" + student_id));
        obj_Insert_Values.insert_values(class_id, student_id, attendance_date, is_present);
    }

%>


<%
   response.sendRedirect("../index.jsp");
%>

</body>
</html>