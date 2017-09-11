<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.com.thiagola92.Info" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
String texto = request.getParameter("text");
if(texto != null && texto.length() > 0) {
	Info info = new Info();
	info.setTexto(texto);
	info.setNick((String)session.getAttribute("nick"));
	info.setIp(request.getRemoteHost());
	
	List<Info> lista;
	lista = (List<Info>)application.getAttribute("lista");
	if(lista == null)
		lista = new ArrayList<Info>();
	lista.add(info);
	application.setAttribute("lista", lista);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="formulario.jsp" method="get">
	Fala <%=session.getAttribute("nick") %>:
	<input type="text" name="text">
	<input type="submit" value="Vai">
</form>

</body>
</html>
