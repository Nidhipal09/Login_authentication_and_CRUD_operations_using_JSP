<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign up</title>
<link rel="icon" href="8.png" type="image/icon type">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="Style.css">
</head>


<body>
  
	<div style="margin-top: 50px;">
	<h4 style="margin-left: 350px;">
	  <%
	  String ee = (String)session.getAttribute("eexist");
	  String err = (String)session.getAttribute("err");
	  if(ee!=null){
			 out.println(ee);
			 session.setAttribute("eexist", null);
		 }
	  
	  if(err!=null){
			 out.println(err);
			 session.setAttribute("err", null);
		 }
	  %>
    </h4>
		<form class="form-horizontal" action="signUp_process.jsp"
			method="post">
			<div class="form-group has-primary has-feedback">
				<label class="col-sm-3 control-label" for="inputSuccess"
					style="font-size: 25px;">Email : </label>
				<div class="col-sm-5">
					<input type="email" class="form-control" id="inputSuccess"
						placeholder="Enter email" style="height: 45px" name="email" required>
					<span class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
			</div>
			<div class="form-group has-primary has-feedback">
				<label class="col-sm-3 control-label" for="inputWarning"
					style="font-size: 25px">Password : </label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="inputWarning"
						placeholder="Enter password" style="height: 45px" name="password" required>
					<span
						class="glyphicon glyphicon-option-horizontal form-control-feedback"></span>
				</div>
			</div>

			<button type="submit" class="btn btn-primary col-sm-2 btn-lg"
				style="margin-left: 360px;">
				<span style="font-size: 20px">Sign up</span>
			</button>
			<br>
			<br>
			<br>
		</form>
	</div>

	</form>
</body>
</html>