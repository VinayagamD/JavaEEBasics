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
	<p>Example 1</p>
	<c:forEach var="i" begin="1" end="10">
		${ i }
		<br>
	</c:forEach>
	<hr>
	<p>Example 2</p>
	<c:forEach var="i" begin="0" end="30" step="3">
		${ i }
		<br>
	</c:forEach>
</body>
</html>