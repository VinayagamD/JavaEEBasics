<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/SiteController?action=loginSubmit" method="post">
	User Name: <input type="text" name="username" placeholder="Enter User Name"> <br>
	Password: <input type="password" name="password" placeholder="Enter Password"> <br>
	<input type="submit" value="Submit">
</form>
</body>
</html>