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
String black_square="<td style='background-color: black;width: 25px; height: 25px;'></td>";
String white_square="<td style='background-color: white;width: 25px; height: 25px;'></td>";
%>

<table>

<%
for(int lines=0; lines < 8; lines++) {
	
	out.print("<tr>");
	
	for(int columns=0; columns < 8; columns++) {
		
		if((lines+columns) % 2 == 1)
			out.print(black_square);
		else
			out.print(white_square);
	}
	
	out.print("</tr>");
	
}
%>

</table>

</body>
</html>
