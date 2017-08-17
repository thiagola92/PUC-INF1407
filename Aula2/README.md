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

### `<%= %>`  
Transforma o conteúdo dentro em uma String, apenas se possível.  
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

O que acontece é que o valor dentro do `<%=` e `%>` é convertido para String.  
O que importa é que o valor que sobrar dentro dessas tags vai ser convertido para String, ou seja, você pode usar funções ou até operador ternario (pois ele retorna um valor no final, igual a funções).  
```JSP
A soma de 2+2 é igual a <%= 2 %> <br/>
A soma de 2+2 é igual a <%= 2+2 %> <br/>
A soma de 2+2 é igual a <%= 2==2 %> <br/>
A soma de 2+2 é igual a <%= 2==3 %> <br/>
A soma de 2+2 é igual a <%= 1==1 ? 0 : 10 %> <br/>
A soma de 2+2 é igual a <%= Math.random() %> <br/>
```

Uma maneira mais fácil de pensar é que todo código  
```JSP
<%= VALOR %>
```

É traduzido para
```Java
out.print(VALOR);
```

**Se não for um valor então não tem como printar dessa maneira**
```JSP
A soma de 2+2 é igual a <%= int funcao(int n) { return 10 } %> <br/>
```
Isso vai dar erro pois você esta tentando converter para String uma declaração de função.

### `<%! %>`
Lembre que eu falei para encarar todo código dentro do JSP como se estivesse dentro de um método.  
Então como você declararia uma outra função? Se você acha que seria da mesma maneira que fizemos o resto, você está enganado.  
O exemplo seguinte mostra como isso **não está certo**.  
```JSP
<%
int somar(int a, int b) {
  return a+b;
}
%>
```

Convertendo para Java como vimos na aula 1  
```Java
int somar(int a, int b) {
  return a+b;
}
```

Agora lembrando que isso esta dentro de um método como vimos no inicio  
```Java
class ClasseName {

  public void functionName() {
  
    int somar(int a, int b) {
      return a+b;
    }
    
  }
  
}
```

Notou algo de errado? Dentro de uma função você não pode declarar outra função.  
Por isso que foi criada uma tag especial para declarar coisas no lado de fora da função.  
```JSP
<%!
int variavel_fora = 5;

int numeroX(int x) {
  return x;
}
%>
```

Tudo declarando dentro dessa tag será adicionado no lado de fora da função.  
Vamos supor que você tem o seguinte código.  
```JSP
<%!
int variavel_fora = 5;

int numeroX(int x) {
  return x;
}
%>
<%
int variavel_dentro = 10;
%>

<%=variavel_fora%> <br/>
<%=variavel_dentro%> <br/>
<%=numeroX(variavel_fora)%> <br/>
```

Convertendo para Java vai ficar
```Java
class ClasseName {
  
  int variavel_fora = 5;
  
  int numeroX(int x) {
    return x;
  }

  public void functionName() {
    int variavel_dentro = 10;
    
    out.print(variavel_dentro);
    out.print(numeroX(variavel_fora));
  }
  
}
```

### `<%@ %>`
@ google it

Tudo dentro do jsp para dentro do método de serviço.
(e como você não pode ter método dentro de método, você não pode criar método dentro da página jsp)

explicou <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

acessar usando http://localhost:8080/Exercicios-2017-2/

imaginar jsp como uma classe java 

problema de varias thread acessando a mesma variavel (variavel compartilhada)

https://en.wikipedia.org/wiki/JavaServer_Pages
