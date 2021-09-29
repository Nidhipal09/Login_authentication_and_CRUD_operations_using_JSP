<%@page import="com.usermanagement.dao.*"%>  
<jsp:useBean id="u" class="com.usermanagement.bean.User"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
  
<%  
int i=UserDao.save(u);  
if(i>0){  
  session.setAttribute("add", "Data is added successfully!");
}else{  
	session.setAttribute("err", "Some error occurred");
}  

response.sendRedirect("viewusers.jsp");
%>  