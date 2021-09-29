<%@page import="com.usermanagement.dao.*"%>  
<jsp:useBean id="u" class="com.usermanagement.bean.User"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  
int i=UserDao.update(u);  
session.setAttribute("edituser", "Data is updated successfully!");
response.sendRedirect("viewusers.jsp");  
%>  