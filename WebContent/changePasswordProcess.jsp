<%@page import="com.usermanagement.dao.LoginDao"%>  
<jsp:useBean id="obj" class="com.usermanagement.bean.LoginBean"/>  
<jsp:setProperty property="*" name="obj"/>  
  
<%  

if(obj.getNpassword().equals(obj.getCpassword())){
	String eemail = session.getAttribute("email").toString();
	int i=LoginDao.update(obj.getNpassword(), eemail);
	if(i>0){
		session.setAttribute("passwordchanged", "Password is changed successfully!");
		response.sendRedirect("index.jsp");
	}
	else{
		session.setAttribute("err", "Some error occurred");
		%>  
		<jsp:include page="changePassword.jsp"></jsp:include>  
		<% 
	}
}
else  
{  
session.setAttribute("pns", "Passwords are not same");
%>  
<jsp:include page="changePassword.jsp"></jsp:include>  
<%  
}  
%>  