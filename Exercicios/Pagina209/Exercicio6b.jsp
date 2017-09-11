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
Float valor1 = new Float(request.getParameter("valor1"));
Float valor2 = new Float(request.getParameter("valor2"));
float resultado = 0;

String operador = request.getParameter("operador");

if("soma".equals(operador))
	resultado = valor1+valor2;
else if("subtracao".equals(operador))
	resultado = valor1-valor2;
else if("multiplicacao".equals(operador))
	resultado = valor1*valor2;
else if("divisao".equals(operador))
	resultado = valor1/valor2;
%>

<%=resultado %>

</body>
</html>