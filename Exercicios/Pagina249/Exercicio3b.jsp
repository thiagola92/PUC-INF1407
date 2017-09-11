<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<%
String cor = (String)request.getParameter("cor");
if(cor == null)
	session.setAttribute("cor","#000000");
else if(cor.equals("vermelho"))
	session.setAttribute("cor","#FF0000");
else if(cor.equals("verde"))
	session.setAttribute("cor","#00FF00");
else if(cor.equals("azul"))
	session.setAttribute("cor","#0000FF");

request.getRequestDispatcher("Exercicio3.jsp").forward(request, response);
%>

</body>
</html>