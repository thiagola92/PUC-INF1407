<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Página JSP

<hr>

<%
for(int i=0; i < 5+Math.random()*5; i++) {
%>

Hi my friend :)
<br/>

<%
}
%>

</body>
</html>
