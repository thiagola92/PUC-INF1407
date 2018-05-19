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
Texto: <%= texto %>
```

---

Nessa aula vimos um exemplo de utilidade disso, podemos decidir para onde um formulário leva as informações dependendo do tipo de informaçãoo.  
Vamos supor que temos 4 páginas: pagina1.jsp, pagina2.jsp, pagina3.jsp e pagina4.jsp  
Se o usuário botar no campo de texto "pagina4" queremos que ele seja levado para página 4
O atributo `action` sozinho não te ajuda a decidir o que fazer com a informação, então a idéia foi utilizar uma página para decidir.  

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
if("pagina4".equals(request.getParameter("exemplo")))
  request.getRequestDispatcher("pagina4.jsp").forward(request, response);
else
  request.getRequestDispatcher("pagina3.jsp").forward(request, response);
%>
```

pagina3
```
<%
String texto = request.getParameter("exemplo");
%>
Texto: <%= texto %>
```

pagina4
```
<h1>Pagina 4</h1>
```

Agora temos um intermediario para tomar decisões.
