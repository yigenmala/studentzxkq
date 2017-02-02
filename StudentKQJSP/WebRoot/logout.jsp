<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%
	session.setAttribute("admin",null);
	session.invalidate();
	response.sendRedirect("login.html");
%>