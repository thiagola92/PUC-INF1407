# Aula 2
Existe mais que uma tag para acessar conteúdo Java pelos arquivos JSP.  
Mas antes, quero que imagine toda página JSP como um método em Java.  

```JSP
<%
if(2+2 == 4) {
%>
  <b>Olá mundo!</b>
<%
}
%>
```
Na aula passada falei para imaginar isso como
```Java
if(2+2 == 4) {
  out.write("<b>Olá mundo!</b>");
}
```
Agora imagine que isso tudo ocorre dentro de uma função
```Java
public void functionName() {
  if(2+2 == 4) {
    out.write("<b>Olá mundo!</b>");
  }
}
```
Que por sua vez está dentro de uma classe
```Java
class ClasseName {
  public void functionName() {
    if(2+2 == 4) {
      out.write("<b>Olá mundo!</b>");
    }
  }
}
```

---

## Tags
Além da tag básica da ultima aula, que permite acessar Java, veremos outras que ajudam/facilitam mais ainda durante a programação de Java na página JSP.  

**<%= %>**: Transforma o conteúdo dentro em uma string, apenas se possível.  
Vamos supor que você queira mostrar na tela o resultado de algum calculo feito em Java.  
Existe muitas maneiras de fazer.  

**1)**  
```JSP
<%
out.write("A soma de 2+2 é igual a " + (2+2));
%>
```
**2)**
```JSP
A soma de 2+2 é igual a <% out.write(2+2); %>
```

Ambas as maneiras são um tanto quanto chatas de escrever, então JSP tem uma maneira mais simples de exibir um valor.  
```JSP
A soma de 2+2 é igual a <%= 2+2 %>
```

!
@ google it

Tudo dentro do jsp para dentro do método de serviço.
(e como você não pode ter método dentro de método, você não pode criar método dentro da página jsp)

explicou <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

acessar usando http://localhost:8080/Exercicios-2017-2/

imaginar jsp como uma classe java 

problema de varias thread acessando a mesma variavel (variavel compartilhada)

https://en.wikipedia.org/wiki/JavaServer_Pages
