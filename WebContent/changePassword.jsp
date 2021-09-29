<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change password</title>
<link rel="icon" href="8.png" type="image/icon type">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
  <link rel="stylesheet" href="Style.css">
  
  <style>
#togglePassword {
    cursor: pointer;
}
</style>
</head>


<body>

<div style="margin-top: 50px;">

	<h4 style="margin-left: 350px;">
	  <%
	  String pns = (String)session.getAttribute("pns");
	  String err = (String)session.getAttribute("err");
	  if(pns!=null){
			 out.println(pns);
			 session.setAttribute("pns", null);
		 }
	  
	  if(err!=null){
			 out.println(err);
			 session.setAttribute("err", null);
		 }
	  %>
	  </h4>
<form class="form-horizontal" action="changePasswordProcess.jsp" method="post">
    <div class="form-group has-primary has-feedback">
      <label class="col-sm-3 control-label" for="npassword" style="font-size: 25px; ">New password : </label>
      <div class="col-sm-5">
        <input type="password" class="form-control" id="npassword" placeholder="Enter new password" style="height: 45px" name="npassword" required>
        <span class="glyphicon glyphicon-option-horizontal form-control-feedback"></span>
      </div>
    </div>
    <div class="form-group has-primary has-feedback">
      <label class="col-sm-3 control-label" for="cpassword" style="font-size: 25px">Confirm password : </label>
      <div class="col-sm-5">
        <input type="password" class="form-control" id="cpassword" placeholder="confirm password" style="height: 45px" name="cpassword" required>
        <span class="glyphicon glyphicon-option-horizontal form-control-feedback"></span>
      </div>
    </div>
    <div style="margin-left: 350px;">
    <i class="bi bi-eye-slash" id="eye"></i>
	<span id="togglePassword"> Show Password</span>
	</div>
	<br>
    <button type="submit" class="btn btn-primary col-sm-2 btn-lg" style="margin-left: 350px;"><span style="font-size: 20px">Submit</span></button><br><br><br>
</form>

<script>
const togglePassword = document.querySelector('#togglePassword');
const npassword = document.querySelector('#npassword');
const cpassword = document.querySelector('#cpassword');
const eye = document.querySelector('#eye');

togglePassword.addEventListener('click', function (e) {
    // toggle the type attribute
    const type = npassword.getAttribute('type') === 'password' ? 'text' : 'password';
    npassword.setAttribute('type', type);
    cpassword.setAttribute('type', type);
    // toggle the eye / eye slash icon
    eye.classList.toggle('bi-eye');
});
</script>
</div>
</body>
</html>