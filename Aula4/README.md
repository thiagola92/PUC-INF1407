# Aula 4
Essa aula não ensinou muitos conceitos novos, foi mais sobre usar tudo aprendido até agora.  

## Request e Response
A única coisa nova que vimos foi sobre repassar request, ou seja, uma página recebe um request e faz algo com ele, depois passa para a próxima página para ela fazer algo com ele.   
Isso é passado usando  
`forward(request, response)`  
Note como você passa o request **e** response de uma página para outra.  

pagina1
```JSP
<form action="pagina2.jsp" method="post">
  <input type="text" name="exemplo">
  <input type="submit">
</form>
```

pagina2
```JSP
<%
request.getRequestDispatcher("pagina3.jsp").forward(request, response);
%>
```

pagina3
```
<%
String texto = request.getParameter("exemplo");
%>
```
