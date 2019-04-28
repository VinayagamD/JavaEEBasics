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
	<jsp:useBean id="user" class="com.vinay.beans.User" scope="page"/>
	
	<c:out value="${user.getFirstName()}"/>
	<c:out value="${user.getLastName()}"/>
</body>
</html>