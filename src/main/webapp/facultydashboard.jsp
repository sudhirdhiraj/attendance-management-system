<!DOCTYPE html>
<%
if (session == null) {
	response.sendRedirect("facultylogin.jsp");
	System.out.println("session invalid");
}
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

  
<style type="text/css">
.my-class {
	color: #842DCE;
}
</style>
<title>Faculty DashBoard</title>
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
	margin:0;
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

		<h1>Srinath University,Aditypur</h1>
		<h3>Faculty Dashboard</h3>

	</div>
	
	
	<div id="myModal" class="modal fade text-center">
    <div class="modal-dialog">
      <div class="modal-content">
      </div>
    </div>
  </div>
  
	

	<nav>
		<ul>
			<!-- <li><a href="#">Home</a></li> -->
			<li><a href="markattendance.jsp">Mark Attendance</a></li>
			<li><a href="viewattendance.jsp">View Attendance</a></li>
			<!-- <li><a href="updateattendance.jsp">Update Attendance</a></li> -->
			<li><a href="attendancereport.jsp">Attendance Report</a></li>
			<li><a href="Logout">Logout</a></li>

		</ul>

	</nav>

	<br>
	<br>
	<br>
	<center><h3>Welcome, Prof. <%=session.getAttribute("name")%></h3><h6>(<%=session.getAttribute("udept") %>)</h6></center>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/js/bootstrap.min.js">
	
</script>
		
 
   <h5>Faculty Dashboard features:</h5>
    <p>Mark <i>Attendance</i> where faculty can mark student attendance for the selected session and department for the today's date only.</p>
	<p>View <i>Attendance</i> where faculty can view marked student attendance for the selected session and department.</p>
	<p>Report <i>Attendance</i> where faculty can view and download student attendance report for the selected session and department.</p>		
</body>
</html>
