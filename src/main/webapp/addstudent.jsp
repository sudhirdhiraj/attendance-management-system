<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title> Add Student</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<!-- SweetAlert CSS -->
	<link rel="stylesheet" href="https://unpkg.com/sweetalert/dist/sweetalert.css">
<style>

#v{
position:absolute;
margin-right:100%;}
</style>
</head>
<body>
<input type="hidden" id="status" value=<%= request.getAttribute("status") %> ></input>
<div class="container">
		<div class="card mx-auto mt-5" style="max-width: 500px;">
			<div class="card-header">
				<h2 class="text-center"> Add Student </h2>
			</div>
			<div class="card-body">					
<form method="post" action="AddStudent">
<div class="form-group">							
<label for="roolno">Roll no.</label><input type="text" name="rollno" class="form-control" placeholder="roll no." required/>
</div>

<div class="form-group">
<label for="name">Name</label><input type="text" name="name" id="contact" class="form-control" placeholder="Name" required/>
</div>
<div class="form-group">
<label for="currsem">Current Semester</label><input type="text" name="currsem" id="currsem" class="form-control" placeholder="Current Semester" required/>
</div>
<div class="form-group">
<label for="contact">Contact No</label><input type="text" name="contact" id="contact" class="form-control" maxlength="10" placeholder="Contact no" required/>
</div>
<div class="form-group">
<label for="session">Session</label><input type="text" name="session" id="session" class="form-control" placeholder="Session" required/>
</div>

<div class="form-group">
<label for="dept">Select Department</label>
<select id="dept" class="form-control" name="dept" required>
<option value="">Select Student's Department</option>
<option value="BCA">BCA</option>
<option value="MCA">MCA</option>
<option value="B.Ed">B.Ed</option>
<option value="Diploma">Diploma</option>
<option value="MBA">MBA</option>
<option value="BBA">BBA</option>
<option value="D.Pharma">D.Pharma</option>
<option value="D.Pharma">B.Pharma</option>
<option value="Mechanical Engineering">Diploma(Mechanical Engineering)</option>
<option value="Electrical Engineering">Diploma(Electrical Engineering)</option>
<option value="Electronics and Telecommunication Engineering">Diploma(Electronics and Telecommunication Engineering)</option>
<option value="Computer Science & Engineering">Diploma(Computer Science & Engineering)</option>
<option value="Civil Engineering">Diploma(Civil Engineering)</option>
<option value="Mechanical Engineering">B.Tech(Mechanical Engineering)</option>
<option value="Electrical Engineering">B.Tech(Electrical Engineering)</option>
<option value="Electronics and Telecommunication Engineering">B.Tech(Electronics and Telecommunication Engineering)</option>
<option value="Computer Science & Engineering">B.Tech(Computer Science & Engineering)</option>
<option value="Civil Engineering">B.Tech(Civil Engineering)</option>

</select>
</div>


<div class="row" >
<div class="col-md-3 offset-md-3"  >
          <a href="admindashboard.jsp" class="btn btn-primary btn-lg btn-block">Back</a>
</div>
<div class="form-group text-center">
	<input type="submit" name="signup" id="signup" class="btn btn-primary" value="Add" />
</div>
</div>
</form>
</div>
<!-- <p class="text-center">Already have an account? <a href="login.jsp">Log in</a></p> -->
</div>
</div>

<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
var status=document.getElementById("status").value;
if(status=="success"){
	swal("Congratulations","Student has been registered", "success");
}
</script>
</body>
</html>
