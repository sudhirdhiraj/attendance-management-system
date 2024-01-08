
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Faculty Login </title>
<!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
  <input type="hidden" id="status" value=<%= request.getAttribute("status") %> ></input>

  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card">
          <div class="card-header">
            <h2 class="text-center">Faculty Log in</h2>
          </div>
          <div class="card-body">
<form method="post" action="FacultyLogin">
  <div class="form-group">							
<label for="id"></label> <input type="text" class="form-control" name="id" id="id" placeholder="faculty id" required />
</div>
<div class="form-group">
<label for="password"></label><input type="password" class="form-control" name="password" id="password" placeholder="Password" required />
</div>

 <div class="form-group">							
<label for="session"></label> <input type="text" class="form-control" name="session" id="session" placeholder="Enter Session of dept to mark attendance" required />
</div>


<div class="row">
<div class="col-md-3 offset-md-3">
          <a href="startingpage.jsp" class="btn btn-primary btn-lg btn-block">Back</a>
</div>
<div class="form-group text-center">
	<input type="submit" name="signin" id="signin" class="btn btn-primary" value="Log in" />
</div>
</div>
						
</form>

</div>
</div>
</div>
</div>
</div>

  <!-- Bootstrap JavaScript -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi4+N" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
<script type="text/javascript">
var status=document.getElementById("status").value;
if(status=="failed"){
	swal("sorry","You entered wrong userid or password","error");
}

</script>

</body>
</html>