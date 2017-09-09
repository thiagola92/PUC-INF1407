# Aula 3

## Thread
Para resolver o problema de thread acessar um mesmo campo por duas pessoas diferentes, nós temos que suar `synchronized`.  
Se você quiser souber como isso funciona, leia em https://docs.oracle.com/javase/tutorial/essential/concurrency/sync.html  

```JSP
<%!
int variavel_da_classe = 0;
%>

variavel_da_classe = <%=variavel_da_classe%> <br/>

<%
synchronized(this) {
  variavel_da_classe++;
}
%>
```

Basicamente o synchronized probi outros processos de acessarem o que estiver dentro do parênteses enquanto o tiver um processo dentro.  
Ou seja, quando um processo chega na linha do synchronized ele proibi os outros processos de acessarem até ele sair da linha do synchronized. Os processos que estão esperando ficam pausados.  

## Request e Response
Quando um usuário quer algo do nosso site, ele faz um **pedido** daquela coisa do nosso site.  
Nós respondemos ele com uma **resposta**.  
Se você sabe inglês sabe que  
pedido == request  
resposta == response  

E é atráves da variável **request** vamos acessar qualquer informação que o usuário tenha nos passado pelo pedido.  
E é pelo **response** que vamos mandar informações para o usuário.  
![request e response](request.png)

Antes de falar mais sobre request e response, vamos falar de **formulario**.  

### Formulario
Se você já usou PHP/HTML grande chance de você já ter visto formulários.  
Formulários ficam dentro da tag HTML `form`.  
```JSP
<form action="" method="">

</form>
```

Tudo dentro da tag form vai ser mandado para o server caso tenha alguma informação para enviar.  
Os dois atributos que eu deixei dentro do form são importantes pois  
`action` diz a página para onde você vai ser redirecionado e para onde você vai enviar tudo no formulário.  
`method` diz o como você vai enviar as informações, ou seja, **get** ou **post**.  

Um formulário simples seria  
```JSP
<form action="recebeFormulario.jsp" method="get">
  <input type="text">
  <input type="submit">
</form>
```

Isso criaria algo do tipo  
![Formulario simples](formulario.PNG)

Ao pressionar o botão você enviaria um request para a página "./recebeFormulario.jsp" e as informações que tivermos para enviar para a página seriam enviadas.  
Mas como um formulário sabe o que é para enviar?  
Ele envia tudo que tiver o atributo **name**.  

Então se queremos enviar o texto que o usuário escrever na caixa, devemos dar um nome a ela  
```JSP
<form action="recebeFormulario.jsp" method="">
  <input type="text" name="exemplo">
  <input type="submit">
</form>
```

#### Get
get passa tudo pelo url, vamos supor que seu código é   
```JSP
<form action="recebeFormulario.jsp" method="get">
  <input type="text" name="exemplo">
  <input type="submit">
</form>
```

Agora suponha que você escreveu na caixa "Thiago".  
Ao clicar em enviar, vai direcionar você para o url "./recebeFormulario.jsp?**exemplo**=**Thiago**".  
Se seu formulário tiver mais que uma informação para enviar, essa informação vai ficar separada por um & no link.  
```JSP
<form action="recebeFormulario.jsp" method="get">
  <input type="text" name="exemplo">
  <input type="text" name="exemploDois">
  <input type="text" name="exemplo3">
  <input type="submit">
</form>
```

Agora imagine que escreveu em cada uma das caixas "Thiago", "Leo" e "Matheus", nessa respectiva ordem.  
Você vai mandar você para o url "./recebeFormulario.jsp?exemplo=Thiago&exemploDois=Leo&exemplo3=Matheus".  

Lado positivo de usar get: Você só precisa salvar o link da página para acessar ela da mesma forma que tinha acessado, ou seja, você pode salvar no favorito para acessa-la a qualquer momento dessa mesma maneira.  
Lado negativo de usar get: Toda informação é visível para quem tiver o link, ou seja, você não quer deixar informação como senha dentro de um formulário com get, pois qualquer um vendo o link conseguiria sua senha.  

#### Post
post **não** passa nada por url. Totalmente o oposto de get.  
```JSP
<form action="recebeFormulario.jsp" method="post">
  <input type="text" name="exemplo">
  <input type="submit">
</form>
```

Esse código vai manda-lo para a página "./recebeFormulario.jsp". Nada vai aparecer no url, não importa quantas informações você quer passar.  

Lado positivo de usar get: Toda informação **não** é visível para quem tiver o link, ou seja, você quer deixar informação como senha dentro de um formulário com post.  
Lado negativo de usar get: Você **não** pode salvar no favorito para acessa-la a qualquer momento da mesma maneira, ou seja, não é suficiente apenas ter o link para a página para reproduzir o que você fez da ultima vez.  

## Request e Response
Você viu duas maneiras do usuário mandar informações para o server (get e post). Mas ambas são lidas da mesma maneira pelo server, usando a variável `request`. Agora em diante vou chamar request de objeto, pois é um objeto (tem métodos e variáveis dentro dele).  

Um desses métodos é `getParameter(String name)` e ele é usado para pegar qualquer informação passada por get/post de um formulário.  
```JSP
<%
String texto = request.getParameter("exemplo");
%>
```

Não importa se é get ou post, pegar informação de formulário é a mesma maneira.  
Se o campo não for preenchido ou não existir `request.getParameter()` retorna null. Sabendo disso você consegue saber se o usuário preencheu.  

---

Extra: Importante avisa-lo sobre **checkbox** em formulários.  

Diferente da caixa de texto e outros que se você não botar nada dentro vai enviar `exemplo=` e nada depois, checkbox apenas enviam se for marcada. Por exemplo:  
```JSP
<form action="recebeFormulario.jsp" method="post">
  <input type="text" name="exemplo">
	<input type="checkbox" name="exemploCheckbox"/>
  <input type="submit">
</form>
```

Se você clicar para enviar sem escrever nada no campo de texto e nem clicar na checkbox, você vai ser mandado para `recebeFormulario.jsp?exemplo=`.  
Agora se você escrever algo apenas no campo de texto, por exemplo "thiago" vai ser mandado para `recebeFormulario.jsp?exemplo=thiago`.  
Note como a checkbox não aparece de maneira nenhuma se você não clicar! Agora se você clicar nela ela vai aparecer como `recebeFormulario.jsp?exemploCheckbox=on` ou se você escreveu "thiago" `recebeFormulario.jsp?exemplo=thiago&exemploCheckbox=on`.  
Não vale a pena pegar o valor de exemploCheckbox, ou seja, você não precisa fazer   
```JSP
<%
String resposta = request.getParameter("exemploCheckbox");
if(resposta.equals("on")) {
  // code
}
%>
```

Você consegue saber se está marcado simplesmente conferindo se retorna null, ou seja,   
```JSP
<%
if(request.getParameter("exemploCheckbox") != null) {
  // code
}
%>
```
