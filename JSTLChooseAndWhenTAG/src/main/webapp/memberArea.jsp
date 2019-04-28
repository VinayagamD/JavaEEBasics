<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Member Area</title>
</head>
<body>
<%
	String username = null,sessionId = null;
	if(request.getSession().getAttribute("username") == null){
		response.sendRedirect(request.getContextPath()+"/SiteController?action=login");
	}else{
		username = request.getSession().getAttribute("username").toString();
		sessionId = request.getSession().getId();
	}
%>
UserName : <%=username %> <br>
Current Session : <%=sessionId %> <br>
<form action="<%=request.getContextPath()%>/MemberAreaController" method="get">
	<input type="hidden" name="action"  value="destroy">
	<input type="submit" value="Logout">
</form>
</body>
</html>