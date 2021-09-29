<%@page import="com.usermanagement.dao.LoginDao"%>  
<jsp:useBean id="obj" class="com.usermanagement.bean.LoginBean"/>  
<jsp:setProperty property="*" name="obj"/>  
  
<%  

boolean status = LoginDao.searchEmail(obj.getEmail());
if(status){ 
	session.setAttribute("email", obj.getEmail());
	response.sendRedirect("changePassword.jsp");  
}  
else  
{  
session.setAttribute("een", "Entered email is not present");
%>  
<jsp:include page="index.jsp"></jsp:include>  
<%  
}  
%>  