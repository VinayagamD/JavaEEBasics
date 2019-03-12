<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP File</title>
</head>
<body>
<%-- <% out.print(new java.util.Date()); %> --%>
<%@ page import="java.util.Date" %>

<% out.print(new Date()); %>
<br>
<%@ page import="com.vinay.UserDefined" %>

<% out.print(new UserDefined().demo()); %>
</body>
</html>