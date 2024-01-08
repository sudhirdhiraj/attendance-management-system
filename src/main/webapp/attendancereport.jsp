<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
String id = request.getParameter("id");

String start_date = request.getParameter("start_date");
String end_date = request.getParameter("end_date"); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attendance Report</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
/* Custom styles */
h2 {
	margin-top: 10px;
	margin-bottom: 10px;
	text-align: center;
	color: #337ab7;
}

.card:hover {
	box-shadow: 0 4px 10px 0 rgba(0, 0, 0, 0.9);
	transform: scale(1.1);
}
</style>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header"></div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Teacher Id: <%=session.getAttribute("id")%></a></li>
			</ul>
		</div>
	</nav>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h2 class="text-center">Generate Attendance Report</h2>
					</div>
					<div class="card-body">
						<form action="controller/attendance_report_controller.jsp">
							<div class="form-group">
								<div class="form-group">
									<label for="session">Session</label><input type="text"
										name="session" id="session" class="form-control"
										placeholder="e.g: 2022-2025" required />
								</div>
								<div class="form-group">
									<label for="dept">Department</label> <select id="dept"
										class="form-control" name="dept">
										<option value="">Select Department</option>
										<option value="BCA">BCA</option>
										<option value="MCA">MCA</option>
										<option value="B.Ed">B.Ed</option>
										<option value="Diploma">Diploma</option>
										<option value="MBA">MBA</option>
										<option value="BBA">BBA</option>
										<option value="D.Pharma">D.Pharma</option>
										<option value="D.Pharma">B.Pharma</option>
										<option value="Mechanical Engineering">Diploma(Mechanical
											Engineering)</option>
										<option value="Electrical Engineering">Diploma(Electrical
											Engineering)</option>
										<option value="Electronics and Telecommunication Engineering">Diploma(Electronics
											and Telecommunication Engineering)</option>
										<option value="Computer Science & Engineering">Diploma(Computer
											Science & Engineering)</option>
										<option value="Civil Engineering">Diploma(Civil
											Engineering)</option>
										<option value="Mechanical Engineering">B.Tech(Mechanical
											Engineering)</option>
										<option value="Electrical Engineering">B.Tech(Electrical
											Engineering)</option>
										<option value="Electronics and Telecommunication Engineering">B.Tech(Electronics
											and Telecommunication Engineering)</option>
										<option value="Computer Science & Engineering">B.Tech(Computer
											Science & Engineering)</option>
										<option value="Civil Engineering">B.Tech(Civil
											Engineering)</option>

									</select>
								</div>
								<div class="form-group">
									<label for="sem">Semester</label> <select id="sem"
										class="form-control" name=sem>
										<option value="">Select Semester</option>
										<option value="1st">First</option>
										<option value="2nd">Second</option>
										<option value="3rd">Third</option>
										<option value="4th">Fourth</option>
										<option value="5th">Fifth</option>
										<option value="6th">Six</option>
										<option value="7th">Seven</option>
										<option value="8th">Eight</option>
										<option value="9th">Nine</option>
										<option value="10th">Ten</option>
									</select>
								</div>


								<div class="form-group">
									<label for="start_date">From Date:</label><input type="date"
										class="form-control" name="start_date" id="start_date"
										 />
										 <%-- value="<%=start_date%>" --%>
								</div>
								<div class="form-group">
									<label for="end_date">Till Date:</label><input type="date"
										class="form-control" name="end_date" id="end_date"
										 />
								</div>
								<div class="form-group text-center">
									<input type="submit" class="btn btn-info"
										value="Genrate Report">
								</div>
								<div class="form-group text-center">

									<a href="facultydashboard.jsp" class="btn btn-primary btn-lg ">
										Back</a>
								</div>

							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
</html>