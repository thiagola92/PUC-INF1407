<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<table>

<%
Float celsius_inicial = new Float(request.getParameter("inicial"));
Float celsius_final = new Float(request.getParameter("final"));
Float incremento = new Float(request.getParameter("incremento"));

for(float celsius = celsius_inicial; celsius <= celsius_final; celsius += incremento) {
%>
	<tr>
	
	<td><%=celsius %></td>
	<td><%=1.8*celsius +32 %></td>
	
	</tr>

<%
}
%>

</table>


</body>
</html>