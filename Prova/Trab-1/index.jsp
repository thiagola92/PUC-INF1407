<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String expressao = request.getParameter("expressao");
String operador = request.getParameter("operacao");

Float resultado;
try {
	resultado = new Float(request.getParameter("resultado"));
} catch(Exception e) {
	resultado = new Float(0);
}

Float valor;
try {
	valor = new Float(request.getParameter("op1"));
} catch(Exception e) {
	valor = new Float(0);
}

if(operador == null)
	operador = "";

if(operador.equals("+"))
	resultado += valor;
else if(operador.equals("-"))
	resultado -= valor;
else if(operador.equals("*"))
	resultado *= valor;
else if(operador.equals("/"))
	resultado /= valor;
else if(operador.equals("="))
	expressao = resultado + "";

if(expressao == null || operador.equals("="))
	expressao = "";
else
	expressao = expressao + valor + operador;

%>

<%=expressao %>
<br/>

<form action="index.jsp" method="get">
<input type='hidden' name="expressao" value="<%=expressao%>">
<input type='text' name='op1' value="<%=resultado%>"/><br/>
<p>
<input type='submit' name='operacao' value='+' />
<input type='submit' name='operacao' value='-' /><br/>
<input type='submit' name='operacao' value='*' />
<input type='submit' name='operacao' value='/' /><br/>
<input type='submit' name='operacao' value='=' />
<%
if(operador.equals("="))
	resultado = new Float(0);
%>
<input type='hidden' name="resultado" value="<%=resultado%>">
<p/>
</form>

</body>
</html>