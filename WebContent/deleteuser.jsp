<%@page import="com.usermanagement.dao.*"%>  
<jsp:useBean id="u" class="com.usermanagement.bean.User"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  
UserDao.delete(u); 
session.setAttribute("deleteuser", "Data is deleted successfully!");
response.sendRedirect("viewusers.jsp");  
%>  