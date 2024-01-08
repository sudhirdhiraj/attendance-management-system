<%@page import="com.project.data.AInsertValues"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String class_id=request.getParameter("class_id");
String student_rollno=request.getParameter("student_rollno");
String student_name=request.getParameter("student_name");
String student_prn=request.getParameter("student_prn");

AInsertValues obj_Insert_Values=new AInsertValues();
obj_Insert_Values.insert_values(class_id,student_rollno,student_name,student_prn);

%>
<script type="text/javascript">
<%
response.sendRedirect("../index.jsp");
%></script>
</body>
</html>