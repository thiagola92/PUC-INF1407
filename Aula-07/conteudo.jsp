<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.com.thiagola92.Info" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Conteudo</h1>

<table border="1">
	<tr>
		<td>Nick</td>
		<td>Text</td>
		<td>Ip</td>
		
		<%
		
			List<Info> lista = (List<Info>)application.getAttribute("lista");
			if(lista != null) {
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
