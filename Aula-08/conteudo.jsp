<%@page import="br.com.meslin.chat.Info"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh" content="5">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Conteúdo</h1>
<table border="1">
	<tr>
		<td>Nick</td><td>Texto</td><td>IP</td>
		<%
			List<Info> lista = (List<Info>)application.getAttribute("lista");	
			if(lista!=null) {
				for(Info info : lista) {
					out.print("<tr>");
					out.print("<td>" + info.getNick() + "</td>");
					out.print("<td>" + info.getTexto() + "</td>");
					out.print("<td>" + info.getIp() + "</td>");
					out.print("</tr>");
				}
			}
		%>
	</tr>
</table>
</body>
</html>