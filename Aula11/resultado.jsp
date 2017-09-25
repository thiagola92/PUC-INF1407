<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Resultado da Calculadora</title>
</head>
<body>

Usando EL<br/>
R$ ${conta.op1 } ${conta.operador } R$ ${conta.op2 } 
= R$ ${conta.resultado }<br/>

Usando EL com escopo<br/>
R$ ${requestScope.conta.op1 } ${requestScope.conta.operador } R$ ${requestScope.conta.op2 } 
= R$ ${requestScope.conta.resultado }<br/>

Usando formulário<br/>
R$ ${param.operando1 } ${param.operacao }
R$ ${param.operando2 } = R$ ${conta.resultado }<br/>

Fazendo operaçòes<br/>
R$ ${param.operando1 } ${param.operacao }
R$ ${param.operando2 } = R$ ${param.operando1 + param.operando2 }

</body>
</html>