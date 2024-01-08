<!DOCTYPE html>
<%
if (session == null) {
	response.sendRedirect("adminlogin.jsp");
	System.out.println("session invalid");
}
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<style type="text/css">
.my-class {
	color: #842DCE;
}
</style>
<title>Admin DashBoard</title>
<!-- Bootstrap CDN stylesheet -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/css/bootstrap.min.css">
</head>
<body>

<style>
/* Custom styles */
body {
	background-color: #f2f2f2;
}

h1 {
	margin-top: 20px;
	margin-bottom: 20px;
	text-align: center;
	color: #dc3545;
}

nav {
	background-color: #dc3545;
	color: red padding: 10px;
	border-radius: 0;
}

/* .container {
	margin-top: 50px;
}

.btn {
	margin-right: 10px;
}
 */
.logo img {
	float: left;
	width: 100px;
	height: 100px;
	margin-left: 35px;
}

.logo h1 {
	color: :red;
	position: center;
	top: 30px;
	left: 10px;
}

.logo h3 {
	color: #dc3545;
	text-align: center;
}

#wrap {
	width: 100%;
	height: 50px;
	margin: 0;
	z-index: 99;
	position: relative;
	background-color: #444444;
}

nav li {
	height: auto;
	width: 330px;
	float: left;
	text-align: center;
	list-style: none;
	font: normal bold 13px/1em Arial, Verdana, Helvetica;
	padding: 0;
	margin: 0;
	background-color: #444444;
}

nav a {
	padding: 18px 0;
	border-left: 1px solid #ccc9c9;
	text-decoration: none;
	color: white;
	display: block;
}

nav li:hover, a:hover {
	background-color: #444444;
}

nav li ul {
	display: none;
	height: auto;
	margin: 0;
	padding: 0;
}

nav li:hover ul {
	display: block;
}

nav li ul li {
	background-color: #444444;
}

nav li ul li a {
	border-left: 1px solid #444444;
	border-right: 1px solid #444444;
	border-top: 1px solid #c9d4d8;
	border-bottom: 1px solid #444444;
}

nav li ul li a:hover {
	background-color: #a3a1a1;
}

h5{
	text-align: left;
	margin-left:4em;
}
p{
	text-align: left;
	margin-left:5em;
}
</style>
</head>
<body>
	<div class="logo">

		<img src="images/sri.jpg" alt="Logo" width="200">

		<h1><bold>Srinath university,Aditypur</bold></h1>
		<h3>Admin Dashboard</h3>

	</div>

	<nav>
		<ul>
			<!-- <li><a href="#">Home</a></li> -->
			<li><a href="#">Faculty</a>
				<ul>
					<li><a href="addfaculty.jsp">Add Faculty</a></li>
					<li><a href="viewfaculty.jsp">View Faculty</a></li>
					<li><a href="deletefaculty.jsp">Delete Faculty</a></li>
				</ul></li>

			<li><a href="#">Students</a>
				<ul>
					<li><a href="addstudent.jsp">Add Students</a></li>
					<li><a href="viewstudent.jsp">view Students</a></li>
					<li><a href="searchstudentsemupdate.jsp">Update Student's Sem</a></li>
					
				</ul></li>
			<li><a href="#">Reports</a>
				<ul>
					<li><a href="semesterwisestudent.jsp">Semester Wise Students</a>
					</li>
				</ul>
			</li>
			
			<li><a href="Logout">Logout</a></li>

		</ul>

	</nav>

	<br>
	<br>
	<br>
	<!-- <center>
		<h3>Welcome, Admin</h3>
	</center> -->

	<!-- Bootstrap CDN JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/js/bootstrap.min.js"></script>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
   <h5>Admin Dashboard features:</h5>
    <p><i>Faculty</i> where  Admin register or add new faculty , delete existing faculty and view faculty details.</p>
	<p><i>Students</i> where Admin register or add new student , view student details and update or promote student to the next semester.</p>
	<p><i>Report</i> where Admin generates or view semester wise report for student. </p>		
</body>
</html>
