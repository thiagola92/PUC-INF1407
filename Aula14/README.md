# Javascript
Não vou passar pelo básico de programação pois custaria muito tempo. Nem de html ou css.  

## Usando javascript
Um código html normalmente é assim  

pagina.html
```HTML
<html>
  <head>
  
  </head>
  <body>
  
  </body>
</html>
```

Você apenas começa a usar javascript se for dentro da tag `<script>`  

pagina.html
```HTML
<html>
  <head>
  <script>
    var a = 10;
    var b = 20;
    var c = a + b;
    alert(c);
  </script>
  </head>
  <body>
  
  </body>
</html>
```

Como não fica nada elegante e pode deixar desorganizado, tentamos sempre separar o código html do código javascript, para isso declaramos na tag `<script>` onde está o código javascript que vamos ler.  

pagina.html  
```HTML
<html>
  <head>
  <script src="codigo.js">
  </script>
  </head>
  <body>
  
  </body>
</html>
```

codigo.js
```javascript
var a = 10;
var b = 20;
var c = a + b;
alert(c);
```

(src é abreviação para source)  
(o formato de código javascript é **.js**)  
Agora no inicio da página html ele copia tudo no arquivo **codigo.js** para dentro da tag `<script>`.  

Em javascript você pode mandar mensagens para o navegador, como se fossem printf. Para ver ela precisa estar em "developer tools" do navegador (F12 no chrome)   
```javascript
console.log("mensagem que vai aparecer no navegador");
```


## Eventos
Quando um determinado evento ocorre, ele chama uma função relacionado a esse evento.  
Para ver a lista completa de eventos: [Eventos](https://www.w3schools.com/jsref/dom_obj_event.asp)  

Sempre que quisermos que algo aconteça após um evento, relacionamos uma função a esse evento.  

pagina.html  
```html
<p onclick="nomeDoMetodo">Texto qualquer</p>
```

codigo.js
```javascript
function nomeDoMetodo() {
  // codigo
}
```

Como não queremos deixar coisas relacionadas a javascript na página html, o professor quer que não use `onclick="nomeDoMetodo"` já que chama uma função do javascript. Ele quer que seja mais discreto.  

Para isso vamos usar o evento onload que faz algo acontecer assim que a página termina de carregar. Vamos criar uma função inicia e chamar ela quando terminar de carregar.  

codigo.js
```javascript
onload = inicia;

function inicia() {
  // codigo
}
```

Agora como iremos fazer um certo elemento html ter um evento? Teremos que referênciar esse elemento de alguma maneira, usaremos o atributos id.  

pagina.html
```html
<p id="asdf">Texto qualquer</p>
```

codigo.js
```javascript
onload = inicia;

function inicia() {
  var objeto = document.getElementById("asdf");
  objeto.addEventListener("click", doSomething);
}

function doSomething() {
  // codigo
}
```

Dependendo de qual atributo você for usar, vai ter que usar outra função para pegar o objeto.  

pagina.html
```html
<p id="asdf">Texto 1</p>
<p class="qwer">Texto 2</p>
<p name="zxcv">Texto 3</p>
```

codigo.js
```javascript
onload = inicia;

function inicia() {
  var objeto = document.getElementById("asdf");
  objeto.addEventListener("click", doSomething);
  
  var objeto = document.getElementsByClassName("asdf");
  objeto[0].addEventListener("click", doSomething);
  
  var objeto = document.getElementsByName("asdf");
  objeto[0].addEventListener("click", doSomething);
}

function doSomething() {
  // codigo
}
```

Qual a diferença dos 3?  

### id
É abreviação para identity(identidade) e apenas um elemento pode ter a identidade desse atributo, ou seja, se tiver `id="thiago"` em uma tag, nenhuma outra pode ter. É usado para você referênciar aquela tag especifica.  
```html
<p id="carro">fusca</p>
<p id="lugar">rio</p>
<p id="nome">thiago</p>
```
Quando você quiser pegar essas informações você pega com  
```javascript
var objeto = document.getElementById("carro");
var objeto = document.getElementById("lugar");
var objeto = document.getElementById("nome");
```

### class
Varios elementos pode ter a mesma classe, você deve usar isso para agrupar tags parecidas que você quer acessar ao mesmo tempo no futuro.  
```html
<p class="nome">Thiago</p>
<p class="nome">Pedro</p>
<p class="nome">Hardman</p>
```
Quando você quiser pegar essas informações você pega com  
```javascript
var objeto = document.getElementsByClassName("nome");
for(i=0; i < objeto.length; i++) {
  // agora você acessa elemento com objeto[i]
  // basta ver o exemplo lá em cima de adicionando eventos
}
```

### name
HTML5 parou de usar, pois você consegue fazer as mesmas coisas dele com id/class... então não use ao menos que falem "use name pq eu sou um bosta".  

### 4? tag
Pegar todos os objetos com a tag daquele nome.  
```javascript
var objetos = document.getElementsByTagName("br");
```

Parecido com o pegar class mas agora você pega todos que usam a mesma tag.  

### addEventListener
É uma função de todos os objetos html, equivale a adicionar um atributo do tipo `onclick`,`onmousedown`, `onmouseenter`... Os dois parametros dessa função são o **evento** e a **função** que vai ser chamada quando o evento ocorrer.  
```javascript
var objeto = document.getElementById("carro");
objeto.addEventListener("mousedown", funcao);
```

Note que diferente do html que você escreve  
```html
<p onclick="funcao">asdf</p>
```

No javascript você não precisa do prefixo **on**  
```javascript
objeto.addEventListener("click", funcao);
```

## Atributos html pelo javascript
Qualquer objeto que você obteu pelo getElementById ou getElementsByClassName retornam um objeto que representa aquela tag e tudo dentro. Você consegue pegar as informações da tags fácilmente pois são variáveis dentro dos objetos.  

```html
<p id="texto1" class="cu" onclick="asdf">qualquer texto</p>
```

Você pode acessar essas informações dentro da tag  
```javascript
var objeto = document.getElementById("texto1");

console.log(objeto.id);  // vai printar "texto1"
console.log(objeto.class);  // vai printar "cu"
console.log(objeto.onclick);  // vai printar "function onclick(event) { }"
```

E pode ter objetos dentro de objetos, por exemplo, o atributo html `style` é um objeto com outras variáveis.  
```html
<p style="background-color: green">qualquer texto</p>
```

```javascript
var objeto = document.getElementById("texto1");
console.log(objeto.style);  // vai printar "[object CSSStyleDeclaration]"
console.log(objeto.style.backgroundColor);  // vai printar "green"
```

Esse é um bom momento para falar de como javascript acessa seus valores do objeto. Você fazer  
`objeto.valor`
É igual a  
`objeto["valor"]`

As duas maneiras em javascript faz ele procurar pela variavel com aquele nome. Em outras palavras   
```javascript
var objeto = document.getElementById("texto1");
console.log(objeto.style.backgroundColor);  // vai printar "green"
console.log(objeto["style"].backgroundColor);  // vai printar "green"
```

Mas note que "<p style="**background-color**: green">qualquer texto</p>" tem um sinal de menos no meio do nome. Em programação sinal de menos é subtração e isso causaria mal entendido, ou seja, você não pode fazer  
```javascript
var objeto = document.getElementById("texto1");
console.log(objeto.style.background-color);  // vai printar "green"
```

Mas como você já viu antes, nós acessamos esse valor com "backgroundColor", ou seja, todo nome que teria o sinal de menos vai poder ser acessado tirando o sinal de menos e tornando a proxima letra maiuscula.  
```javascript
var objeto = document.getElementById("texto1");
console.log(objeto.style.backgroundColor);  // vai printar "green"
```

MAS VOCÊ AINDA PODE ACESSAR PELA A OUTRA MANEIRA, POIS NA OUTRA MANEIRA VOCÊ PASSA UMA STRING IDENTIFICANDO O ATRIBUTO E STRINGS PODEM TER -  
```javascript
var objeto = document.getElementById("texto1");
console.log(objeto.style.backgroundColor);  // vai printar "green"
console.log(objeto.style["background-color"]);  // vai printar "green"
```

E EU ESTOU GRITANDO POIS N AGUENTO MAIS ESSE DETALHE, PRA TERMINAR, VOCÊ PODE PASSAR COMO STRING O NOME SEM O SINAL -   
```javascript
var objeto = document.getElementById("texto1");
console.log(objeto.style.backgroundColor);  // vai printar "green"
console.log(objeto.style["background-color"]);  // vai printar "green"
console.log(objeto.style["backgroundColor"]);  // vai printar "green"
```

Ou seja, divirta-se   
```javascript
var objeto = document.getElementById("texto1");
console.log(objeto.style.backgroundColor);  // vai printar "green"
console.log(objeto.style["background-color"]);  // vai printar "green"
console.log(objeto.style["backgroundColor"]);  // vai printar "green"
console.log(objeto["style"]backgroundColor);  // vai printar "green"
console.log(objeto["style"]["background-color"]);  // vai printar "green"
console.log(objeto["style"]["backgroundColor"]);  // vai printar "green"
```

## Time
Existe maneiras de fazer uma função ser chamada depois de X segundos. As duas funções responsáveis por isso é `setInterval()` `setTimeout()`  
**setInterval()**: Vai chamar a função A CADA X milisegundos.  
**setTimeout()**: Vai chamar a função DEPOIS de X milisegundos.  

A primeira vai ficar chamando sem parar, a outra chama uma vez.  

```javascript
setInterval(dizAlgo, 3000);

function dizAlgo() {
  console.log("algo");
}
```

Depois de 3 segundos(3000ms) vai rodar a função dizAlgo, depois vai esperar 3 segundos novamente e rodar a função dizAlgo, depois vai esperar 3 segundos novamente e rodar a função dizAlgo.......    

```javascript
setTimeout(dizAlgo, 3000);

function dizAlgo() {
  console.log("algo");
}
```

Depois 3 segundos(3000ms) vai rodar a função dizAlgo. Fim  

Ambas funções tem uma função que cancela elas(faz o contador de tempo parar) `clearInterval` e `clearTimeout`.   
