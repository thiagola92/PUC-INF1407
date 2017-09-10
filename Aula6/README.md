# Aula 6
Request/formulário são maneiras de transportar informação de uma página para a outra.
Mas a página que você está indo só sabe informações passadas pela página que você veio.  

Agora iremos ver maneiras de armazenar informação para o usuário.  

Já tinhamos visto usando variáveis de classe e método.  
```JSP
<%!
int variavel_da_classe = 0;
%>

<%
int variavel_do_metodo = 0;
%>

<%=variavel_da_classe %><br/>
<%=variavel_do_metodo %><br/>

<%
variavel_da_classe++;
variavel_do_metodo++;
%>
```

Cada usuário que acessar essa página vai incrementar a variavel de classe e método, mas a de método vai zerar toda hora e a de classe vai incrementar normalmente.  
Já deve ter notado que não é uma boa maneira de armazenar informações para o usuário, um deles nem armazena e outro armazena o mesmo para todos.  
(Por enquanto vou ignorar o synchronize para que o código fique menos sujo)

## Session
Session armazena informação no server até que você fechar o browser ou fique ausente por muito tempo, você pode acessar as informações da session do usuário de qualquer página do server.  

Da mesma maneira que request podia passar objetos de uma página para a outra, session também vai armazenar objetos, ou seja, você vai usar  
`session.getAttribute("exemplo");`  
Para pegar o objeto.  

Da mesma maneira que request, você tem que saber o tipo do objeto que quer receber  
`Integer variavel_da_session = (Integer)sesssion.getAttribute("exemplo");`  

Da mesma maneira que request, se não existir objeto, retorna null  
```JSP
Integer variavel_da_session = (Integer)session.getAttribute("variavel");
if(variavel_da_session == null)
	variavel_da_session = 0;
```

Para armazenar você faz como se estivesse gravando o objeto novamente  
`session.setAttribute("variavel", variavel_da_session+1);`

O que é session exatamente? É um cookie armazenado no navegador, por isso ao fechar ele o **cookie** é destruido. Além disso o cookie tem a duração padrão de 20 minutos.
