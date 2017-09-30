# Aula 11

## Expression Language
Além da maneira usando as tags JSP `<jsp:useBean />`, `<jsp:getProperty/>` e `<jsp:setProperty/>`, existe a expression language, que foram feitas para facilitar o acesso às variáveis.  

Na aula anterior vimos que podiamos simplificar código Java com as tags JSP  
```JSP
<%

Bean bean = (Bean)session.getAttribute("bean");
if(bean == null) {
	bean = new Bean();
	session.setAttribute("bean", bean);
}
%>
```
----
```JSP
<jsp:useBean id="bean" class="pacote.Bean" scope="session"></jsp:useBean>
```
----
Agora em Expression Language, não precisamos nem declarar isso. Podemos pular direto para já pegar a informação.  

## Pegando informações

Usando Java  
```JSP
<%

Bean bean = (Bean)session.getAttribute("bean");
if(bean == null) {
	bean = new Bean();
	session.setAttribute("bean", bean);
}
%>

<%= bean.getNome() %>
```
----
Usando tags JSP  
```JSP
<jsp:useBean id="bean" class="pacote.Bean" scope="session">
O objeto Bean foi criado em session com sucesso
</jsp:useBean>

<jsp:getProperty name="bean" property="nome" />
```
----
Usando Expression Language
```JSP
${bean.nome}
```

Expression Language parece bastante com java, pois dentro das chaves você acessa a variável como se estivesse no código Java.  
Por que o acesso é mais rápido com Expression Language? Porque usando esse método, você não escolhe **escopo**, ou seja, você não escolhe se quer a variável da página ou request ou session ou application.
O computador "chuta" o que você quer, ou seja, te da o primeiro que achar. Sendo que ele procura nessa ordem:  
* PageContext
* Request
* Session
* Application

Mas se você quiser escolher escopo, você pode. Ele reserva 4 objetos com as variáveis de cada um:  
* pageScope
* requestScope
* sessionScope
* applicationScope

Ou seja, se você quiser acessar cada um deles basta acrescentar no inicio esses objetos.  
```JSP
${pageScope.bean.nome}
${requestScope.bean.nome}
${sessionScope.bean.nome}
${applicationScope.bean.nome}
```

Expression Language também utiliza o padrão JavaBeans para saber o que acessar, ou seja, `${bean.nome}` vai tentar procurar `bean.getNome();`.  
