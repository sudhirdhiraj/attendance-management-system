<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Faculty Registration</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<!-- SweetAlert CSS -->
	<link rel="stylesheet" href="https://unpkg.com/sweetalert/dist/sweetalert.css">
<style>
.row{

font-size:13px;

}
#v{

display:inline;
position:absolute;
margin-right:100%;
padding:10px;
margin-top:0%;
height:30px;
width:10px;


}
#k{

margin:10px;
padding:5px;
display:inline;
width:120px;
height:90px;
position:absolute;
margin-left:55%;
margin-top:3%;
margin-bottom:90%;
font-size:40px;


}
div register{
height:30px;

}

</style>
</head>
<body>
<input type="hidden" id="status" value=<%= request.getAttribute("status") %> ></input>
<div class="container">
		<div class="card mx-auto mt-5" style="max-width: 500px;">
			<div class="card-header">
				<h2 class="text-center">Faculty Registration</h2>
			</div>
			<div class="card-body">					
<form method="post" action="AddFaculty">
<div class="form-group">							
<label for="id">Faculty Id</label><input type="text" name="id" class="form-control" placeholder="Enter id" required/>
</div>
<div class="form-group">							
<label for="name">Name</label><input type="text" name="name" class="form-control" placeholder="Name" required/>
</div>
<div class="form-group">
<label for="email">Email</label><input type="email" name="email" id="email" class="form-control" placeholder="Email" required/>
</div>
<div class="form-group">
<label for="pass">Password</label> <input type="password" name="pass" id="pass" class="form-control" placeholder="Password" required/>
</div>
<div class="form-group">
<label for="re-pass">Repeat Password</label><input type="password" name="re_pass" id="re_pass" class="form-control" placeholder="Repeat your password" required/>
</div>
<div class="form-group">
<label for="contact">Contact No</label><input type="text" name="contact" id="contact" class="form-control" maxlength="10" placeholder="Contact no" required/>
</div>
<div class="form-group">
<label for="dept">Select Department</label><select id="dept" class="form-control" name="dept" required>
<option value=""> Department</option>
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
<div class="col-md-3 offset-md-3" id="v" >
          <a href="admindashboard.jsp" class="btn btn-primary btn-lg " > Back</a>
</div>
<div class="form-group text-center" id="k">
	<input type="submit" name="signup" id="signup" class="btn btn-primary" value="Register" >
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
	swal("Congratulations","Faculty has been registered", "success");
}
</script>
</body>
</html>
