<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Get Property</title>
</head>
<body>

<!-- Acquiring Bean -->
<jsp:useBean id="user" class="com.vinay.beans.User" scope="request"></jsp:useBean>

<!-- Getting its property from bean -->
FirstName: <jsp:getProperty property="firstName" name="user"/> <br>
LastName: <jsp:getProperty property="lastName" name="user"/>


</body>
</html>