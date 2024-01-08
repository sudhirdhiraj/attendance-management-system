<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.project.common.Attendance"%>
<%@page import="java.util.List"%>
<%@page import="com.project.data.FetchAttendance"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
String class_id = request.getParameter("class_id");


String sess = request.getParameter("session");
String dept = request.getParameter("dept");
String sem = request.getParameter("sem");

String start_date = request.getParameter("start_date");
String end_date = request.getParameter("end_date");

Attendance attendance = new Attendance();
FetchAttendance fetchAttendReport = new FetchAttendance();
List<Attendance> listAtten =null;

if(!(sess.isBlank()) &&(!(dept.isBlank())) && (!(sem.isBlank()))){
	listAtten=fetchAttendReport.getAttendanceReportSDS(sess, dept, sem);
}
else if(!(sess.isBlank()) &&(!(dept.isBlank())) && (!(start_date.isBlank()))&& (!(end_date.isBlank()))){
	
	LocalDate startDate = LocalDate.parse(start_date);
	LocalDate endDate = LocalDate.parse(end_date);
	listAtten=fetchAttendReport.getAttendanceReportSDDA(sess, dept,startDate.toString(),endDate.toString());
	
}
else if(!(sess.isBlank()) &&(!(dept.isBlank()))  &&(!(sem.isBlank()))&& (!(start_date.isBlank()))&& (!(end_date.isBlank()))){
	LocalDate startDate = LocalDate.parse(start_date);
	LocalDate endDate = LocalDate.parse(end_date);
	listAtten=fetchAttendReport.getAttendanceReport(sess, dept, sem, startDate.toString(),endDate.toString());

}
else if(!(sess.isBlank()) &&(!(dept.isBlank()))){
	listAtten=fetchAttendReport.getAttendanceReportSD(sess, dept);

}
else if(!(sess.isBlank()) &&(!(sem.isBlank()))){
	listAtten=fetchAttendReport.getAttendanceReportSS(sess, sem);

}

else if(!(sess.isBlank())){
	listAtten=fetchAttendReport.getAttendanceReportS(sess);

}

Iterator<Attendance> it_list = listAtten.iterator();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attendance Report</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
/* Custom styles */
body {
	background-color: #f2f2f2;
}

h2 {
	margin-top: 50px;
	margin-bottom: 50px;
	text-align: center;
	color: #337ab7;
}

table {
	margin-top: 50px;
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

a.btn {
	color: #fff;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Attendance Report</h2>
		<%-- <p>
			Total Lectures:
			<%=totalDays%></p> --%>


		<table border="1" id="my-table">
			<tr>
				<td>Roll No</td>
				<td>Name</td>
				<td>Department</td>
				<td>Semester</td>
				<td>Status</td>
				<td>Session</td>
				<td>Attendance Date</td>
				<!-- <td>Attended Lectures</td> -->
				<!-- <td>Percentage</td> -->
			</tr>

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
					<td><%=attendance.getStatus()%></td>
					<td><%=attendance.getSession()%></td>
					<td><%=attendance.getAttenDate()%></td>
				</tr>

				<%
				}
				%>
			</tbody>
		</table>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>

		<script>
			function downloadExcel() {
				// Get the table element
				var table = document.getElementById('my-table');

				// Create a copy of the table with the PRN column formatted as text
				var tableCopy = table.cloneNode(true);
				var prnColumnIndex = 2; // Index of the PRN column (zero-based)
				var rows = tableCopy.rows;
				for (var i = 1; i < rows.length; i++) {
					var prnCell = rows[i].cells[prnColumnIndex];
					prnCell.setAttribute('data-type', 'text');
				}

				// Convert table to worksheet
				var ws = XLSX.utils.table_to_sheet(tableCopy);

				// Create workbook and add worksheet
				var wb = XLSX.utils.book_new();
				XLSX.utils.book_append_sheet(wb, ws, 'Attendance Report');

				// Convert workbook to binary and download the file
				var wbout = XLSX.write(wb, {
					bookType : 'xlsx',
					type : 'binary'
				});
				function s2ab(s) {
					var buf = new ArrayBuffer(s.length);
					var view = new Uint8Array(buf);
					for (var i = 0; i < s.length; i++)
						view[i] = s.charCodeAt(i) & 0xFF;
					return buf;
				}
				saveAs(new Blob([ s2ab(wbout) ], {
					type : "application/octet-stream"
				}), 'attendance_report.xlsx');
			}
		</script>


		<br>
		<!-- Add a button to trigger the download -->
	<div class="form-group text-center">
		<button class="btn btn-primary" onclick="downloadExcel()">Download
			Report</button>

	</div>
	</div>
	<div class="form-group text-center">
		<a href="/Attenence_management_system/attendancereport.jsp"
			class="btn btn-primary btn-lg ">Back</a>
	</div>

</body>
</html>
