<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
// Tudo dentro daqui é codigo java

for(int i=0; i<5+Math.random()*5; i++) {
%>
<!-- Agora é codigo html -->
Alo mundo!<br/>
<%
}
%>

Não precisa rodar de novo o server, basta salvar o jsp e 
</body>
</html>
