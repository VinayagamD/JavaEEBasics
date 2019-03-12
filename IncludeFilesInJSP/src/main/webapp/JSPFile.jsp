<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP File</title>
</head>
<body>
<!--For adding static file content  -->
<%@ include file="file1.txt" %>
<br>
<!--For adding Dynamic Content  -->
<jsp:include page="file2.txt"/>
</body>
</html>