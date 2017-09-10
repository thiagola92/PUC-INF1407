<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
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
Date data = new Date();
Calendar calendario = Calendar.getInstance();
calendario.setTime(data);

String dia_da_semana = "";
int dia = calendario.get(Calendar.DAY_OF_MONTH);
String mes = "";
int ano = calendario.get(Calendar.YEAR);

if(calendario.get(Calendar.DAY_OF_WEEK) == 1)
	dia_da_semana = "Domingo";
else if(calendario.get(Calendar.DAY_OF_WEEK) == 2)
	dia_da_semana = "Segunda";
else if(calendario.get(Calendar.DAY_OF_WEEK) == 3)
	dia_da_semana = "Terça";
else if(calendario.get(Calendar.DAY_OF_WEEK) == 4)
	dia_da_semana = "Quarta";
else if(calendario.get(Calendar.DAY_OF_WEEK) == 5)
	dia_da_semana = "Quinta";
else if(calendario.get(Calendar.DAY_OF_WEEK) == 6)
	dia_da_semana = "Sexta";
else if(calendario.get(Calendar.DAY_OF_WEEK) == 7)
	dia_da_semana = "Sabado";

if(calendario.get(Calendar.MONTH) == 0)
	mes = "Janeiro";
else if(calendario.get(Calendar.MONTH) == 1)
	mes = "Fevereiro";
else if(calendario.get(Calendar.MONTH) == 2)
	mes = "Março";
else if(calendario.get(Calendar.MONTH) == 3)
	mes = "Abril";
else if(calendario.get(Calendar.MONTH) == 4)
	mes = "Maio";
else if(calendario.get(Calendar.MONTH) == 5)
	mes = "Julho";
else if(calendario.get(Calendar.MONTH) == 6)
	mes = "Junho";
else if(calendario.get(Calendar.MONTH) == 7)
	mes = "Agosto";
else if(calendario.get(Calendar.MONTH) == 8)
	mes = "Setembro";
else if(calendario.get(Calendar.MONTH) == 9)
	mes = "Outubro";
else if(calendario.get(Calendar.MONTH) == 10)
	mes = "Novembro";
else if(calendario.get(Calendar.MONTH) == 11)
	mes = "Dezembro";

%>

<%=dia_da_semana%>, <%=dia %> de <%=mes %> de <%=ano %>

</body>
</html>