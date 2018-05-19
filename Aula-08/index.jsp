<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
/**
 * Procura e retorna o cookie chamado "nome".
 * Se não achar, returna null
 */
public Cookie pegaCookie(String nome, HttpServletRequest request) {
	Cookie cookies[] = request.getCookies();
	if(cookies!=null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals(nome)) {
				return cookies[i];
			}
		}
	}
	return null;
}
%>
<%
	Cookie cookie = pegaCookie("nick", request);
	if(cookie!=null){
		System.err.println("Nome do cookie: " + cookie.getName());
		System.err.println("Valor do cookie: " + cookie.getValue());
		request.getRequestDispatcher("sala.jsp?nick=" + cookie.getValue()).forward(request, response);
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sala de Chat</title>
</head>
<body>

<h1>Sala de Chat 2017-2</h1>

<form action="sala.jsp" method="get">
	Nick: <input type="text" name="nick">
	<input type="submit" value="Entrar">
</form>
</body>
</html>