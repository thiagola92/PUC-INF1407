<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dados do formulário</title>
</head>
<body>

Oi 
<%
String nome;
nome = request.getParameter("campoNome");
out.print(nome);
%>!
<br/>
A sua senha <%= request.getParameter("campoSenha") %>

<%
if(request.getParameter("2") != null) out.print("2ª feira<br/>");
if(request.getParameter("3") != null) out.print("3ª feira<br/>");
if(request.getParameter("4") != null) out.print("4ª feira<br/>");
if(request.getParameter("5") != null) out.print("5ª feira<br/>");
if(request.getParameter("6") != null) out.print("6ª feira<br/>");
%>
<br/>
O usuário vem de <%=request.getParameter("transporte") %>
</body>
</html>
