<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
if("Volta".equals(request.getParameter("botao")))
	request.getRequestDispatcher("index.jsp").forward(request, response);
else if("Confirma".equals(request.getParameter("botao")))
	request.getRequestDispatcher("armazena.jsp").forward(request, response);

/* if(request.getParameter("botao").equals("Volta"))
	request.getRequestDispatcher("index.jsp").forward(request, response);
else if(request.getParameter("botao").equals("Confirma"))
	request.getRequestDispatcher("armazena.jsp").forward(request, response); */
%>

</body>
</html>