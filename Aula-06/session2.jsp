<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>

<%!
int a = 0;
%>

<%
int b = 0;
int c;
int d;
int f;
%>

</head>
<body>

<h1>Página 2</h1>

<%
a++;
b++;
out.print("A = " + a + "<br/>");
out.print("B = " + b + "<br/>");

// request
try {
	c = (int)request.getAttribute("c");
} catch(Exception e) {
	c = 0;
}
c++;
request.setAttribute("c", c);
out.print("C = " + c + "<br/>");

// session
try {
	d = (int)session.getAttribute("d");
} catch(Exception e) {
	d = 0;
}
d++;
session.setAttribute("d", d);
out.print("D = " + d + "<br/>");

//attribute application
synchronized(application) {
	try {
		f = (int)application.getAttribute("f");
	} catch(Exception e) {
		f = 0;
	}
	f++;
	application.setAttribute("f", f);
}
out.print("F = " + f + "<br/>");
%>

</body>
</html>
