<%@page import="com.usermanagement.dao.LoginDao"%>  
<jsp:useBean id="obj" class="com.usermanagement.bean.LoginBean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
if(LoginDao.searcExistingEmailForSignUP(obj.getEmail())){
	session.setAttribute("eexist", "Entered email already exists");
	%>  
	<jsp:include page="signUp.jsp"></jsp:include>  
	<% 
}
else{
	int i=LoginDao.insert(obj);  
	if(i>0){  
		session.setAttribute("signup", "You have successfully signed up!");
	response.sendRedirect("viewusers.jsp");  
	}  
	else  
	{  
		session.setAttribute("err", "Some error occurred!");
	%>  
	<jsp:include page="signUp.jsp"></jsp:include>  
	<%  
	}  
}
%>
