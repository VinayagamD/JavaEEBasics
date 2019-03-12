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
<hr>
<!-- Scriptlets can't take access specifiers -->
	<%/*  public */ int x = 10; %>
	<%= x %>
	<br>
	<%! public int y = 33; %>
	<%= y %>
	
	<hr>
	<%!
		String message(){
			return "I Love JSP";
		}
	%>
	<!--Semicolons expression wont accept  -->
	
	<%= message() %>
</body>
</html>