<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Calculadora</title>
</head>
<body>

<form action="CalculaServlet2" method="post">
<input type="text" name="operando1">
<select name="operacao">
	<option value="+">+</option>
	<option value="-">-</option>
	<option value="/">/</option>
	<option value="x">*</option>
</select>
<input type="text" name="operando2">
<input type="submit" value=" = ">
</form>

</body>
</html>