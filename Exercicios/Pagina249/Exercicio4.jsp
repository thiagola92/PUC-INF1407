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
String pagina1 = (String)session.getAttribute("pagina1");
String pagina2 = (String)session.getAttribute("pagina2");
String pagina3 = (String)session.getAttribute("pagina3");
String pagina4 = (String)session.getAttribute("pagina4");

if(pagina1 == null)
	pagina1 = "não visitada";

if(pagina2 == null)
	pagina2 = "não visitada";

if(pagina3 == null)
	pagina3 = "não visitada";

if(pagina4 == null)
	pagina4 = "não visitada";

%>

<a href="Exercicio4b.jsp">Pagina1</a> <%=pagina1 %> <br/>
<a href="Exercicio4c.jsp">Pagina2</a> <%=pagina2 %> <br/>
<a href="Exercicio4d.jsp">Pagina3</a> <%=pagina3 %> <br/>
<a href="Exercicio4e.jsp">Pagina4</a> <%=pagina4 %> <br/>

</body>
</html>