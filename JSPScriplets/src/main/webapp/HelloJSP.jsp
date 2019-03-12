<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hello JSP</title>
</head>
<body>
	<%
		int x = 25;
		out.println(x);
	%>
	
	<%=x %>
	
	<%
		if( x > 25){
			out.println("X is greater than 25");
		}else{
			out.println("X is not greater than 25");
		}
	%>
	<hr>
	<%
		for(int i = 0; i<10;i++){
			out.print("<br>");
			out.print(i);
		}
	%>
</body>
</html>