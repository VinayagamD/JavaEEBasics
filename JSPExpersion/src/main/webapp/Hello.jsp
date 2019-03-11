<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hello JSP</title>
</head>
<body>
	<h1>Hello JSP</h1>
	<%! public int x = 22; %>
	<%= "hello" %>
	<%= x %>
	<!--Below is Error Line  -->
	<%-- <%! public int ee = 23 %> --%>
	<%= new Integer(22) %>
	<%= new String("Chaand") %>
	
	<hr>
	
	<%= new java.util.Date() %>
	<br>
	<%= 25*4 %>
	<br>
	<%= 25>4 %>
</body>
</html>