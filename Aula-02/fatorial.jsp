<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%!
long fatorial(long n) {
	if(n==0)
		return 1;
	return n * fatorial(n-1); 
}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
long numero, resultado;
	
numero = 5;
resultado = fatorial(numero);
	
out.print("o <i>fatorial</i> de <b>" + numero + "</b> é " + resultado);
%>
<br/>
o <i>fatorial</i> de <b> <% out.print(numero); %> </b> é <% out.print(resultado); %>
<br/>
o <i>fatorial</i> de <b> <%=numero%> </b> é <%= resultado %>


</body>
</html>
