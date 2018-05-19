<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="banner" class="thiagola92.Banners" scope="application" >
Banner criado agora!<br/>
</jsp:useBean>

<table style="border-style: solid;">
	<tr>
		<td style="border-style: solid;">banner-PUC</td>
		<td style="border-style: solid;">banner-DI</td>
		<td style="border-style: solid;">banner-DAD</td>
		<td style="border-style: solid;">banner-Java</td>
	</tr>
	<tr>
	<c:forEach var="contador" items="${banner.contagem}">
		<td style="border-style: solid;"><c:out value="${contador}"/></td>
	</c:forEach>
	</tr>
</table>

</body>
</html>