<%@page import="br.com.thiagola92.cadastro.Erro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String nome = request.getParameter("nome");
String email = request.getParameter("email");
String telefone = request.getParameter("telefone");
if(nome == null || nome.length() == 0) {
	Erro erroNome = new Erro();
	erroNome.setNumero(1234);
	erroNome.setDescricao("Nome invalido - esta em branco");
	erroNome.setAcao("Volta ao formulário e preencha o nome");
	request.setAttribute("erro", erroNome);
	request.getRequestDispatcher("erro.jsp").forward(request, response);
}
if(email == null || email.length() == 0) {
	Erro erroNome = new Erro();
	erroNome.setNumero(1235);
	erroNome.setDescricao("Email invalido - esta em branco");
	erroNome.setAcao("Volta ao formulário e preencha o email");
	request.setAttribute("erro", erroNome);
	request.getRequestDispatcher("erro.jsp").forward(request, response);
}
if(telefone == null || telefone.length() == 0) {
	Erro erroNome = new Erro();
	erroNome.setNumero(1236);
	erroNome.setDescricao("Telefone invalido - esta em branco");
	erroNome.setAcao("Volta ao formulário e preencha o telefone");
	request.setAttribute("erro", erroNome);
	request.getRequestDispatcher("erro.jsp").forward(request, response);
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confere</title>
</head>
<body>

<h1>Confira os dados a seguir</h1>


Nome: <%=request.getParameter("nome") %> <br/>
E-mail: <%=request.getParameter("email") %> <br/>
Telefone: <%=request.getParameter("telefone") %> <br/>

<form action="encaminha.jsp" method="get">

<input type="hidden" name="nome" value="<%= request.getParameter("nome") == null ? "" : request.getParameter("nome") %>"/>
<input type="hidden" name="email" value="<%= request.getParameter("email") == null ? "" : request.getParameter("email") %>"/>
<input type="hidden" name="telefone" value="<%= request.getParameter("telefone") == null ? "" : request.getParameter("telefone") %>"/>

<input type="submit" value="Volta" name="botao">
<input type="submit" value="Confirma" name="botao">
<!-- input type="submit" value="Confirma" -->
</form>

</body>
</html>
