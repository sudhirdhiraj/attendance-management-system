<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Faculty Deletion</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<!-- SweetAlert CSS -->
	<link rel="stylesheet" href="https://unpkg.com/sweetalert/dist/sweetalert.css">

</head>
<body>
<input type="hidden" id="status" value=<%= request.getAttribute("status") %> ></input>
<div class="container">
		<div class="card mx-auto mt-5" style="max-width: 500px;">
			<div class="card-header">
				<h2 class="text-center">Delete Faculty</h2>
			</div>
			<div class="card-body">					
<form method="post" action="DeleteFaculty">
<div class="form-group">							
<label for="id">Faculty Id</label><input type="text" name="id" class="form-control" placeholder="Faculty Id" required/>
</div>



<div class="row">
<div class="col-md-3 offset-md-3">
          <a href="admindashboard.jsp" class="btn btn-primary btn-lg btn-block">Back</a>
</div>
<div class="form-group text-center">
	<input type="submit" name="signup" id="signup" class="btn btn-primary" value="Delete" />
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
	swal("Congratulations","Faculty has been Deleted", "success");
}
</script>
</body>
</html>
