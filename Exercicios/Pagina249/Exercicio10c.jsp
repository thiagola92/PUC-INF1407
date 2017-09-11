<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<hr/>

<%
String nickname = request.getParameter("nickname");
String mensagem = request.getParameter("mensagem");

ArrayList<String> lista_nicknames = (ArrayList<String>)application.getAttribute("lista_nicknames");
ArrayList<String> lista_mensagens = (ArrayList<String>)application.getAttribute("lista_mensagens");

if(lista_nicknames == null)
	lista_nicknames = new ArrayList<String>();
lista_nicknames.add(nickname);

if(lista_mensagens == null)
	lista_mensagens = new ArrayList<String>();
lista_mensagens.add(mensagem);

application.setAttribute("lista_nicknames", lista_nicknames);
application.setAttribute("lista_mensagens", lista_mensagens);

request.getRequestDispatcher("Exercicio10b.jsp").forward(request, response);

%>

<%=nickname %>: <%=mensagem %>
</body>
</html>