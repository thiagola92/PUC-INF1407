<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String login = (String)session.getAttribute("login");
String senha = (String)session.getAttribute("senha");

if(login == null || senha == null) {
%>
	Conteudo restrito, logue para ver:<br/>
	<form action="Exercicio6b.jsp" method="post">
		<input type="text" name="login"><br/>
		<input type="password" name="senha"><br/>
		<input type="submit">
	</form>

<%
} else {
	out.print("Conteudo");
}
%>

</body>
</html>