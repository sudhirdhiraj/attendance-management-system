<%@page import="com.project.common.SemesterList"%>
<%@page import="com.project.data.UpdateStudent"%>
<%@page import="com.project.data.FetchStudentForSemUpdate"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.project.data.SemesterInsertUpdate"%>
<%@page import="com.project.data.FetchStudentFromSemester"%>
<%@page import="com.project.data.FetchAttendance"%>
<%@page import="com.project.common.Semester"%>
<%@page import="com.project.common.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String sess = request.getParameter("session");
	String dept = request.getParameter("dept");
	String sem = request.getParameter("sem");
	String snextem = request.getParameter("next");

	SemesterInsertUpdate semInsUpdate = new SemesterInsertUpdate();
	UpdateStudent updateStudent = new UpdateStudent();

	LocalDate date = LocalDate.now();

	List<Student> studentListForSemUpdate = new FetchStudentForSemUpdate().getStudentDetailsForSemUpdate(sess, dept, sem);

	List<Semester> listSemStudent = new FetchStudentFromSemester().getListSemStudent(dept, sess); // semseter student list 

	for (Student student : studentListForSemUpdate) {

		String nextsem = request.getParameter("nextsem_" + student.getRollno());

		for (Semester semstud : listSemStudent) {
			System.out.println("Next sem avialablbity ::" + nextsem.equals(semstud.getSem()));
			SemesterList listSem = new FetchStudentFromSemester().getListSem(student.getRollno(), student.getDept(),
			student.getSession());
			if (!(listSem.getSemester().contains(nextsem))) {

			semInsUpdate.insert_values(student.getRollno(), student.getName(), student.getDept(), nextsem,
					student.getSession());
			updateStudent.update_values(nextsem, student.getRollno(), student.getName(), student.getDept(),
					student.getSession());

			}

		}

	}
	%>

	<%
	response.sendRedirect("../admindashboard.jsp");
	%>

</body>
</html>