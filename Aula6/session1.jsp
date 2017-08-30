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
int g = 0;
%>

</head>
<body>

<h1>Página 1</h1>

<%
synchronized(this) {
	a++;
}
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

/*
this instead of application
synchronized(this) {
	try {
		f = (int)application.getAttribute("f");
	} catch(Exception e) {
		f = 0;
	}
	f++;
	application.setAttribute("f", f);
}
out.print("F = " + f + "<br/>");
*/

// attribute application
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

//attribute application

try {
	synchronized(application.getAttribute("g")) {
		g = (int)application.getAttribute("g");
		g++;
		application.setAttribute("g", g);
	}
} catch(Exception e) {
	application.setAttribute("g", 1);
}
application.setAttribute("g", f);
out.print("G = " + g + "<br/>");
%>

<a href="session2.jsp">Página 2</a><br/>

</body>
</html>
