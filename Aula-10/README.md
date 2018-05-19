# Aula 10

## JavaBeans
É nada mais uma classe que vai armazenar informações. Essa classe vai ser passada de um lado para o outro, para pegar as informações dela.  
Eu vou de etapa por etapa explicando a criação de um Bean.

Como falei Bean é nada mais que uma classe que você vai utilizar para transferir informação.  
Incluimos um construtor vazio pois ele que vai ser invocado quando o objeto for criado.  
```Java
public class Bean {

  public Bean() {
  
  }
  
}
```

Adicionamos uma propriedade "nome" como private, mas não faria diferença no nosso caso ser private/public, pois a tag JSP **não** vai tentar acessar a variável diretamente, ela vai tentar acessar por um método.  
Nesse exemplo abaixo a página JSP não iria conseguir acessar o nome.  
```Java
public class Bean {
	
	private String nome;

	public Bean() {
		
	}
	
}
```

Se a tag JSP quiser acessar a propriedade nome, ela vai procurar getNome() e setNome(). Por convenção é assim que ela tentar achar a variável. Então se você quiser que ela acesse nome, você deve acrescentar getNome() e setNome().  
```Java
public class Bean {
	
	private String nome;

	public Bean() {
		
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
}
```
Note que a convenção escolhida foi de botar get/set e depois o nome da variável com a inicial em maiscúla.  
As propriedades: `dia`, `nomeDaRua`, `nome_thiago`  
Seriam pegar pelos métodos: `getDia()`, `getNomeDaRua()`, `getNome_thiago()`  

## Tag JSP
O mótivo de estarmos seguindo convenções na hora de criar classe é porque as tags JSP vão tentar facilitar nosso trabalho.  

```JSP
<jsp:useBean> </jsp:useBean>
```

Imagine que temos um arquivo cheio de métodos para facilitar nosso trabalho, o arquivo se chama "jsp" e nesse caso em cima o método "useBean". JSP tem varios métodos  

```JSP
<jsp:useBean> </jsp:useBean>
<jsp:setProperty/>
<jsp:getProperty/>
...
```

Por que usar elas? Normalmente no arquivo JSP, se quisessemos usar o objeto Bean que criamos antes teriamos que fazer algo do tipo  
```JSP
<%@ page import="pacote.Bean"%>
...
<%

Bean bean = (Bean)session.getAttribute("bean");
if(bean == null) {
	bean = new Bean();
	session.setAttribute("bean", bean);
}
%>
```

A tag `<jsp:useBean>` abrevia toda essa operação para  
```JSP
<jsp:useBean id="bean" class="pacote.Bean" scope="session"></jsp:useBean>
```

Falando dos parametros passados  
**id**:  
Nome da variável (nome que você ta dando para ela no código).  
**class**:  
Classe, tipo da variável. Importante dizer o local exato, ou seja, incluir pacote.  
**scope**:  
Aonde você está botando esse objeto, as opções são page, request, session e application.    
session `session.setAttribute("bean", bean)`  
application `applicaiton.setAttribute("bean", bean)`  
request `request.setAttribute("bean", bean)`  
page `Bean bean = new Bean()`  

Detalhe, tudo dentro da tag `<jsp:useBean>` só vai ocorrer se o objeto tiver sido criado, caso já existisse antes não vai ocorrer.  
```JSP
<jsp:useBean id="bean" class="pacote.Bean" scope="session">
O objeto Bean foi criado em session com sucesso
</jsp:useBean>
```

Agora que estamos usando as tags JSP, como vamos acessar o objeto? Usaremos mais tags JSP.  
```JSP
<jsp:useBean id="bean" class="pacote.Bean" scope="session">
O objeto Bean foi criado em session com sucesso
</jsp:useBean>

<jsp:getProperty name="bean" property="nome" />
```

Note que nunca vai ocorrer problema pois o `<jsp:useBean>` vai criar o objeto se ele não existir e se ele já existir o `<jsp:getProperty />` vai pegar sem problema.  

Os parametros do `<jsp:getProperty />`  
**name**: Nome do objeto dado por você.  
**property**: Nome da propriedade, no nosso caso "nome".  

Note que as tags JSP são MUITO rigorosas, ou seja, `<jsp:getProperty />` precisa daquela barra no final que diz que não tem um `</jsp:getProperty>` no futuro.  
E `<jsp:useBean>` precisa da tag `</jsp:useBean>`.  

Se quisermos alterar o valor usaremos `<jsp:setProperty />`.  
```JSP
<jsp:useBean id="bean" class="pacote.Bean" scope="session">
O objeto Bean foi criado em session com sucesso
</jsp:useBean>

<jsp:setProperty name="bean" property="nome" value="matheus" />
```
Os parametros do `<jsp:setProperty />`  
**name**: Nome do objeto dado por você.  
**property**: Nome da propriedade, no nosso caso "nome".  
**value**: Novo valor.  

Observação: **property** pode receber `*`, isso vai dizer para botar em todas as propriedades do objeto.  

---
Note que   

`<jsp:getProperty name="bean" property="nome" />`
É equivalente a fazer  
`<%= bean.getNome() %>`

`<jsp:setProperty name="bean" property="nome" value="matheus" />`
É equivalente a fazer  
`<% bean.setNome("matheus")%>`

