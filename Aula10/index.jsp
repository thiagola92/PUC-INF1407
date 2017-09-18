<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="index.jsp" method="get">
<input type="text" name="nome"/><br/>
<input type="submit"/>
</form>

<jsp:useBean id="testando" class="pacote.BeanExample" scope="session">
Isso só vai aparecer se essa tag for executada<br/>
</jsp:useBean>

<jsp:setProperty property="*" name="testando"/>

O nome é 
<jsp:getProperty property="nome" name="testando"/>

</body>
</html>
