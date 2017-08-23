<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Formulario de cadastro</title>
</head>
<body>

<h1>Formulário de cadastro de pessoa física</h1>

<form action="confere.jsp" method="get">

Nome: <input type="text" name="nome" value="<%= request.getParameter("nome") == null ? "" : request.getParameter("nome") %>"/>  <br/>
E-mail: <input type="text" name="email" value="<%= request.getParameter("email") == null ? "" : request.getParameter("email") %>"/> <br/>
Telefone: <input type="text" name="telefone" value="<%= request.getParameter("telefone") == null ? "" : request.getParameter("telefone") %>"/> <br/>
<input type="submit" value="Cadastra"/>

</form>

</body>
</html>
