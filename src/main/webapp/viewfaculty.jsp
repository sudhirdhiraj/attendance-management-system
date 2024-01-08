<%@page import="java.util.Iterator"%>
<%@page import="java.util.*"%>
<%@page import="com.project.data.FetchFaculty"%>
<%@page import="com.project.common.Faculty"%>
<%-- <%@page import="com.project.data.Insert_Values"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
Faculty faculty = new Faculty();
session.setAttribute("faculty", faculty);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Faculty</title>
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
	background-image: url('/css/searchicon.png');
	/* Add a search icon to input */
	background-position: 10px 12px; /* Position the search icon */
	background-repeat: no-repeat; /* Do not repeat the icon image */
	width: 100%; /* Full-width */
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
 
  height:500px;
  overflow-y:auto;  
  margin-top:20px;
}
</style>
</head>
<body>

	<%
	FetchFaculty fetchFaculty = new FetchFaculty();
	List<Faculty> facultylist = fetchFaculty.getFaculty();
	Iterator<Faculty> it_list = facultylist.iterator();
	%>
	<h2>Faculty List</h2>
	<form>
		
		<input type="text" id="myInput" onkeyup="myFunction()"
			placeholder="Search for Name..">
			<div id="table-scroll">
		<table class="table table-bordered" id="myTable">
			<!-- <thead> -->
			<tr class="header">
				<th>Faculty Id</th>
				<th>Name</th>
				<th>Password</th>
				<th>Email Id</th>
				<th>contact</th>
				<th>Department</th>
			</tr>
			<!-- </thead> -->
			<tbody>
				<%
				while (it_list.hasNext()) {
					faculty = it_list.next();
				%>

				<tr>
					<td><%=faculty.getId()%></td>
					<td><%=faculty.getName()%></td>
					<td><%=faculty.getPassword()%></td>
					<td><%=faculty.getEmail()%></td>
					<td><%=faculty.getContact()%></td>
					<td><%=faculty.getDept()%></td>
					
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
