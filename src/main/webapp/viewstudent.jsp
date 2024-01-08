<%@page import="java.util.Iterator"%>
<%@page import="java.util.*"%>
<%@page import="com.project.data.FetchStudent"%>
<%@page import="com.project.common.Student"%>
<%-- <%@page import="com.project.data.Insert_Values"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
Student student = new Student();
session.setAttribute("student", student);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Student</title>
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
	border-color: black;
	background-image: url('/css/searchicon.png');
	/* Add a search icon to input */
	background-position: 10px 12px; /* Position the search icon */
	background-repeat: no-repeat; /* Do not repeat the icon image */
	width: 15%; /* Full-width */
	font-size: 16px; /* Increase font-size */
	padding: 12px 20px 12px 40px; /* Add some padding */
	border: 1px solid #ddd; /* Add a grey border */
	margin-bottom: 12px; /* Add some space below the input */
}

#myInputdept {
	border-color: black;
	background-image: url('/css/searchicon.png');
	/* Add a search icon to input */
	background-position: 10px 12px; /* Position the search icon */
	background-repeat: no-repeat; /* Do not repeat the icon image */
	width: 15%; /* Full-width */
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
	position: sticky;
}

#myTable tr {
	/* Add a bottom border to all table rows */
	border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
	/* Add a grey background color to the table header and on hover */
	background-color: #f1f1f1;
}

#table-scroll {
	height: 500px;
	overflow: auto;
	margin-top: 20px;
}
</style>
</head>
<body>

	<%
	FetchStudent fetchStudent = new FetchStudent();
	List<Student> studentlist = fetchStudent.getStudent();
	Iterator<Student> it_list = studentlist.iterator();
	%>
	<h2>Student List</h2>
	<form>
		<!-- method="get" action="FetchStudent"> -->
		<input type="text" id="myInput" onkeyup="myFunction()"
			placeholder="Search for session"> <input type="text"
			id="myInputdept" onkeyup="myFunctiondept()"
			placeholder="Search for Dept">



		<div id="table-scroll">
			<table class="table table-bordered" id="myTable">
				<!-- <thead> -->
				<tr class="header">
					<th>Roll No</th>
					<th>Name</th>
					<th>Department</th>
					<th>contact</th>
					<th>Current Sem</th>
					<th>Session</th>
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
					</tr>

					<%
					}
					%>
				</tbody>
			</table>
		</div>

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
					td = tr[i].getElementsByTagName("td")[5];
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
		<script>
			function myFunctiondept() {
				// Declare variables
				var input, filter, table, tr, td, i, txtValue;
				input = document.getElementById("myInputdept");
				filter = input.value.toUpperCase();
				table = document.getElementById("myTable");
				tr = table.getElementsByTagName("tr");

				// Loop through all table rows, and hide those who don't match the search query
				for (i = 0; i < tr.length; i++) {
					td = tr[i].getElementsByTagName("td")[2];
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
	</form>

	<div class="form-group text-center">
		<a href="admindashboard.jsp" class="btn btn-primary btn-lg btn-block">Back</a>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
