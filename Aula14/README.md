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

