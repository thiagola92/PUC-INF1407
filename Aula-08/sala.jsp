<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String nick = request.getParameter("nick");
session.setAttribute("nick", nick);
Cookie cookie = new Cookie("nick", nick);
cookie.setMaxAge(30 * 24 * 60 * 60);	// 30 dias
response.addCookie(cookie);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sala de Chat</title>
</head>

<!-- SIM, eu sei que frameset está ultrapassado!!! -->
<frameset rows="*,50">
	<frame src="conteudo.jsp">
	<frame src="formulario.jsp">
</frameset>

</html>