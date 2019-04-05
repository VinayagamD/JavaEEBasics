<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Set Property</title>
</head>
<body>

<jsp:useBean id="user" class="com.vinay.beans.User" scope="request"></jsp:useBean>
FirstName: <jsp:getProperty property="firstName" name="user"/> <br>
LastName: <jsp:getProperty property="lastName" name="user"/>

<jsp:setProperty property="firstName" name="user" value="Chand"/> <br>
<jsp:setProperty property="lastName" name="user" value="Sukumar"/><br>

Values have been set.<br>
FirstName: <jsp:getProperty property="firstName" name="user"/> <br>
LastName: <jsp:getProperty property="lastName" name="user"/>
</body>
</html>