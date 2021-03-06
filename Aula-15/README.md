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
Então a primeira coisa que precisamos fazer é criar uma função que vai ser chamada no lugar do `onreadystatechange`.  

```Javascript
var httpRequest = new XMLHttpRequest();

httpRequest.onreadystatechange = function() {
  // Essa função vai ser chamda sempre que ouver mudança no estados
}

httpRequest.open("GET", "nomeDoArquivo.txt", true);
httpRequest.send();
```

Note que eu escrevi o código de forma que enviar seja a ultima coisa, pois seria um problema se o server começasse a responder a você ainda não tivesse a função para tratar a resposta.  

Note que essa função é chamada em vários momentos, por exemplo, quando você chamou `open`. O que isso quer dizer? Não necessariamente aquele método vai ser chamado quando o cliente receber informação mas em varios estágios diferentes. O que iremos ver em seguida é como saber se já terminou de receber as informações.  

## readyState & status
O objeto XMLHttpRequest tem dois atributos que armazenam o estado do pedido.  
Primeiro **readyState**, esse atributo armazena o estado do request, um número indo de 0 até 4.  

| Número | O que ocorreu                       |
| ------ | ----------------------------------- |
| 0      | `XMLHttpRequest` foi criado         |
| 1      | `open()` foi chamado                |
| 2      | `send()` foi chamado                |
| 3      | `responseText` está recebendo dados |
| 4      | Finalizado                          |

Se você quiser ver mais sobre isso: [XMLHttpRequest.readyState](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/readyState)  

Agora podemos verificar se toda essa transmissão terminou  

```Javascript
var httpRequest = new XMLHttpRequest();

httpRequest.onreadystatechange = function() {
  if(httpRequest.readyState == 4) {
    // Terminou de receber informação
  }
}

httpRequest.open("GET", "nomeDoArquivo.txt", true);
httpRequest.send();
```

Agora vamos falar de **status**, esse atributo armazena o status da transmissão, ou seja, se tudo ocorreu bem ou se teve problemas.  
Se quiser ver todos os status: [mozilla](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) ou [w3schools](https://www.w3schools.com/tags/ref_httpmessages.asp)  

O número que mais nos interessa é o 200, que quer dizer "OK", informação chegou com sucesso.   
Alterando nosso código para que apenas faça coisa que tudo estiver acontecido sem problema.  

```Javascript
var httpRequest = new XMLHttpRequest();

httpRequest.onreadystatechange = function() {
  if(httpRequest.readyState == 4) {
    if(httpRequest.status == 200) {
      // Tudo aconteceu como o esperado, podemos tratar agora a informação recebida
    }
  }
}

httpRequest.open("GET", "nomeDoArquivo.txt", true);
httpRequest.send();
```

## responseText
Agora que conseguimos enviar e saber que a resposta foi recebida, vamos pegar essa informação recebida no atributo **responseText** (também falaremos do **responseXML**).  
Como responseText devolve uma string, que é o texto recebido, basta você pegar essa string e usar como desejado.  

```Javascript
var httpRequest = new XMLHttpRequest();

httpRequest.onreadystatechange = function() {
  if(httpRequest.readyState == 4) {
    if(httpRequest.status == 200) {
      var texto = httpRequest.responseText;
      
      console.log(texto);
    }
  }
}

httpRequest.open("GET", "nomeDoArquivo.txt", true);
httpRequest.send();
```

## HTML data-*  
Em html existe um atributo que foi criado justamente para você "criar" atributos. Todo atributo que começa com **data-** é um atributo especial que você pode dar o nome dele depois do hífen.  

```Html
<h1 data-tamanho="grande" id="a"></h1>
<br data-coco="3" id="b"></br>
<div data-idade="onze" id="c"></div>
```

O que isso nos traz de bom? Podemos armazenar informações nas tags.  
```Javascript
var elemento = document.getElementById("a");
console.log(elemento.getAttribute("data-tamanho")); // aparece "grande"
console.log(elemento.getAttribute("data-coco")); // aparece "3"
console.log(elemento.getAttribute("data-idade")); // aparece "onze"
```

Note que nesse caso tem que ser pego usando getAttribute (tem a opção de eu não saber como pegar sem ser assim mas não conte pra ninguém isso).  

Por que estamos falando de Html data-* ? Com isso não precisamos ficar criando id únicas ou tendo que quebrar o nome da id em pedaços para pegar qual é a tag que queremos alterar.  

Antes  
```Html
<div id="area1">Texto aleatorio</div>
<div id="area2">Texto aleatorio 2</div>
```

Agora  
```Html
<div data-num="1">Texto aleatorio</div>
<div data-num="2">Texto aleatorio 2</div>
```

Basta passar pelas tags div com getElementsByTag("div") e verificar se o getAttribute("data-num") igual ao que você quer alterar.  

## Servlet
Podemos usar ajax para pegar informação texto de um arquivo txt como já vimos antes, agora vamos usar ajax para pegar informações texto que o **servlet** vai escrever.  

Vamos começar escrevendo nosso servlet, vamos chama-lo de ServletExemplo. Ele por enquanto não faz nada.  
```Java
@WebServlet("/ServletExemplo")
public class ServletExemplo extends HttpServlet {
	private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Não faz nada
  }
}
```

Vamos escrever em javascript um pedido GET para o ServletExemplo.  
```Javascript
var httpRequest = new XMLHttpRequest();

httpRequest.onreadystatechange = function() {
  if(httpRequest.readyState == 4) {
    if(httpRequest.status == 200) {
      var texto = httpRequest.responseText;
      
      console.log(texto);
    }
  }
}

httpRequest.open("GET", "ServletExemplo", true);
httpRequest.send();
```

Pronto, agora você pode ver como a maneira de se comunicar com servlet é igual a como se comunicava com qualquer outro arquivo ou página (tirando que servlet não tem formato txt/html/jsp). Mas nesse nosso exemplo o servlet não fez NADA, ou seja, o javascript vai receber um texto vazio.  

Se você lembra de JSP e servlet, você lembra que escrever para escrever algo para o cliente você usava out.println() é como se estivesse escrevendo uma página html. Não é bem o que queremos agora, precisamos alterar o tipo para txt.   

```Java
@WebServlet("/ServletExemplo")
public class ServletExemplo extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    response.setContentType("text/plain");
    
    out.println("ola, como posso ajuda-lo?");
  }
}
```

A linha `response.setContentType("text/plain")` não é super necessária no nosso caso (acho que "text/plain" é o padrão), mas informa a quem ta recebendo o tipo de informação que vai receber.  

Lembra como se passava informação por formulário GET? Bastava botar a informação no link.  
Vamos fazer o mesmo agora, vamos passar a informação e pega-la no servlet.  
```Javascript
var httpRequest = new XMLHttpRequest();

httpRequest.onreadystatechange = function() {
  if(httpRequest.readyState == 4) {
    if(httpRequest.status == 200) {
      var texto = httpRequest.responseText;
      
      console.log(texto);
    }
  }
}

httpRequest.open("GET", "ServletExemplo?informacao=13", true);
httpRequest.send();
```
```Java
@WebServlet("/ServletExemplo")
public class ServletExemplo extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String info = request.getParameter("informacao");
    
    PrintWriter out = response.getWriter();
    out.println("voce me enviou: " + info);
  }
}
```

Aquilo de Html data-* poderia ser usado para passar informação sobre o elemento agora... Mas não vou entrar em detalhe nisso.  

### POST
Se você quer mandar um request post, você vai ter fazer:  
* Use `open()` só que POST.  
* Use `send()` mas entre o parênteses bote uma string que passa as informações (da mesma maneira que você botaria atrás do link do GET).  
* Altere o content-type para saberem que é POST.  

```Javascript
var httpRequest = new XMLHttpRequest();

httpRequest.onreadystatechange = function() {
  if(httpRequest.readyState == 4) {
    if(httpRequest.status == 200) {
      var texto = httpRequest.responseText;
      
      console.log(texto);
    }
  }
}

var passandoInformacao = "informacao=13";

httpRequest.open("POST", "ServletExemplo", true);
httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
httpRequest.send(passandoInformacao);
```

Note que é importante botar o `setRequestHeader` depois do `open`.  

Como você passaria mais que uma informação? Eu avisei que seria igual ao link no GET, ou seja, use um & para separar a informação na string.  

```Javascript
var httpRequest = new XMLHttpRequest();

httpRequest.onreadystatechange = function() {
  if(httpRequest.readyState == 4) {
    if(httpRequest.status == 200) {
      var texto = httpRequest.responseText;
      
      console.log(texto);
    }
  }
}

var passandoInformacao = "informacao=13&nome=thiago";

httpRequest.open("POST", "ServletExemplo", true);
httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
httpRequest.send(passandoInformacao);
```

Por final você recebe no servlet usando um `doPost`.  
```Java
@WebServlet("/ServletExemplo")
public class ServletExemplo extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String info = request.getParameter("informacao");
    String nome = request.getParameter("nome");
    
    PrintWriter out = response.getWriter();
    out.println("voce me enviou: " + info + ", nome: " + nome);
  }
}
```
