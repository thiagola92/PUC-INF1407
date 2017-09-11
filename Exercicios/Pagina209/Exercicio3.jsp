<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
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
if(request.getParameter("nome") == null) {
%>

<form action="Exercicio3.jsp" method="get">
Nome: <input type="text" name="nome"/><br/>
<input type="submit">
</form>

<%
} else {
	Calendar calendario = Calendar.getInstance();
	Date data = new Date();
	calendario.setTime(data);
	
	int hora = calendario.get(Calendar.HOUR_OF_DAY);
	String saudacao;
	if(hora < 12)
		saudacao = "Bom dia";
	else if (hora < 18)
		saudacao = "Boa tarde";
	else
		saudacao = "Boa noite";
%>

<%=saudacao %>, <%=request.getParameter("nome") %>

<%
}
%>

</body>
</html>