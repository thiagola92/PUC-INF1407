<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%
session.setAttribute("nick", request.getParameter("nick"));
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sala de Chat</title>
</head>

<!--  frameset é ultrapassado, é feio usar isso mas fodasse -->
<frameset rows="*,50">
	<frame src="conteudo.jsp">
	<frame src="formulario.jsp">
</frameset>

</html>