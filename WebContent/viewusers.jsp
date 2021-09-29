<!DOCTYPE html>  
  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<title>View Users</title>  
  <link rel="icon" href="8.png" type="image/icon type">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="Style.css">
  
  <style>
  h1{
    font-family: "Chalkduster", fantasy;
  }
  
  #myInput {
  width: 1210px;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}


#myTable {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
  background-color: white;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

tr:hover {
  background-color: #f1f1f1;
}

tr.header{
  background-color: #ffff80;
}


th {
    cursor: pointer;
}

</style>
</head>

<%  
List<User> list=UserDao.getAllRecords();  
request.setAttribute("list",list); 
%>  


  
<body>  
  
<%@page import="com.usermanagement.dao.UserDao,com.usermanagement.bean.*,java.util.*"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<h1 style="display:inline;">Users List</h1> 

<img src="10.png" style="display:inline; margin-left: 1080px; width: 30px; height: 30px;">
<h2 style="display:inline; margin-top: 10px; "><a href="logoutprocess.jsp">Logout</a></h2>


<h4>
 <%
 String l = (String)session.getAttribute("login");
 String s = (String)session.getAttribute("signup");
 String a = (String)session.getAttribute("add");
 String d = (String)session.getAttribute("deleteuser");
 String e = (String)session.getAttribute("edituser");
 String err = (String)session.getAttribute("err");
 
 
 if(l!=null){
	 out.println(l);
	 session.setAttribute("login", null);
 }

 if(s!=null){
	 out.println(s);
	 session.setAttribute("signup", null);
 }
 
 if(a!=null){
	 out.println(a);
	 session.setAttribute("add", null);
 }

 if(d!=null){
	 out.println(d);
	 session.setAttribute("deleteuser", null);
 }
 
 if(e!=null){
	 out.println(e);
	 session.setAttribute("edituser", null);
 }
 
 if(err!=null){
	 out.println(err);
	 session.setAttribute("err", null);
 }
 %>
</h4>

<br><br>

<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
<button type="button" class="btn btn-outline-info btn-lg"><span style="font-size: 18px"><a href="adduserform.jsp">Add new user</a></span></button>

<table id="myTable">
  <tr class="header">
<th style="width:10%;">Id</th>
<th style="width:20%;" onclick="sortTable('name')" >Name</th>
<th style="width:20%;" onclick="sortTable('gender')">Gender</th>
<th style="width:20%;" onclick="sortTable('course')" >Course</th>  
<th style="width:25%;" onclick="sortTable('duration')" >Duration (in months)</th>
<th>Edit</th>
<th>Delete</th>
</tr> 
 
<c:forEach items="${list}" var="u">  
<tr>
<td>${u.getId()}</td>
<td>${u.getName()}</td> 
<td>${u.getGender()}</td>
<td>${u.getCourse()}</td>
<td>${u.getDuration()}</td>  

<td><a href="editform.jsp?id=${u.getId()}" >Edit</a></td>
<td><a href="deleteuser.jsp?id=${u.getId()}" >Delete</a></td>
</tr>
</c:forEach>  
</table>  
  
    
 <script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}

function sortTable(s) {
	  var table, rows, switching, i, x, y, shouldSwitch;
	  table = document.getElementById("myTable");
	  switching = true;
	  /*Make a loop that will continue until
	  no switching has been done:*/
	  while (switching) {
	    //start by saying: no switching is done:
	    switching = false;
	    rows = table.rows;
	    /*Loop through all table rows (except the
	    first, which contains table headers):*/
	    for (i = 1; i < (rows.length - 1); i++) {
	      //start by saying there should be no switching:
	      shouldSwitch = false;
	      /*Get the two elements you want to compare,
	      one from current row and one from the next:*/
	      if(s=="name"){
	    	  x = rows[i].getElementsByTagName("TD")[1];
		      y = rows[i + 1].getElementsByTagName("TD")[1];
	      }
	      else if(s=="gender"){
	    	  x = rows[i].getElementsByTagName("TD")[2];
		      y = rows[i + 1].getElementsByTagName("TD")[2];
	      }
	      else if(s=="course"){
	    	  x = rows[i].getElementsByTagName("TD")[3];
		      y = rows[i + 1].getElementsByTagName("TD")[3];
	      }
	      else if(s=="duration"){
	    	  x = rows[i].getElementsByTagName("TD")[4];
		      y = rows[i + 1].getElementsByTagName("TD")[4];
	      }
	      
	      //check if the two rows should switch place:
	      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
	        //if so, mark as a switch and break the loop:
	        shouldSwitch = true;
	        break;
	      }
	    }
	    if (shouldSwitch) {
	      /*If a switch has been marked, make the switch
	      and mark that a switch has been done:*/
	      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
	      switching = true;
	    }
	  }
	}
	
function login(s) {
	alert(s);
}
</script>
</body>  
</html>