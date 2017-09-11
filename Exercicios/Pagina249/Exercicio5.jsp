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
String session_message = "";

Long time = session.getLastAccessedTime();

if(time == session.getCreationTime())
	session_message = "Esta é a primeira vez que você esta aplicação";
else {
	session_message = time + "";
	application.setAttribute("time", session_message);
}

String application_message = "";

String time_string = (String)application.getAttribute("time");
if(time_string != null)
	time = Long.valueOf(time_string);
else
	time = session.getCreationTime();

if(time == session.getCreationTime())
	application_message = "Esta aplicação nunca foi usada antes";
else {
	application_message = time + "";
}
%>

<%= session_message %><br/>
<%= application_message %><br/>

</body>
</html>