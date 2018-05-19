<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%!
int nVezes = 0;
%>

<%
synchronized(this){
	nVezes++;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Compartilhamento</title>
</head>
<body>

Essa página foi acessada <b><%=nVezes%></b> vez(es) por todos usuários

</body>
</html>
