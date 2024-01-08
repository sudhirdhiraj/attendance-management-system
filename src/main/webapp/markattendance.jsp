<%@page import="java.util.Iterator"%>
<%@page import="java.util.*"%>
<%@page import="com.project.data.FetchStudentForAttendance"%>
<%@page import="com.project.common.Student"%>
<%@page import="com.project.common.Attendance"%>
<%-- <%@page import="com.project.data.Insert_Values"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
Student student = new Student();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mark Attendance</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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

#myInput {
	display: inline-block;
	background-image: url('/css/searchicon.png');
	/* Add a search icon to input */
	background-position: 10px 12px; /* Position the search icon */
	background-repeat: no-repeat; /* Do not repeat the icon image */
	width: 15%; /* Full-width */
	float: left;
	font-size: 16px; /* Increase font-size */
	padding: 12px 20px 12px 40px; /* Add some padding */
	border: 1px solid #ddd; /* Add a grey border */
	margin-bottom: 12px; /* Add some space below the input */
}

#myInput1 {
	display: inline-block;
	background-image: url('/css/searchicon.png');
	/* Add a search icon to input */
	background-position: 10px 12px; /* Position the search icon */
	background-repeat: no-repeat; /* Do not repeat the icon image */
	width: 15%; /* Full-width */
	float: left;
	font-size: 16px; /* Increase font-size */
	padding: 12px 20px 12px 40px; /* Add some padding */
	border: 1px solid #ddd; /* Add a grey border */
	margin-bottom: 12px; /* Add some space below the input */
}

#myTable {
	border-collapse: collapse; /* Collapse borders */
	width: 100%; /* Full-width */
	border: 1px solid #ddd; /* Add a grey border */
	font-size: 18px; /* Increase font-size */
}

#myTable th, #myTable td {
	text-align: left; /* Left-align text */
	padding: 12px; /* Add padding */
}

#myTable tr {
	/* Add a bottom border to all table rows */
	border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
	/* Add a grey background color to the table header and on hover */
	background-color: #f1f1f1;
}
</style>
</head>
<body>

	<%
	FetchStudentForAttendance fetchStudentAtten = new FetchStudentForAttendance();
	List<Student> studentlist = fetchStudentAtten.getStudentAtten();
	Iterator<Student> it_list = studentlist.iterator();
	%>
	<h2>Student List for Attendance</h2>

	<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search Name">
	
	<!-- <form method="post" action="AddStudentAttendance"> -->
	<form action="controller/markattendancecontroller.jsp">
	
		<table class="table table-bordered" id="myTable">
			<!-- <thead> -->
			<tr class="header">
				<th>Roll No</th>
				<th>Name</th>
				<th>Department</th>
				<th>contact</th>
				<th>Current Sem</th>
				<th>Session</th>
				<th>Mark Attendance</th>
			</tr>
			<!-- </thead> -->
			<tbody>
				<%
				while (it_list.hasNext()) {
					student = it_list.next();
				%>
			
				<tr>
					<td><%=student.getRollno()%></td>
					<td><%=student.getName()%></td>
					<td><%=student.getDept()%></td>
					<td><%=student.getContact()%></td>
					<td><%=student.getSem()%></td>
					<td><%=student.getSession()%></td>
					<td>
							<%-- <select  class="form-control"  required name="status_<%=student.getRollno()%>">
								<option value="" disabled selected>Mark Attendance</option>
								<option value="Absent" >Absent</option>
								<option value="Present">Present</option>
							</select> --%>
					
					<input  type="radio"  value="Present"  name="status_<%=student.getRollno()%>" >Present
					<input  type="radio"  value="Absent"  name="status_<%=student.getRollno()%>" >Absent
					
					<input type="hidden" name="rollno" value="<%=student.getRollno()%>">		
					<input type="hidden" name="name" value="<%=student.getName()%>">
					<input type="hidden" name="dept" value="<%=student.getDept()%>">
					<input type="hidden" name="sem" value="<%=student.getSem()%>">
					<input type="hidden" name="session" value="<%=student.getSession()%>">
					</td>
	
				</tr>
				
		
				<%
				/* attendanceList.add(attend);
				System.out.println("Attendance list::"+attendanceList.get(0).getSession()); */
				}
				%>

			</tbody>
		</table>

		


		<div class="row">
			<div class="col-md-3 offset-md-3" id="v">
				<a href="facultydashboard.jsp" class="btn btn-primary btn-lg ">
					Back</a>
			</div>
			<div class="form-group text-center" id="k">
				<input type="submit" name="signup" id="signup"
					class="btn btn-primary" value="Save">
			</div>
		</div>
	
		</form>

			
<script>
			function myFunction() {
				// Declare variables
				var input, filter, table, tr, td, i, txtValue;
				input = document.getElementById("myInput");
				filter = input.value.toUpperCase();
				table = document.getElementById("myTable");
				tr = table.getElementsByTagName("tr");

				// Loop through all table rows, and hide those who don't match the search query
				for (i = 0; i < tr.length; i++) {
					td = tr[i].getElementsByTagName("td")[1];
					if (td) {
						txtValue = td.textContent || td.innerText;
						if (txtValue.toUpperCase().indexOf(filter) > -1) {
							tr[i].style.display = "";
						} else {
							tr[i].style.display = "none";
						}
					}
				}
			}
  		
			
		</script>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			
<script type="text/javascript">
var status= document.getElementById('submit');
if(status=="success"){
	swal("Congratulations","Attendance has been Submitted", "success");
}
</script>

</body>
</html>
