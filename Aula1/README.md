# Aula 1

**Usuário**: pessoa fisica  
**Cliente**: computador do usuário  
**Server**: computador rodando o programa principal  

**Lado cliente**: Cliente apenas roda HTML e Javascript  
**Lado server**: Server vai rodar JSP e Servlet  

**Cookie**: é nada mais que um nome e um valor associado a esse nome.  

**src**: Java  
**WebContent**: HTML, Javascript e JSP  
**WebContent/web.xml**: Uma lista de prioridade para ser página inicial do site  

---

Após qualquer alteração em páginas **HTML** ou **JSP**, você não precisa compilar novamente o server, basta atualizar a página. 

Você pode rodar uma página especifica clicando com  
Botão direito na página > Run As > Run on Server  
Se você não fizer isso no projeto, irá tentar rodar uma das páginas padrões  

Páginas **JSP** são criadas com o referêncial para página **HTML 4**  
```HTML
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
```
Você pode alterar para o modelo do **HTML5**  
```HTML
<!DOCTYPE html>
```
[por que a referência do **HTML5** é mais curta?](https://www.w3schools.com/tags/tag_doctype.asp)


---

Páginas JSP são páginas rodadas por Java, mas que aparentam ser páginas HTML.  
Tudo escrito fora de `<%` e `%>` é transformado em uma String que é mandada para o usuário normalmente.    
```JSP
<html>
  <body>
    <b>Hi, my name is bob and i like ice cream.</b>
    <br/>
    <i>Hi, my name is jeff and i don't care.</i>
  </body>
</html>
```
JSP traduz para Java e transformar esse código JSP em
```JSP
out.write("<html>
  <body>
    <b>Hi, my name is bob and i like ice cream.</b>
    <br/>
    <i>Hi, my name is jeff and i don't care.</i>
  </body>
</html>");
```

---

E tudo dentro de `<%` e `%>` é mantido como código (e você remove o `<%` e `%>` porque não fazem parte de Java).    
```JSP
<% out.write("<b>Hi, my name is bob and i like ice cream.</b>"); %>
<% out.write("<br/>"); %>
<% out.write("<i>Hi, my name is jeff and i don't care.</i>"); %>
```
JSP traduz para Java e transforma esse código JSP em
```JSP
out.write("<b>Hi, my name is bob and i like ice cream.</b>");
out.write("<br/>");
out.write("<i>Hi, my name is jeff and i don't care.</i>");
```

---

Um exemplo mais complexo seria  
```JSP
<% if(2+2==4) { %>
<b>I know Math</b>
<% } %>
```
Seguindo os exemplos anteriores, tudo fora de `<%` e `%>` é transformado em `out.write("");` 
```JSP
<% if(2+2==4) { %>
out.write("<b>I know Math</b>");
<% } %>
``` 
E tudo dentro de `<%` e `%>` se mantem como código Java para rodar.
```Java
if(2+2==4) {
out.write("<b>I know Math</b>");
}
``` 
