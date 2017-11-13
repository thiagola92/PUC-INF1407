# Ajax
(**A**synchronous **J**avascript **A**nd **X**ML)  
Ajax permite você fazer pedido para o servidor, você não precisa mais pedir uma página pronta, você pode apenas fazer um pedido por uma certa informação (XML).  

Usamos o protocolo HTTP para passar informação do server para o cliente, no nosso caso estaremos passando um arquivo XML.  

## XMLHttpRequest
O objeto que faz toda a transição de informação e trata a informação recebida é o **XMLHttpRequest**, incluido em todos os browsers modernos.  
```Javascript
var xmlhttp;
xmlhttp = XMLHttpRequest();
```

O que pode ocorrer é o navegador não ser compatível, por isso precisamos usar try e catch.  
```Javascript
var xmlhttp;

try {
  xmlhttp = XMLHttpRequest();
} catch(exception) {
  // Já que não tem o objeto XMLHttpRequest, você deve estar usando um navegador antigo tipo IE6.  
  xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
  try {
    // Se chegou aqui você deve estar usando algo ancestral tipo IE5
    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  } catch(exception) {
    // Navegador não compatível
    xmlhttp = null;
  }
}
```

O professor provavelmente vai querer que você escreva com esses try e catchs pois você tem que tratar pessoas com esses navegadores. Mas para facilitar nossa vida irei apenas usar o primeiro método que mostrei, vou supor que seu navegador é recente.  

## open & send
Como que você deixa claro que informação você quer do servidor? Usando a função **open** do objeto XMLHttpRequest. Nessa função você passa 3 argumentos:  
* String: uma string que diz se é GET ou POST.
* String: uma string que diz o arquivo que você quer receber do server.
* Boolean: se a comunicação é sincronizada ou assincronizado (não se precupe muito com isso).  

```Javascript
var HttpRequest = new XMLHttpRequest();
HttpRequest.open("GET", "nomeDoArquivo.txt", true);
```

O objeto HttpRequest tem a informação de qual arquivo quer abrir, mas essa função ainda não enviou o pedido. Para enviar o pedido para o servidor vamos precisar da função **send**.  
A função send pode ou não receber argumentos, pedidos GET não precisam de argumentos ou você pode passar null `send() == send(null)`.  
Se for POST precisa passar argumentos, veremos isso mais tarde.  

```Javascript
var HttpRequest = new XMLHttpRequest();
HttpRequest.open("GET", "nomeDoArquivo.txt", true);
HttpRequest.send();
```

Nós preparamos o pedido e enviamos o pedido... Mas não coletamos a resposta do pedido, veremos isso a seguir.  

## onreadystatechange
No objeto XMLHttpRequest você tem uma função que é chamada toda hora que o estado do pedido mudar.  
Se você já definiu qual o tipo do pedido, ou seja, chamou `open()`.  
Se você já enviou o pedido para o server, ou seja, chamou `send()`.  
Se você está recebendo dados do server, ou seja, `responseText` tem algum pedaço de informação.  
Se você já recebeu tudo e está pronto, ou seja, `responseText` já tem toda a informação que o server queria te passar.  

A função em `onreadystatechange` é chamada sempre que mudar de qualquer um desses estados para outro.  
