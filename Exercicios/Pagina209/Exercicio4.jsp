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
if(request.getParameter("linhas") == null || request.getParameter("colunas") == null ) {
%>
	<form action="Exercicio4.jsp" method="get">
	Linhas: <input type="text" name="linhas"> <br/>
	Colunas: <input type="text" name="colunas"> <br/>
	<input type="submit">
	</form>
<%
} else {
	Integer linhas = new Integer(request.getParameter("linhas"));
	Integer colunas = new Integer(request.getParameter("colunas"));
%>

	<table border="1">
	
	<%
	for(int i=1; i <= linhas; i++) {
		out.print("<tr>");
		for(int j=1; j <= colunas; j++) {
			out.print("<td>" + i + "," + j + "</td>");
		}
		out.print("</tr>");
	}
	%>
	
	</table>
	
<%	
}
%>
</body>
</html>