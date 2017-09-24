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
variavel_da_session++;
```

Para armazenar você faz como se estivesse gravando o objeto novamente  
`session.setAttribute("variavel", variavel_da_session);`

O que é session exatamente? É um cookie armazenado no navegador, por isso ao fechar ele o **cookie** é destruido. Além disso o cookie tem a duração padrão de 20 minutos.

## Application
Application armazena no server, para que todas páginas possam acessar se procurarem por um certo atributo.  
A maneira de usar é a mesma da session, ou seja, você armazena objetos e pega objetos. Para pegar basta usar   
`application.getAttribute("exemplo");`  

Da mesma maneira que session e request, você tem que dizer o tipo do objeto que quer receber (fazer uma conversão)  
`Integer variavel_da_application = (Integer)application.getAttribute("exemplo");`  

Da mesma maneira que session e request, se o objeto não existir, retorna null  
```JSP
Integer variavel_da_application = (Integer)application.getAttribute("exemplo");
if(variavel_da_application == null)
	variavel_da_application = 0;
variavel_da_application++;
```

Para armazenar você faz como se tivesse gravando o objeto novamente  
`application.setAttribute("variavel", variavel_da_application);`  

Mas qual é o grande problema de application? Thread.  
Muitas pessoas querendo acessar a mesma informação ao mesmo tempo e alterar ela. Cada uma dessas pessoas podem vir de páginas diferentes, para evitar que perca a sincronização iremos usar synchronized.  

Primeira opção que alguns pensam é fazer  
```JSP
Integer variavel_da_application;
synchronized(this) {
	try {
		variavel_da_application = (Integer)application.getAttribute("exemplo");
	} catch(Exception e) {
		variavel_da_application = 0;
	}
	variavel_da_application++;
	application.setAttribute("exemplo", variavel_da_application);
}
```

Da ultima vez e agora sincronizamos a classe, o que quer dizer que enquanto o servidor estivesse utilizando essa classe/página outras não poderiam utilizar.  

Outra opção é sincronizar application  
```JSP
Integer variavel_da_application;
synchronized(application) {
	try {
		variavel_da_application = (Integer)application.getAttribute("exemplo");
	} catch(Exception e) {
		variavel_da_application = 0;
	}
	variavel_da_application++;
	application.setAttribute("exemplo", variavel_da_application);
}
```

Agora não estamos prendendo a classe da página mas sim a application em si, então geramos outros problema!  
Varias páginas podem querer usar application e teriam que esperar essa página usar.  

A opção mais sensata no momento é  
```JSP
Integer variavel_da_application;
try {
	synchronized(application.getAttribute("exemplo")) {
		variavel_da_application = (int)application.getAttribute("exemplo");
		variavel_da_application++;
		application.setAttribute("exemplo", variavel_da_application);
	}
} catch(Exception e) {
	application.setAttribute("exemplo", 1);
}
```

Eu mando sincronizar o objeto que a application tem nele, ou seja, outras pessoas podem usar a classe application mas vão ser impedida de usar o objeto que você está usando no momento. Exatamente como você queria de início.  
Como apenas o que está dentro do synchronized pode acessar aquele objeto, você ainda pode acessar ele.  
