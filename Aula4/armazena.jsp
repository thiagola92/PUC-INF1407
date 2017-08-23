<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dados Armazenados</title>
</head>
<body>
Os seguintes dados foram armazenados:
<p>

Nome: <%=request.getParameter("nome") %> <br/>
E-mail: <%=request.getParameter("email") %> <br/>
Telefone: <%=request.getParameter("telefone") %> <br/>

</p>

Para fazer um novo cadastro clique <a href="index.jsp">aqui</a>

</body>
</html>
