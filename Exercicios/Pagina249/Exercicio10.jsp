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
String nickname = (String)session.getAttribute("nickname");

if(nickname != null)
	request.getRequestDispatcher("Exercicio10b.jsp").forward(request, response);
%>

<form action="Exercicio10b.jsp" method="post">
	Nickname: 
	<input type="text" name="nickname">
	<input type="submit">
</form>

</body>
</html>