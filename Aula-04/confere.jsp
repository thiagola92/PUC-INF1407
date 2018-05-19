<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
