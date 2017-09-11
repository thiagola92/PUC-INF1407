<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<%
String cor = (String)session.getAttribute("cor");
if(cor == null)
	cor = "#FFFFFF";
%>

<body bgcolor="<%=cor%>">

<form action="Exercicio3b.jsp" method="post">
<select name="cor">
  <option value="vermelho">vermelhor</option>
  <option value="verde">verde</option>
  <option value="azul">azul</option>
</select>
<input type="submit">
</form>

</body>
</html>