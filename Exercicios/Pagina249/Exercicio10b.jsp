<%@page import="java.util.ArrayList"%>
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
String nickname;

if((String)session.getAttribute("nickname") == null) {
	if(request.getParameter("nickname") == null)
		request.getRequestDispatcher("Exercicio10.jsp").forward(request, response);

	nickname = request.getParameter("nickname");
	session.setAttribute("nickname", nickname);
}

nickname = (String)session.getAttribute("nickname");
%>

<%

ArrayList<String> lista_nicknames = (ArrayList<String>)application.getAttribute("lista_nicknames");
ArrayList<String> lista_mensagens = (ArrayList<String>)application.getAttribute("lista_mensagens");

if(lista_nicknames != null && lista_mensagens != null) {
	
	for(int i=0; i < lista_nicknames.size() && i < 10; i++) {
		out.print(lista_nicknames.get(i) + ": " + lista_mensagens.get(i) + "<br/>");
	}
	
}

%>

<hr/>

<form action="Exercicio10c.jsp" method="post">
	Fale <%=nickname %>
	<input type="hidden" value="<%=nickname %>" name="nickname">
	<input type="text" name="mensagem">
	<input type="submit">
</form>

</body>
</html>