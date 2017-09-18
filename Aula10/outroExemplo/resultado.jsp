<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="conta" class="pacote.CalculaBean" scope="request">
<h2>Alguma coisa deu errado, esse bem n era pra ser criado aqui</h2>
	<jsp:setProperty property="op1" name="conta" value="0"/>
	<jsp:setProperty property="operador" name="conta" value="+"/>
	<jsp:setProperty property="op2" name="conta" value="0"/>
	<jsp:setProperty property="resultado" name="conta" value="0"/>
</jsp:useBean>

<jsp:getProperty property="op1" name="conta"/>
<jsp:getProperty property="operador" name="conta"/>
<jsp:getProperty property="op2" name="conta"/>
=
<jsp:getProperty property="resultado" name="conta"/>

</body>
</html>
