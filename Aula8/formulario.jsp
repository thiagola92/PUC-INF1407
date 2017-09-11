<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.com.meslin.chat.Info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String texto = request.getParameter("texto");
if(texto!=null && texto.length()>0) {
	// criação da entrada da lista
	Info info = new Info();
	info.setNick((String)session.getAttribute("nick"));
	info.setTexto(texto);
	info.setIp(request.getRemoteHost());
	
	// adiciono a nova entrada à lista
	List<Info> lista;
	lista = (List<Info>)application.getAttribute("lista");
	// verifico se a lista já existe, 
	// se não existir, crio localmente o objeto para depois incluir como atributo
	if(lista==null) lista = new ArrayList<Info>();
	lista.add(info);
	application.setAttribute("lista", lista);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="formulario.jsp" method="get">
Fala, <%=session.getAttribute("nick") %>:
<input type="text" name="texto">
<input type="submit" value="Vai!">
</form>
</body>
</html>