<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSTL Demo</title>
</head>
<body>
<%
	String[] names = new String[3];
	names[0] = "Vinay";
	names[1] = "Ganesh";
	names[2] = "Satish";
%>
	
	<c:forEach items="<%=names %>" var="name">
		${ name }
		<br>
		<br>
	</c:forEach>
	
</body>
</html>