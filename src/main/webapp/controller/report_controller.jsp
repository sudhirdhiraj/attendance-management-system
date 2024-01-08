<%@page import="java.util.List"%>
<%@page import="com.project.data.MRead_Values"%>
<%@page import="com.project.common.User_Bean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%
String class_id = request.getParameter("class_id");
String start_date = request.getParameter("start_date");
String end_date = request.getParameter("end_date");

MRead_Values obj_Read_Values = new MRead_Values();
List<User_Bean> list = obj_Read_Values.get_values(class_id, start_date, end_date);

int totalDays = 0;
for(User_Bean obj_User_Bean : list) {
    totalDays = obj_User_Bean.getTotal_days();
    break;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attendance Report</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
<p>Total Lectures: <%=totalDays %></p>


<table border="1" id="my-table">
<tr>
    <td>Student Roll No</td>
    <td>Students Name</td>
    <td>Students PRN</td>
    <td>Attended Lectures</td>
    <td>Percentage</td>
</tr>
<%
for(User_Bean obj_User_Bean : list) {
    int attendedLectures = obj_User_Bean.getAttendance();
    float attendancePercentage = ((float)attendedLectures / (float)totalDays) * 100;

%>
<tr <% if (attendancePercentage < 75) { %>style="color: red;"<% } %>>
    <td><%=obj_User_Bean.getStudent_rollno() %></td>
    <td><%=obj_User_Bean.getStudent_name() %></td>
    <td><%=obj_User_Bean.getStudent_prn() %></td>
    <td><%=obj_User_Bean.getAttendance() %></td>
    <% if (attendancePercentage < 75) { %>
        <td style="color: red;"><%= String.format("%.2f", attendancePercentage) %>%</td>
    <% } else { %>
        <td><%= String.format("%.2f", attendancePercentage) %>%</td>
    <% } %>
</tr>

    
<%
}
%>
</table>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>

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
  var wbout = XLSX.write(wb, { bookType: 'xlsx', type: 'binary' });
  function s2ab(s) {
    var buf = new ArrayBuffer(s.length);
    var view = new Uint8Array(buf);
    for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;
    return buf;
  }
  saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), 'attendance_report.xlsx');
}
</script>


<br>
<!-- Add a button to trigger the download -->
<div class="form-group text-center">
<button class="btn btn-primary" onclick="downloadExcel()">Download Report</button>
</div>
</body>
</html>
