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
<jsp:setProperty> </jsp:setProperty>
<jsp:getProperty> </jsp:getProperty>
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

