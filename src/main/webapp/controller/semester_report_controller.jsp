<%@page import="com.project.data.FetchSemester"%>
<%@page import="com.project.common.Semester"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%

String sess = request.getParameter("session");
String dept = request.getParameter("dept");
String sem = request.getParameter("sem");

Semester semester = new Semester();
FetchSemester fetchSemReport = new FetchSemester();
List<Semester> listSem =null;

if(!(sess.isBlank()) &&(!(dept.isBlank())) && (!(sem.isBlank()))){
	listSem=fetchSemReport.getSemReport(sess, dept, sem);
}
else if(!(sess.isBlank()) &&(!(dept.isBlank()))){
	
	listSem=fetchSemReport.getSemReportSD(sess, dept);
	
}
else if(!(sess.isBlank()) &&(!(sem.isBlank()))){
	listSem=fetchSemReport.getSemReportSS(sess, sem);

}

else if(!(sess.isBlank())){
	listSem=fetchSemReport.getSemReportS(sess);

}

Iterator<Semester> it_list = listSem.iterator();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Semester Report</title>
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
		<h2>Semester Report</h2>
		<%-- <p>
			Total Lectures:
			<%=totalDays%></p> --%>


		<table border="1" id="my-table">
			<tr>
				<td>Roll No</td>
				<td>Name</td>
				<td>Department</td>
				<td>Semester</td>
				<td>Session</td>
				<td>Start Date</td>
		    </tr>

			<tbody>

				<%
				while (it_list.hasNext()) {
					semester = it_list.next();
				%>

				<tr>
					<td><%=semester.getRollno()%></td>
					<td><%=semester.getName()%></td>
					<td><%=semester.getDept()%></td>
					<td><%=semester.getSem()%></td>
					<td><%=semester.getSession()%></td>
					<td><%=semester.getStartDate()%></td>
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
				XLSX.utils.book_append_sheet(wb, ws, 'Semester Report');

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
				}), 'semester_report.xlsx');
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
		<a href="/Attenence_management_system/semesterwisestudent.jsp"
			class="btn btn-primary btn-lg ">Back</a>
	</div>

</body>
</html>
