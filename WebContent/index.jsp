<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
<link rel="icon" href="8.png" type="image/icon type">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />

<link rel="stylesheet" href="Style.css">

<style>
#togglePassword {
    cursor: pointer;
}
</style>

</head>


<body>

	<div style="margin-left: 1250px; margin-top: 10px;;">
		<a href="signUp.jsp" title="Don't have an account ?"
			data-toggle="popover" data-trigger="hover" data-placement="bottom"
			data-content="Sign up"><img src="2.png"
			style="width: 100px; height: 100px;"></a>
	</div>

	<div class="container" style="margin-top: 100px; margin-left: 250px;">
	<h4 style="margin-left: 200px;">
		 <%
		 String p = (String)session.getAttribute("passwordchanged");
		 String lr = (String)session.getAttribute("loginerror");
		 String en = (String)session.getAttribute("een");
		 String lo = (String)session.getAttribute("logout");
		 
		 if(p!=null){
			 out.print(p);
			 session.setAttribute("passwordchanged", null);
		 }
		 if(lr!=null){
			 out.print(lr);
			 session.setAttribute("loginerror", null);
		 }
		 if(en!=null){
			 out.print(en);
			 session.setAttribute("een", null);
		 }
		 if(lo!=null){
			 out.print(lo);
			 session.setAttribute("logout", null);
		 }
		 
		%>
   </h4>
		<form class="form-horizontal" action="loginprocess.jsp" method="post">
			<div class="form-group has-success has-feedback">
				<label class="col-sm-2 control-label" for="inputSuccess"
					style="font-size: 25px;">Email : </label>
				<div class="col-sm-5">
					<input type="email" class="form-control" id="inputSuccess"
						placeholder="Enter email" style="height: 45px" name="email"
						required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
			</div>
			<div class="form-group has-success has-feedback">
				<label class="col-sm-2 control-label" for="myInput"
					style="font-size: 25px">Password : </label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="myInput"
						placeholder="Enter password" style="height: 45px" name="password"
						required> <span
						class="glyphicon glyphicon-option-horizontal form-control-feedback"></span><br>
						
				     <i class="bi bi-eye-slash" id="eye"></i>
				     <span id="togglePassword"> Show Password</span>
				        
						
				</div>
			</div>
<br>
			<button type="submit" class="btn btn-success col-sm-4 btn-lg"
				style="margin-left: 230px">
				<span style="font-size: 20px">Login</span>
			</button>
			<br>
			<br>
			<br>
			<button type="button" class="btn btn-outline-info col-sm-4 "
				style="margin-left: 230px">
				<span style="font-size: 18px" data-toggle="modal"
					data-target="#myModal">Forgot password ?</span>
			</button>
		</form>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Forgot password ?</h4>
				</div>
				<form action="forgotPasswordProcess.jsp" method="post">
					<div class="modal-body">
						<div class="form-group">
							<input class="form-control" type="email" name="email"
								placeholder="Enter email" required>
						</div>
					</div>
					<div class="modal-footer">
					    <button type="submit" class="btn btn-primary">Submit</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						
					</div>
				</form>
			</div>

		</div>
	</div>


	<script>
		$(document).ready(function() {
			$('[data-toggle="popover"]').popover();
		});
		
		function myFunction() {
			  var x = document.getElementById("myInput");
			  if (x.type === "password") {
			    x.type = "text";
			    
			  } else {
			    x.type = "password";
			    
			  }
			}
		
		const togglePassword = document.querySelector('#togglePassword');
		const password = document.querySelector('#myInput');
		const eye = document.querySelector('#eye');
		
		togglePassword.addEventListener('click', function (e) {
		    // toggle the type attribute
		    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
		    password.setAttribute('type', type);
		    // toggle the eye / eye slash icon
		    eye.classList.toggle('bi-eye');
		});
	</script>
</body>
</html>