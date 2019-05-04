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
<h4>Example 1</h4>
<c:forTokens items="www.vinaylogics.com" delims="." var="temp">

	${temp}
	<br>
	
</c:forTokens>

<hr>

<h4> Example2</h4>
<%
	String url = "www.vinaylogics.com";
%>
<c:forTokens items="<%=url %>" delims="." var="temp">

	${temp}
	<br>
	
</c:forTokens>
	
</body>
</html>