<%@page import="java.util.Iterator"%>
<%@page import="java.util.*"%>
<%@page import="com.project.data.FetchAttendance"%>
<%@page import="com.project.common.Student"%>
<%@page import="com.project.common.Attendance"%>
<%-- <%@page import="com.project.data.Insert_Values"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
Attendance attendance = new Attendance();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Attendance</title>
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

#myInputDate {
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

#table-scroll {
	height: 400px;
	overflow: auto;
	margin-top: 20px;
}
</style>
</head>
<body>

	<%
	FetchAttendance fetchAttendance = new FetchAttendance();
	List<Attendance> attendanceList = fetchAttendance.getAttendance();
	Iterator<Attendance> it_list = attendanceList.iterator();
	%>
	<h2>Student List for Marked Attendance</h2>

	<input type="text" id="myInput" onkeyup="myFunction()"
		placeholder="Search Name">
	<input type="text" id="myInputDate" onkeyup="myFunction1()"
		placeholder="Search Attendance Date">

 <br>
 
	<form>
		<div id="table-scroll">
			<table class="table table-bordered" id="myTable">
				<!-- <thead> -->
				<tr class="header">
					<th>Roll No</th>
					<th>Name</th>
					<th>Department</th>
					<th>Sem</th>
					<th>Session</th>
					<th>Status</th>
					<th>Attendance Date</th>
				</tr>
				<!-- </thead> -->
				<tbody>
					<%
					while (it_list.hasNext()) {
						attendance = it_list.next();
					%>

					<tr>
						<td><%=attendance.getRollno()%></td>
						<td><%=attendance.getName()%></td>
						<td><%=attendance.getDept()%></td>
						<td><%=attendance.getSem()%></td>
						<td><%=attendance.getSession()%></td>
						<td><%=attendance.getStatus()%></td>
						<td><%=attendance.getAttenDate()%></td>

					</tr>


					<%
					}
					%>

				</tbody>
			</table>

		</div>


	</form>
<br>
	<div class="row">
		<div class="col-md-3 offset-md-3" id="v">
			<a href="facultydashboard.jsp" class="btn btn-primary btn-lg ">
				Back</a>
		</div>

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
		function myFunction1() {
			// Declare variables
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("myInputDate");
			filter = input.value.toUpperCase();
			table = document.getElementById("myTable");
			tr = table.getElementsByTagName("tr");

			// Loop through all table rows, and hide those who don't match the search query
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[6];
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


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>


</body>
</html>
