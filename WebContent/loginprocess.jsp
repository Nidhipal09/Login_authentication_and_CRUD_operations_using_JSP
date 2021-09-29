<%@page import="com.usermanagement.dao.LoginDao"%>  
<jsp:useBean id="obj" class="com.usermanagement.bean.LoginBean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
boolean status=LoginDao.validate(obj);  
if(status){  
session.setAttribute("login", "You are successfully logged in!");
response.sendRedirect("viewusers.jsp");  
}  
else  
{  
session.setAttribute("loginerror", "Email or password incorrect");	

%>  
<jsp:include page="index.jsp"></jsp:include>  
<%  
}  
%>  