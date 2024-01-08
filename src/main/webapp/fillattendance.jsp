<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.project.data.ARead_Values"%>
<%@page import="com.project.common.User_Bean"%>
<%@page import="com.project.data.Insert_Values"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String id = request.getParameter("id");
User_Bean obj_User_Bean = new User_Bean();
obj_User_Bean.setId(id);
session.setAttribute("obj_User_Bean", obj_User_Bean);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mark Attendance</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
    /* Custom styles */
    body {
        background-color: #f2f2f2;
    }
    h2 {
    
        margin-top: 10px;
        margin-bottom: 10px;
        text-align: center;
        color: #337ab7;
    }
    form {
        margin-top: 50px;
        background-color: #fff;
        padding: 20px;
    }
    table {
        margin-top: 2px;
        border-collapse: collapse;
        width: 100%;
        background-color: #fff;
    }
    th, td {
        text-align: left;
        padding: 8px;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    label {
        display: inline-block;
        margin-bottom: 5px;
        font-weight: bold;
    }
    input[type=text] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        box-sizing: border-box;
        border: none;
        border-bottom: 2px solid #337ab7;
    }
    input[type=submit] {
        background-color: #337ab7;
        color: #fff;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        
        
    }
    input[type=submit]:hover {
        background-color: #286090;
    } 
    
</style>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#">Teacher Id: <%=session.getAttribute("id") %></a></li>
    </ul>
  </div>
</nav>
<div class="container">

<hr>
<%
String class_id = obj_User_Bean.getId(); // get class_id from User_Bean
ARead_Values obj_Read_Values = new ARead_Values();
List<User_Bean> list = obj_Read_Values.get_values(class_id); // pass class_id to get_values method
Iterator<User_Bean> it_list = list.iterator();
%>

<h2>Fill Attendance</h2>
<form action="controller/markattendance_controller.jsp">
  <div class="form-group">
    <div class="row">
      <div class="col-md-6">
        <label class="col-md-3" for="attendance_date">Date:</label>
        <input type="date" class="form-control form-control-sm" name="attendance_date" id="attendance_date"/>
      </div>
      <div class="col-md-6">
        <label class="col-md-3" for="class_id">Subject Id:</label>
        <input type="text" name="class_id" class="form-control form-control-sm" id="class_id" value="<%=obj_User_Bean.getId()%>" readonly/>
      </div>
    </div>
  </div>

<table class="table table-bordered">
        <thead>
<tr><td>Student Id</td>
    <td>Roll No</td>
    <td>Students Name</td>
    <td>Students PRN</td>
    <td>Present</td>
    <td>Absent</td>
    <td>Status</td>
</tr>
</thead>
<tbody>
<%
while (it_list.hasNext()) {
    obj_User_Bean = it_list.next();
%>

<tr>
    <td><%=obj_User_Bean.getSid() %></td>
    <td><%=obj_User_Bean.getStudent_rollno() %></td>
    <td><%=obj_User_Bean.getStudent_name() %></td>
    <td><%=obj_User_Bean.getStudent_prn() %></td>
    
    <td><input type="radio" name="attendance_<%=obj_User_Bean.getSid()%>" value="1" onclick="updateStatus(this, <%=obj_User_Bean.getSid()%>)"></td>
   <td><input type="radio" name="attendance_<%=obj_User_Bean.getSid()%>" value="0" onclick="updateStatus(this, <%=obj_User_Bean.getSid()%>)"></td>
    <td id="status_<%=obj_User_Bean.getSid()%>"></td>
    <input type="hidden" name="class_id" value="<%=class_id%>">
    <input type="hidden" name="student_id_<%=obj_User_Bean.getSid()%>" value="<%=obj_User_Bean.getSid()%>">
    
</tr>

<%
}
%>
</tbody>
</table>

<script>
function updateStatus(radioBtn, sid) {
    if (radioBtn.value == "1") {
        document.getElementById("status_" + sid).innerHTML = "Present";
        document.getElementById("status_" + sid).style.color = "green";

    } else {
        document.getElementById("status_" + sid).innerHTML = "Absent";
        document.getElementById("status_" + sid).style.color = "red";

    }
}
</script>
  <div class="form-group text-center">
<input type="submit" value="Submit Attendance">
</div>
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</body>
</html>
