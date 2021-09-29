


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add user</title>
<link rel="icon" href="8.png" type="image/icon type">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
 <link rel="stylesheet" href="Style.css">
</head>
<body>


<div style="margin-top: 50px;">
<form class="form-horizontal" action="adduser.jsp" method="post">
   
    
    <div class="form-group has-primary has-feedback">
      <label class="col-sm-3 control-label" for="inputSuccess" style="font-size: 25px; ">Name : </label>
      <div class="col-sm-5">
        <input type="name" class="form-control" id="inputSuccess" style="height: 45px" name="name" placeholder="Enter name" required>
        
      </div>
    </div>
    
    <div class="form-group has-primary has-feedback">
      <label class="col-sm-3 control-label" for="inputSuccess" style="font-size: 25px; ">Gender : </label>
      <div class="col-sm-5">
        <input type="radio" style="width: 30px; height: 30px;" name="gender" value="male" required> Male<br>
        <input type="radio" style="width: 30px; height: 30px;" name="gender" value="female"> Female
      </div>
    </div>
    
    <div class="form-group has-primary has-feedback">
      <label class="col-sm-3 control-label" for="inputSuccess" style="font-size: 25px; ">Course : </label>
      <div class="col-sm-5">
        <input type="text" class="form-control" id="inputSuccess" style="height: 45px" name="course" placeholder="Enter course name" required>
        
      </div>
    </div>
    
    
    
    <div class="form-group has-primary has-feedback">
      <label class="col-sm-3 control-label" for="myDropdown" style="font-size: 25px; ">Duration  (in months): </label>
      <div class="col-sm-5">
      
        <select class="form-control" id="myDropdown" style="height: 45px" name="duration" required>  
        <option>2</option>  
		<option>3</option>  
		<option>6</option>  
		<option>9</option>   
		</select> 
      </div>
    </div>
    
    <button type="submit" class="btn btn-primary col-sm-2 btn-lg" style="margin-left: 360px;"><span style="font-size: 20px">Add</span></button><br><br><br>
</form>
</div>

<script>
document.getElementById("myDropdown").selectedIndex = -1;
</script>
</body>
</html>