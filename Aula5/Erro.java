<%@page import="br.com.thiagola92.cadastro.Erro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1 style="color:#FF0000">Deu erro</h1>

<%
Erro erro;
try {
	erro = (Erro)request.getAttribute("erro");
	if(erro == null)
		throw new Exception();
} catch(Exception e) {
	erro = new Erro();
}

String nome = request.getParameter("nome");
String email = request.getParameter("email");
String telefone = request.getParameter("telefone");
%>
Erro #<%= erro.getNumero() %> <br/>
Descrição: #<%= erro.getDescricao() %> <br/>
Ação: #<%= erro.getAcao() %> <br/>
<br/>
Para voltar ao inicio clique <a href="index.jsp?nome=<%=nome%>&email=<%=email%>&telefone=<%=telefone%>">aqui</a> <br/>
Para voltar ao inicio clique <a href="index.jsp?nome=<%=response.encodeURL(nome)%>&email=<%=response.encodeURL(email)%>&telefone=<%=response.encodeURL(telefone)%>">aqui</a> <br/>
</body>
</html>
