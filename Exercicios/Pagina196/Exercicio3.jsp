<%@page import="java.util.Random"%>
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

<%!
ArrayList<String> perguntas = new ArrayList<String>();
ArrayList<String> respostas = new ArrayList<String>();
Random random = new Random();
%>

<%
perguntas.add(0, "você gosta de cachorro?");
perguntas.add(1, "você gosta de gato?");
perguntas.add(2, "você gosta de rato?");

respostas.add(0, "sim");
respostas.add(1, "não");
respostas.add(2, "talvez");

int pergunta = Math.abs(random.nextInt()%3);
int resposta = Math.abs(random.nextInt()%3);
%>

<%=perguntas.get(pergunta) %><br/>
<%=respostas.get(resposta) %>

</body>
</html>