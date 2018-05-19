<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mostra uma pessoa</title>
</head>
<body>

Nome: ${pessoa.nome }<br/>
Endereço: ${pessoa.endereco.logradouro },
	${pessoa.endereco.numero } - 
	${pessoa.endereco.bairro }<br/>
</body>
</html>