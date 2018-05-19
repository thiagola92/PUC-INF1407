# Aula 5
O foco nessa aula é dizer que podemos usar as classes que criarmos, no nosso site. Na aula criamos uma classe Erro para justamente armazenar as informações do erro que ocorreu.  

Para importar a classe você vai precisar fazer import e se você esqueceu, import é feito usando @.  
```JSP
<%@ page import=""%>
```

Usamos a página confere.jsp para justamente conferir se tem algum erro, se tiver vai criar a classe Erro e mandar para a página que mostra o erro.  

## Request Attribute
Como vimos já em aulas passadas podemos passar request a diante com
```JSP
request.getRequestDispatcher("exemplo.jsp").forward(request, response);
```

Se a página tiver passado informação por um formulário você pegaria usando  
`request.getParameter()`  
Mas nem sempre queremos enviar coisas por formulário, as vezes não queremos nem esperar o usuário apertar um botão para enviar.  
Nessa aula, se tiver algum erro na página queremos já enviar para outra pasta com informações sobre o erro.  

Podemos botar em um request um atributo, ou seja, um objeto. Para isso usamos  
`request.setAttribute(String name, String object)`  
E para pegar usamos  
`request.getAttribute(String name, String object)`  

Provável que tenha que fazer uma conversão para o tipo do objeto.  
```JSP
<%
TipoObjeto obj = (TipoObjeto)request.getAttribute(String name, String object);
%>
```

Note que atributos podem ser botados em request mas parametros(as coisas vindo de formulários) não podem.  
