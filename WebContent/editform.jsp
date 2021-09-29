


<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form</title>
<link rel="icon" href="8.png" type="image/icon type">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<link rel="stylesheet" href="Style.css">
</head>

<%  
String id=request.getParameter("id");  
User u=UserDao.getRecordById(Integer.parseInt(id));
boolean g=true;
if(u.getGender().equals("female")){
	g=false;
}
int n = u.getDuration();
%> 


<body onload="fun('<%= g%>')">

<%@page import="com.usermanagement.dao.*,com.usermanagement.bean.*"%>  
  


<div style="margin-top: 50px;">
<form class="form-horizontal" action="edituser.jsp" method="post">
   <div class="form-group has-primary has-feedback">
      <label class="col-sm-3 control-label" for="inputSuccess" style="font-size: 25px; ">ID : </label>
      <div class="col-sm-5">
        <input type="text" class="form-control" id="inputSuccess" style="height: 45px" name="id" value="<%= u.getId()%>" readonly="readonly">
        
      </div>
    </div>
    
    <div class="form-group has-primary has-feedback">
      <label class="col-sm-3 control-label" for="inputSuccess" style="font-size: 25px; ">Name : </label>
      <div class="col-sm-5">
        <input type="text" class="form-control" id="inputSuccess" style="height: 45px" name="name" value="<%= u.getName()%>" required>
        
      </div>
    </div>
    
    <div class="form-group has-primary has-feedback">
      <label class="col-sm-3 control-label" for="inputSuccess" style="font-size: 25px; ">Gender : </label>
      <div class="col-sm-5">
      
        <input type="radio" id="male" style="width: 30px; height: 30px;" name="gender" value="male">Male<br>
        <input type="radio" id="female" style="width: 30px; height: 30px;" name="gender" value="female"> Female
        
       
      </div>
    </div>
    
    <div class="form-group has-primary has-feedback">
      <label class="col-sm-3 control-label" for="inputSuccess" style="font-size: 25px; ">Course : </label>
      <div class="col-sm-5">
        <input type="text" class="form-control" id="inputSuccess" style="height: 45px" name="course" value="<%= u.getCourse()%>" required>
        
      </div>
    </div>
    
    
    
    <div class="form-group has-primary has-feedback">
      <label class="col-sm-3 control-label" for="myDropdown" style="font-size: 25px; ">Duration (in months): </label>
      <div class="col-sm-5">
      
        <select class="form-control" id="myDropdown" name="duration" style="height: 45px"  required>  
		<option>2</option>  
		<option>3</option>  
		<option>6</option>  
		<option selected="selected">9</option>   
		</select> 
      </div>
    </div>
    
    <button type="submit" class="btn btn-primary col-sm-2 btn-lg" style="margin-left: 360px;"><span style="font-size: 20px">Edit</span></button><br><br><br>
</form>
</div>

<script>
function fun(g) {
	if(g==true){
		  document.getElementById("male").checked = true;
		  
	  }
	  else{
		  document.getElementById("female").checked = true;
		  
	  }
}

</script>

</body>
</html>