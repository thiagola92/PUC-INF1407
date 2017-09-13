<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="Calcula" method="get">
<input type="text" name="operando1">
<select name="operacao">
	<option value="+">+</option>
	<option value="-">-</option>
	<option value="/">/</option>
	<option value="x">*</option>
</select>
<input type="text" name="operando2">
<input type="submit" value="=">
</form>
	
<form action="../Calcula2" method="get">
<input type="text" name="operando1">
<select name="operacao">
	<option value="+">+</option>
	<option value="-">-</option>
	<option value="/">/</option>
	<option value="x">*</option>
</select>
<input type="text" name="operando2">
<input type="submit" value="=">
</form>

</body>
</html>
