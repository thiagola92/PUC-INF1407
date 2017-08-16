<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Página JSP</title>
</head>
<body>

<%
	for(int i=0; i<5+Math.random()*5; i++) {
%>

Alo mundo!<br/>

<%
	}
%>
 
</body>
</html>
